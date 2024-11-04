import 'package:flutter/material.dart';
import 'categoryservice.dart';

class TeacherAdd extends StatefulWidget {
  final VoidCallback onClose; // Callback to close the form

  TeacherAdd({required this.onClose});

  @override
  _TeacherAddState createState() => _TeacherAddState();
}

class _TeacherAddState extends State<TeacherAdd> {
  final DataService _dataService = DataService();
  final _formKey = GlobalKey<FormState>();
  String? _teacherName;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _addTeacher() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Use the DataService to add the teacher
      final response = await _dataService.addTeacher(_teacherName);

      widget.onClose();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Adviser or Personnel added successfully!'),backgroundColor: Colors.green,),
      );
    }
  }

  // Custom method to build a form field
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
           mainAxisAlignment: MainAxisAlignment.center, // Center the form vertically
          crossAxisAlignment: CrossAxisAlignment.center, 
          children: [
            Center(
             child:  _buildFormField(
              'Adviser or Personnel:',
              (value) => _teacherName = value,
              (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a Adviser or Personnel name';
                }
                return null;
              },
            ),

            ),
            
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Align buttons to the end
              children: [
                ElevatedButton(
                  onPressed: _addTeacher,
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
