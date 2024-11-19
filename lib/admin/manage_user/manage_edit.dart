import 'package:flutter/material.dart';

class ManageEditUser extends StatefulWidget {
  final Map<String, dynamic> user;
  final GlobalKey<FormState> formKey;
  final Future<void> Function(Map<String, dynamic>) onEditUser;
  final VoidCallback onCancel;

  ManageEditUser({
    Key? key,
    required this.user,
    required this.formKey,
    required this.onEditUser,
    required this.onCancel,
  }) : super(key: key);

  @override
  _ManageEditUserState createState() => _ManageEditUserState();
}

class _ManageEditUserState extends State<ManageEditUser> {
  late TextEditingController nameController;
  late TextEditingController usernameController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.user['name']);
    usernameController = TextEditingController(text: widget.user['username']);
    emailController = TextEditingController(text: widget.user['email']);
  }

  @override
  void dispose() {
    nameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 600.0,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Edit User',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Form(
                key: widget.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildFormField(
                      'Name:',
                      nameController,
                      (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 12),
                    _buildFormField(
                      'Username:',
                      usernameController,
                      (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a username';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 12),
                    Tooltip(
                      message: 'This field cannot be edited',
                      child: _buildFormField(
                        'Email:',
                        emailController,
                        (value) {
                          if (value == null || value.isEmpty || !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                        readOnly: false,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (widget.formKey.currentState?.validate() ?? false) {
                              widget.onEditUser({
                                'id': widget.user['id'],
                                'name': nameController.text,
                                'username': usernameController.text,
                                'email': emailController.text,
                              });
                              widget.onCancel(); // Ensure this is called
                              ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('User updated successfully!'),backgroundColor: Colors.green,),
                          );
                            }
                          },
                          child: Text('Save'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            minimumSize: Size(80, 36),
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                          ),
                        ),
                        SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: widget.onCancel,
                          child: Text('Cancel'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            minimumSize: Size(80, 36),
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
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

  Widget _buildFormField(
    String labelText,
    TextEditingController controller,
    String? Function(String?)? validator, {
    bool obscureText = false,
    bool readOnly = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 100.0,
          child: Text(
            labelText,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            ),
            obscureText: obscureText,
            readOnly: readOnly,
            validator: validator,
          ),
        ),
      ],
    );
  }
}
