import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:async'; 
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailResetController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final SupabaseClient _supabaseClient = Supabase.instance.client;

  bool _isLoading = false;
  bool _isOtpSent = false;
  bool _isOtpValidated = false;
  String? _errorMessage;
  bool _obscurePassword = true;
  bool _obscureUpdatePassword = true;
  bool _obscureConfirmPassword = true;

  int _loginAttempts = 0; // Track the number of failed login attempts
  bool _isButtonDisabled = false; // Track whether the button should be disabled
  Timer? _timer; // Timer for the 5-minute countdown
  Duration _remainingTime = Duration.zero;
  int _consecutiveFailures = 0; // To track consecutive failures
  int _delayMinutes = 2; // Starting delay in minutes

  Future<void> _login() async {
    if (_isButtonDisabled) return;  

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final username = _usernameController.text;
    final password = _passwordController.text;
    final now = DateTime.now().toIso8601String();

    try {
      final userResponse = await _supabaseClient
          .from('user')
          .select('email, role')
          .eq('username', username)
          .single();

      if (userResponse == null) {
        setState(() {
          _errorMessage = "Login failed. Username does not exist.";
        });
      } else {
        final userEmail = userResponse['email'];
        final userRole = userResponse['role'];

        final authResponse = await _supabaseClient.auth.signInWithPassword(
          email: userEmail,
          password: password,
        );

        if (authResponse.session != null) {
          final user = authResponse.user;

          if (user!.emailConfirmedAt != null) {
            if (userRole == 'Administrator') {

              await _supabaseClient.from('user_logs').upsert({
                'username': username,
                'login_time': now,
              });

            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setBool('isLoggedIn', true);
            await prefs.setString('username', username);

              Navigator.pushReplacementNamed(context, '/admin', arguments: username);
            } else {
              setState(() {
                _errorMessage = "You do not have admin access.";
              });
              _handleLoginFailure();
            }
          } else {
            setState(() {
              _errorMessage = "Email is not verified. Please verify your email.";
            });
            _handleLoginFailure();
          }
        } else {
          _handleLoginFailure();
        }
      }
    } catch (error) {
      _handleLoginFailure();
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _handleLoginFailure() {
      _loginAttempts++;
      _consecutiveFailures++; // Increment consecutive failures

      if (_loginAttempts >= 6) {
        _isButtonDisabled = true; // Disable the button after 3 attempts
        _delayMinutes += _consecutiveFailures - 2; // Increment delay progressively
        _startCountdown(); // Start the countdown

        setState(() {
          _errorMessage =
            "You have exceeded the maximum number of login attempts. Please wait for the remaining time, or click 'Forgot Password' to reset your password.";
        });
      } else {
        setState(() {
          _errorMessage = "Login failed. Please check your username or password.";
        });
      }

      Timer(Duration(seconds: 10), _hideErrorMessage);
    }

    void _hideErrorMessage() {
    setState(() {
      _errorMessage = null; // Hide the error message
    });
  }


  void _startCountdown() {
    _remainingTime = Duration(seconds: _delayMinutes); // Updated delay

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _remainingTime = _remainingTime - Duration(seconds: 1);
      });
      if (_remainingTime.inSeconds <= 0) {
        timer.cancel();
        _resetLoginAttempts(); // Reset the attempts and re-enable the button
      }
    });
  }

  void _resetLoginAttempts() {
    _loginAttempts = 0;
    _isButtonDisabled = false;
    _remainingTime = Duration.zero;

    setState(() {});
  }

  Future<void> _resetPassword() async {
    final email = _emailResetController.text.trim();

    if (email.isEmpty) {
      setState(() {
        _errorMessage = "Please enter your email.";
      });
      return;
    }

    try {
      await _supabaseClient.auth.resetPasswordForEmail(email);
      setState(() {
        _errorMessage = null;
        _isOtpSent = true;
      });
      _showResetConfirmationDialog();
    } catch (error) {
      
        _showErrorDialog ("Failed to send password reset email. Please try again.");
      
    }
  }

    Future<void> _verifyOtp() async {
    final otp = _otpController.text.trim();
    final email = _emailResetController.text.trim();

    if (otp.isEmpty || email.isEmpty) {
      setState(() {
        _errorMessage = "Please enter both OTP and email.";
      });
      return;
    }

    try {
      final response = await _supabaseClient.auth.verifyOTP(
        email: email,
        token: otp,
        type: OtpType.recovery,
      );

      if (response.user != null) {
        setState(() {
          _isOtpValidated = true;
          _errorMessage = null;
        });
        _showResetPasswordDialog(); // Reopen the dialog to show new password input
      } else {
        
          _showErrorDialog ("Invalid OTP. Please try again.");
       
      }
    } catch (error) {
      
        _showErrorDialog ("Failed to verify OTP. Please try again.");
      
    }
  }

void _showErrorDialog(String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}


  Future<void> _updatePassword() async {
    final newPassword = _newPasswordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (newPassword.isEmpty || confirmPassword.isEmpty) {
    // setState(() {
      _showErrorDialog ("Please fill in both fields.");
    // });
    return;
  }

  if (newPassword != confirmPassword) {
    // setState(() {
      _showErrorDialog("Passwords do not match.");
    // });
    return;
  }

    try {
      // Update the user's password in Supabase
      await _supabaseClient.auth.updateUser(
        UserAttributes(password: newPassword),
      );

      setState(() {
        _errorMessage = null;
      });

      _showPasswordUpdateConfirmationDialog();
    } catch (error) {
      // setState(() {
        _showErrorDialog("Failed to update password. Please try again.");
      // });
    }
  }
//ang button nlng 
 void _showResetPasswordDialog() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Reset Password'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!_isOtpSent) ...[
              TextField(
                controller: _emailResetController,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),
            ],
            if (_isOtpSent && !_isOtpValidated) ...[
              SizedBox(height: 10),
              TextField(
                controller: _otpController,
                decoration: InputDecoration(labelText: 'Enter OTP'),
              ),
            ],
            if (_isOtpValidated) ...[
              SizedBox(height: 10),
              TextField(
                controller: _newPasswordController,
                obscureText: _obscureUpdatePassword,
                decoration: InputDecoration(
                  labelText: 'Enter New Password',
                  // suffixIcon: IconButton(
                  //   icon: Icon(
                  //     _obscureUpdatePassword ? Icons.visibility : Icons.visibility_off,
                  //     color: Colors.grey,
                  //   ),
                  //   onPressed: () {
                  //     setState(() {
                  //       _obscurePassword = !_obscurePassword;
                  //     });
                  //   },
                  // ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _confirmPasswordController,
                obscureText: _obscureConfirmPassword,
                decoration: InputDecoration(
                  labelText: 'Confirm New Password',
                  // suffixIcon: IconButton(
                  //   icon: Icon(
                  //     _obscureConfirmPassword ? Icons.visibility : Icons.visibility_off,
                  //     color: Colors.grey,
                  //   ),
                  //   onPressed: () {
                  //     setState(() {
                  //       _obscureConfirmPassword = !_obscureConfirmPassword;
                  //     });
                  //   },
                  // ),
                ),
              ),
            ],
          ],
        ),
        actions: [
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          ElevatedButton(
            child: Text(_isOtpValidated ? 'Update Password' : (_isOtpSent ? 'Verify OTP' : 'Reset Password')),
            onPressed: () {
              if (_isOtpValidated) {
                _updatePassword();
              } else if (_isOtpSent) {
                _verifyOtp();
              } else {
                _resetPassword();
              }
            },
          ),
        ],
      );
    },
  );
}

//kuwang pa ang button nlng

   void _showResetConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Password Reset'),
          content: Text('A password reset link has been sent to your email. Please check your inbox.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                // Instead of closing the dialog, update the state to show OTP input
                Navigator.of(context).pop(); // Close the current confirmation dialog
                setState(() {
                  _isOtpSent = true; // Show OTP input in the same dialog
                });
                _showResetPasswordDialog(); // Reopen the dialog to show OTP input
              },
            ),
          ],
        );
      },
    );
  }

  void _showPasswordUpdateConfirmationDialog() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Password Updated'),
        content: Text('Your password has been successfully updated. Please log in with your new password.'),
        actions: [
          TextButton(
            child: Text('OK'),
            onPressed: () {
              // Pop all open dialogs and navigate back to the login screen
              Navigator.of(context).popUntil((route) => route.isFirst); // This will ensure it closes all open dialogs
            },
          ),
        ],
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            ClipOval(
            child: Container(
              color: Colors.white,  // Border color
              padding: EdgeInsets.all(1),  // Border thickness
              child: Image.asset(
                'assets/images/nlogo.png',  // Adjust the path to match your image location
                height: 150,
                width: 150,
                fit: BoxFit.cover,  // Ensures the image fits within the circle
              ),
            ),
          ),
            SizedBox(height: 10),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'MAPNOCNHS',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.red.shade900,
                  ),
                ),
                Image.asset(
                  'assets/images/logo.png',
                  width: 35,
                  height: 35,
                ),         // Space between the log
              ],
            ),
              SizedBox(height: 10),
              Container(
                width: 300,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        hintText: 'Username',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword ? Icons.visibility : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _isButtonDisabled ? null : _login,
                      child: _isLoading
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text('Login'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.red.shade900
                      ),
                    ),
                      if (_isButtonDisabled)
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "Please wait ${_remainingTime.inMinutes}:${(_remainingTime.inSeconds % 60).toString().padLeft(2, '0')} before retrying.",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    if (_errorMessage != null) ...[
                      SizedBox(height: 20),
                      Text(
                        _errorMessage!,
                        style: TextStyle(
                          color: Colors.red,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                     SizedBox(height: 20),
                    TextButton(
                      onPressed: _showResetPasswordDialog,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.red.shade900,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
