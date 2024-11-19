import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final SupabaseClient _supabaseClient = Supabase.instance.client;

  bool _currentPasswordVisible = false;
  bool _newPasswordVisible = false;
  bool _confirmPasswordVisible = false;

  Future<void> _changePassword() async {
    if (_formKey.currentState!.validate()) {
      final currentUser = _supabaseClient.auth.currentUser;
      try {
        // Verify current password
        await _supabaseClient.auth.signInWithPassword(
          email: currentUser!.email!,
          password: _currentPasswordController.text,
        );

        // Check if new passwords match
        if (_newPasswordController.text != _confirmPasswordController.text) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('New password and confirm password do not match.'), backgroundColor: Colors.red,),
          );
          return;
        }

        // Update the password
        await _supabaseClient.auth.updateUser(
          UserAttributes(password: _newPasswordController.text),
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Password updated successfully!'),backgroundColor: Colors.green,),
        );

        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Current password is incorrect.'),backgroundColor: Colors.red,),
        );
      }
    }
  }

  Widget _buildFormField(
    String labelText,
    TextEditingController controller,
    String? Function(String?)? validator, {
    required bool obscureText,
    required VoidCallback toggleVisibility,
    bool readOnly = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,  // Center the Row horizontally
        crossAxisAlignment: CrossAxisAlignment.center,  // Center vertically
        children: [
          // Label beside the input field
          Container(
            width: 120,  // Set a fixed width for the label
            child: Text(
              labelText,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.end,  // Align label text to the right
            ),
          ),
          SizedBox(width: 8),  // Space between label and input field
          // Input field with consistent width
          Container(
            width: 400,  // Set a consistent width for the input field (adjust as needed)
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                suffixIcon: IconButton(
                  icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
                  onPressed: toggleVisibility,
                ),
              ),
              obscureText: obscureText,
              readOnly: readOnly,
              validator: validator,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,  // Center the column content
                crossAxisAlignment: CrossAxisAlignment.center,  // Center the children horizontally
                children: [
                  // Current Password Field
                  _buildFormField(
                    'Current Password',
                    _currentPasswordController,
                    (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your current password';
                      }
                      return null;
                    },
                    obscureText: !_currentPasswordVisible,
                    toggleVisibility: () {
                      setState(() {
                        _currentPasswordVisible = !_currentPasswordVisible;
                      });
                    },
                  ),
                  // New Password Field
                  _buildFormField(
                    'New Password',
                    _newPasswordController,
                    (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a new password';
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
                    },
                    obscureText: !_newPasswordVisible,
                    toggleVisibility: () {
                      setState(() {
                        _newPasswordVisible = !_newPasswordVisible;
                      });
                    },
                  ),
                  // Confirm New Password Field
                  _buildFormField(
                    'Confirm New Password',
                    _confirmPasswordController,
                    (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your new password';
                      } else if (_newPasswordController.text != value) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    obscureText: !_confirmPasswordVisible,
                    toggleVisibility: () {
                      setState(() {
                        _confirmPasswordVisible = !_confirmPasswordVisible;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  // Buttons Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,  // Align buttons horizontally in the center
                    children: [
                      ElevatedButton(
                        onPressed: _changePassword,
                        child: Text('Change Password'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          minimumSize: Size(120, 36),  // Adjusted for consistency
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                        ),
                      ),
                      SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancel'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          minimumSize: Size(120, 36),  // Adjusted for consistency
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
