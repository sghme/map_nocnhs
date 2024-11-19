import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChangeEmailDialog extends StatefulWidget {
  final String currentEmail;
  final String userId; // Pass the user's ID

  ChangeEmailDialog({required this.currentEmail, required this.userId});

  @override
  _ChangeEmailDialogState createState() => _ChangeEmailDialogState();
}

class _ChangeEmailDialogState extends State<ChangeEmailDialog> {
  final _formKey = GlobalKey<FormState>();
  final _newEmailController = TextEditingController();
  final _otpController = TextEditingController();
  final SupabaseClient _supabaseClient = Supabase.instance.client;

  bool _isOtpSent = false;

  Future<void> _sendOtp() async {
    if (_formKey.currentState!.validate()) {
      final newEmail = _newEmailController.text.trim();

      try {
        // Send OTP for email change
        await _supabaseClient.auth.updateUser(
          UserAttributes(email: newEmail),
        );

        setState(() {
          _isOtpSent = true;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('OTP sent to $newEmail. Please check your email.'),
            backgroundColor: Colors.green,
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to send OTP: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _confirmOtp() async {
    final otp = _otpController.text.trim();
    final newEmail = _newEmailController.text.trim();

    try {
      // Verify the OTP
      await _supabaseClient.auth.verifyOTP(
        email: newEmail,
        token: otp,
        type: OtpType.emailChange,
      );

      // OTP verified successfully, update email in Supabase Auth
      await _supabaseClient.auth.updateUser(
        UserAttributes(email: newEmail),
      );

      // Update email in the 'user' table using the current email
      final updateResponse = await _supabaseClient
          .from('user')
          .update({'email': newEmail}) // Update to the new email
          .eq('email', widget.currentEmail);

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Email updated successfully!'),
          backgroundColor: Colors.green,
        ),
      );

      // Close the dialog
      Navigator.pop(context);
    } catch (e) {
      // Show error message if something goes wrong
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to verify OTP: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Change Email'),
      content: _isOtpSent
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Enter the OTP sent to ${_newEmailController.text}'),
                SizedBox(height: 10),
                TextFormField(
                  controller: _otpController,
                  decoration: InputDecoration(
                    labelText: 'OTP',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            )
          : Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Current Email: ${widget.currentEmail}'),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _newEmailController,
                    decoration: InputDecoration(
                      labelText: 'New Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a new email';
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _isOtpSent ? _confirmOtp : _sendOtp,
          child: Text(_isOtpSent ? 'Confirm OTP' : 'Send OTP'),
        ),
      ],
    );
  }
}
