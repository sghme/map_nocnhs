import 'package:flutter/material.dart';
import 'manage_add.dart'; // Import the add user form file
import 'manage_edit.dart';
import 'manageservice.dart';

class ManageUsers extends StatefulWidget {
  @override
  _ManageUsersState createState() => _ManageUsersState();
}

class _ManageUsersState extends State<ManageUsers> {
  final UserService _userService = UserService();
  Future<List<dynamic>>? _usersFuture;
  TextEditingController _searchController = TextEditingController(); // For search input
  bool _isAddingUser = false; // To track if we are in 'add user' mode
  bool _isEditingUser = false; // To track if we are in 'edit user' mode
  Map<String, dynamic>? _userToEdit; // To hold the user data being edited

  @override
  void initState() {
    super.initState();
    _fetchUsers();
    _searchController.addListener(_onSearchChanged); // Listen for changes in search input
  }

  void _fetchUsers([String searchQuery = '']) {
    setState(() {
      _usersFuture = _userService.fetchUsers(searchQuery); // Call the service function
    });
  }

  void _onSearchChanged() {
    _fetchUsers(_searchController.text); // Update user list based on search input
  }

  void _toggleAddUser() {
    setState(() {
      _isAddingUser = !_isAddingUser; // Toggle between listing users and adding a user
      _isEditingUser = false; // Ensure we're not in edit mode when adding a user
    });
  }

  void _toggleEditUser(Map<String, dynamic> user) {
    setState(() {
      _userToEdit = user; // Set the user to be edited
      _isEditingUser = !_isEditingUser; // Toggle between listing users and editing a user
      _isAddingUser = false; // Ensure we're not in add mode when editing a user
    });
  }


  Future<void> _addUser(Map<String, String> userData) async {
    await _userService.addUser(userData); // Call the service function
    _fetchUsers(); // Refresh the user data
    setState(() {
      _isAddingUser = false;
    });
}

  Future<void> _editUser(Map<String, dynamic> userData) async {
    await _userService.editUser(userData); // Call the service function
    _fetchUsers(); // Refresh the user data
    setState(() {
      _isEditingUser = false;
    });
  }

  Future<void> _deleteUser(Map<String, dynamic> user) async {
    bool? confirmDelete = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete User'),
          content: Text('Are you sure you want to delete this user?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('Delete'),
            ),
          ],
        );
      },
    );

    if (confirmDelete == true) {
      try {
        // Call delete service method
        await _userService.deleteUser(user['email']);
        
        // Refresh user list after deletion
        _fetchUsers();
        
        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('User deleted successfully'),
          backgroundColor: Colors.green,
        ));
      } catch (e) {
        // Show error message if deletion fails
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error deleting user: $e'),
          backgroundColor: Colors.red,
        ));
      }
    }
  }



  @override
  void dispose() {
    _searchController.dispose(); // Dispose of the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Users'),
        actions: [
          SizedBox(
                height: 35.0,
                width: 250.0,
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search',
                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
                    suffixIcon: Icon(Icons.search),
                 ),
              ),
            ),
          SizedBox(width: 10),
        ],
      ),
      body: _isAddingUser
          ? AddUserForm(
              formKey: GlobalKey<FormState>(),
              onAddUser: _addUser,
              onCancel: _toggleAddUser,
            )
          : _isEditingUser && _userToEdit != null
              ? ManageEditUser(
                  user: _userToEdit!,
                  formKey: GlobalKey<FormState>(),
                  onEditUser: _editUser,
                  onCancel: () {
                    setState(() {
                      _isEditingUser = false; // Go back to user list view
                    });
                  },
                )
              : _buildUserTable(),
    );
  }

  // User Table Widget with Search and similar design to UserLogs table
  Widget _buildUserTable() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton.icon(
                icon: Icon(Icons.add),
                label: Text('NEW'),
                onPressed: _toggleAddUser,
              ),
            ],
          ),
        ),
        Expanded(
        child: FutureBuilder<List<dynamic>>(
          future: _usersFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            final hasData = snapshot.hasData && snapshot.data!.isNotEmpty;
            final users = snapshot.data ?? [];

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Table(
                    border: TableBorder.all(color: const Color.fromARGB(255, 218, 218, 218)),
                    columnWidths: const {
                      0: FlexColumnWidth(1),
                      1: FlexColumnWidth(1),
                      2: FlexColumnWidth(1),
                      3: FixedColumnWidth(100.0),
                    },
                    children: [
                      TableRow(
                        decoration: BoxDecoration(
                          color: Colors.blueGrey.shade50,
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Account Name',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Username',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Role',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Action',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      if (hasData) ...users.map((user) {
                        return TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(user['name'] ?? 'No name'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(user['username'] ?? 'No username'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(user['role'] ?? 'No role'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.edit, color: Colors.blue),
                                    onPressed: () {
                                      _toggleEditUser(user); // Open edit form
                                    },
                                  ),
                                  IconButton(
                                   icon: Icon(
                                      Icons.delete,
                                      color: users.length > 1 ? Colors.red : Colors.black, // Black if only one user, red otherwise
                                    ),
                                    onPressed:  users.length > 1
                                    ? () => _deleteUser(user)
                                    : null,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ],
                  ),
                  if (!hasData)
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Text(
                          'No data available',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    ],
  );
}
}
