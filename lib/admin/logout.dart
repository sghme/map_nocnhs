
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart'; 

class Logout {
  final BuildContext context;
  final SupabaseClient _supabaseClient;
  final String username;

  Logout(this.context, this._supabaseClient, this.username);

  Future<void> showLogoutConfirmation() async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirm Logout'),
        content: Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              final now = DateTime.now().toIso8601String(); // Current time in ISO format
              
              // Find the latest log entry for the current user
              final response = await _supabaseClient
                  .from('user_logs')
                  .select()
                  .eq('username', username)
                  .order('login_time', ascending: false)
                  .limit(1)
                  .single();

              if (response != null && response is Map<String, dynamic>) {
                final logId = response['id']; // Get the ID of the latest log entry

                // Update the logout time for that specific record
                await _supabaseClient
                    .from('user_logs')
                    .update({
                      'logout_time': now,
                    })
                    .eq('id', logId);
              }
              
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.clear(); // Clears all saved data, including the login status

              Navigator.of(context).pop(true); // Close the confirmation dialog
            },
            child: Text('Logout'),
          ),
        ],
      ),
    );

    if (result == true) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginScreen()), 
        (Route<dynamic> route) => false,
      );  // Redirect to login page
    }
  }
}

