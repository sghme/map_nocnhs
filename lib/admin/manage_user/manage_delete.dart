import 'package:flutter/material.dart';
import 'manageservice.dart'; // Import the service class
class DeleteUserManager {
  final UserService _userService = UserService(); // Instantiate the service

  Future<void> deleteUser(BuildContext context, int userId, VoidCallback onSuccess) async {
    await _userService.deleteUser(userId); // Call the service function to delete the user
    onSuccess(); // Invoke callback to refresh the UI
  }

  void showDeleteConfirmation(BuildContext context, int userId, VoidCallback onSuccess) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Deletion'),
          content: const Text('Are you sure you want to delete this user?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                Navigator.of(context).pop();
                deleteUser(context, userId, onSuccess); // Pass the callback function to delete and refresh
              },
            ),
          ],
        );
      },
    );
  }
}
