import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'terms_conditions.dart';

// Add User Form Widget
class AddUserForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final void Function(Map<String, String>) onAddUser;
  final VoidCallback onCancel;

  const AddUserForm({
    Key? key,
    required this.formKey,
    required this.onAddUser,
    required this.onCancel,
  }) : super(key: key);

  @override
  _AddUserFormState createState() => _AddUserFormState();
}

class _AddUserFormState extends State<AddUserForm> {
  bool _obscureText = true;
  bool _obscureConfirmText = true; // For confirm password visibility
  bool _termsAccepted = false;
  bool _isSubmitting = false;
  String? _name, _username, _email, _password, _confirmPassword;
  final String _role = 'Administrator';
  String passwordStrength = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView( // Add SingleChildScrollView here
        child: Container(
          width: 400.0, // Fixed width to make the form not too wide
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Add New User', // Title text
                style: TextStyle(
                  fontSize: 24.0, // Adjust font size as needed
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center, // Center align the title
              ),
              SizedBox(height: 3), // Spacing between title and note
              Form(
                key: widget.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildStaticRoleField('Role:', _role),
                    SizedBox(height: 10),
                    _buildFormField('Name:', (value) {
                      _name = value;
                    }, (value) {
                      return value!.isEmpty ? 'Please enter a name' : null;
                    }),
                    SizedBox(height: 10), // Spacing between fields
                    _buildFormField('Username:', (value) {
                      _username = value;
                    }, (value) {
                      return value!.isEmpty ? 'Please enter a username' : null;
                    }),
                    SizedBox(height: 10), // Spacing between fields
                    _buildFormField('Email:', (value) {
                      _email = value;
                    }, (value) {
                      return value!.isEmpty || !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)
                          ? 'Please enter a valid email'
                          : null;
                    }),
                    SizedBox(height: 10), // Spacing between fields
                    _buildPasswordField(),
                    SizedBox(height: 10), // Spacing between password field and confirm password
                    _buildConfirmPasswordField(), // Confirm Password Field
                    SizedBox(height: 8), // Spacing between password field and strength message
                    Text(
                      passwordStrength,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: passwordStrength == 'Password is strong' ? Colors.green : Colors.red,
                      ),
                    ),
                   Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 100.0, // Align it to match the input field label
                          child: SizedBox(
                            child: Text(
                              '',
                              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(width: 8), // Spacing between label and checkbox
                        Flexible(
                          child: Row(
                            children: [
                              Transform.scale(
                                scale: 0.6, // Shrinks the size of the checkbox
                                child: Checkbox(
                                  value: _termsAccepted,
                                  onChanged: (value) {
                                    setState(() {
                                      _termsAccepted = value ?? false;
                                    });
                                  },
                                ),
                              ),
                              Flexible(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => TermsAndConditionsPage()),
                                    );
                                  },
                                  child: Text.rich(
                                    TextSpan(
                                      text: 'I agree to the ',
                                      children: [
                                        TextSpan(
                                          text: 'Terms and Conditions',
                                          style: TextStyle(
                                            color: Colors.blue,
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                      ],
                                      style: TextStyle(fontSize: 11.0, color: Colors.black87),
                                    ),
                                    overflow: TextOverflow.ellipsis, // Prevents overflow by truncating text
                                    maxLines: 1, // Ensures the text stays on one line
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: _isSubmitting
                              ? null
                          :() async {
                            if (widget.formKey.currentState!.validate()) {
                               if (!_termsAccepted) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('You must accept the Terms and Conditions to proceed.'),
                                backgroundColor: Colors.red,
                              ));
                              return;
                            }

                            if (_password != _confirmPassword) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Passwords do not match.'),
                                backgroundColor: Colors.red,
                              ));
                              return;
                            }

                            setState(() {
                                      _isSubmitting = true;
                                    });

                              widget.formKey.currentState!.save();

                              // Step 1: Insert user data into the 'user' table with unverified status
                              widget.onAddUser({
                                'role': _role,
                                'name': _name!,
                                'username': _username!,
                                'email': _email!,
                              });

                              // Step 2: Sign up user via Supabase Auth and send confirmation email
                              final response = await Supabase.instance.client.auth.signUp(
                                email: _email!,
                                password: _password!,
                              );

                              if (response.user != null) {
                                widget.onCancel(); // Automatically go back to user list
                                // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                //   content: Text('User added successfully. Please check your email to verify your account.'),
                                //   backgroundColor: Colors.green,
                                // ));
                                showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Account Created'),
                                            content: RichText(
                                                    text: TextSpan(
                                                      style: Theme.of(context).textTheme.bodyMedium,
                                                      children: [
                                                        TextSpan(
                                                          text: 'Your account has been created. ',
                                                        ),
                                                        TextSpan(
                                                          text: 'Please check your email to verify and activate your account!',
                                                          style: TextStyle(color: Colors.red), // Set this part in red
                                                        ),
                                                      ],
                                                    ),
                                                  ),                                            
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('Got it'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                              } else {
                                print('Error during sign-up: ${response}');
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text('Error: ${response}'),
                                  backgroundColor: Colors.red,
                                ));
                              }
                               setState(() {
                                      _isSubmitting = false;
                                    });
                            }
                          },
                          child: Text('Add User'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            minimumSize: Size(80, 36), // Small size
                            padding: EdgeInsets.symmetric(horizontal: 12.0), // Padding inside the button
                          ),
                        ),
                        SizedBox(width: 8), // Spacing between buttons
                        ElevatedButton(
                          onPressed: widget.onCancel, // Go back to user list
                          child: Text('Cancel'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white, // Set button color to red
                            minimumSize: Size(80, 36), // Small size
                            padding: EdgeInsets.symmetric(horizontal: 12.0), // Padding inside the button
                          ),
                        ),
                      ],
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

  // Password field with live feedback on strength
  Widget _buildPasswordField() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 100.0, // Fixed width for label
          child: Text(
            'Password:',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(width: 12), // Spacing between label and input field
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(), // Box border for the input field
              contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0), // Padding inside the box
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText; // Toggle password visibility
                  });
                },
              ),
            ),
            obscureText: _obscureText,
            onChanged: (value) {
              setState(() {
                _password = value;
                passwordStrength = _checkPasswordStrength(value);
              });
            },
            validator: (value) {
              return _validatePassword(value);
            },
          ),
        ),
      ],
    );
  }

  // Confirm Password field
  Widget _buildConfirmPasswordField() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 100.0, // Fixed width for label
          child: Text(
            'Confirm Password:',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(width: 12), // Spacing between label and input field
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(), // Box border for the input field
              contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0), // Padding inside the box
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureConfirmText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _obscureConfirmText = !_obscureConfirmText; // Toggle confirm password visibility
                  });
                },
              ),
            ),
            obscureText: _obscureConfirmText,
            onChanged: (value) {
              _confirmPassword = value;
            },
            validator: (value) {
              return value!.isEmpty ? 'Please confirm your password' : null;
            },
          ),
        ),
      ],
    );
  }

  // Static role field
  Widget _buildStaticRoleField(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 100.0, // Fixed width for label
          child: Text(
            label,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(width: 12), // Spacing between label and input field
        Expanded(
          child: TextFormField(
            initialValue: value,
            readOnly: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            ),
          ),
        ),
      ],
    );
  }

  // Input form field
  Widget _buildFormField(String label, Function(String) onSaved, String? Function(String?) validator) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 100.0, // Fixed width for label
          child: Text(
            label,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(width: 12), // Spacing between label and input field
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(), // Box border for the input field
              contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0), // Padding inside the box
            ),
            onSaved: (value) {
              onSaved(value!);
            },
            validator: validator,
          ),
        ),
      ],
    );
  }

  String _checkPasswordStrength(String value) {
    if (value.length < 6) {
      return 'Password is too short';
    } else if (!RegExp(r'[A-Z]').hasMatch(value) || !RegExp(r'[a-z]').hasMatch(value) || !RegExp(r'\d').hasMatch(value)) {
      return 'Password should include upper, lower case letters, and numbers';
    } else {
      return 'Password is strong';
    }
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    } else if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    } else if (!RegExp(r'\d').hasMatch(value)) {
      return 'Password must contain at least one number';
    }
    return null;
  }
}
