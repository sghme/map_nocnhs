import 'package:flutter/material.dart';
import 'categoryservice.dart';

class TeacherEdit extends StatefulWidget {
  final int teacherId; // The ID of the teacher to edit
  final String currentTeacherName; // The current name of the teacher
  final VoidCallback onClose; // Callback to close the form

  TeacherEdit({
    required this.teacherId,
    required this.currentTeacherName,
    required this.onClose,
  });

  @override
  _TeacherEditState createState() => _TeacherEditState();
}

class _TeacherEditState extends State<TeacherEdit> {
  final DataService _dataService = DataService();
  final _formKey = GlobalKey<FormState>();
  String? _updatedTeacherName;

  @override
  void initState() {
    super.initState();
    _updatedTeacherName = widget.currentTeacherName;
  }

  Future<void> _editTeacher() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      await _dataService.editTeacher(widget.teacherId, _updatedTeacherName); // Use the service to edit the teacher
      widget.onClose();
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Adviser or Personnel  updated successfully!'),backgroundColor: Colors.green,),
      );
    }
  }

  Widget _buildFormField(
    String labelText,
    void Function(String?)? onSaved,
    String? Function(String?)? validator, {
    bool obscureText = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 100.0,
          child: Text(
            labelText,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(width: 12),
        Container(
          width: 300.0, // Set a fixed width to make the input field smaller
          child: TextFormField(
            initialValue: _updatedTeacherName,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            ),
            obscureText: obscureText,
            onSaved: onSaved,
            validator: validator,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: _buildFormField(
                'Advisers or Personnel: ',
                (value) => _updatedTeacherName = value,
                (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a Adviser(s) or Personnel name';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Align buttons to the center
              children: [
                ElevatedButton(
                  onPressed: _editTeacher,
                  child: Text('Save'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    minimumSize: Size(80, 36),
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                  ),
                ),
                SizedBox(width: 8), // Space between buttons
                TextButton(
                  onPressed: widget.onClose, // Close the form when Cancel is pressed
                  child: Text('Cancel'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
