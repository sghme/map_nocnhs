import 'package:flutter/material.dart';
import 'categoryservice.dart';

class ProgramEdit extends StatefulWidget {
  final int programId; // The ID of the program to edit
  final String currentProgramName; // The current name of the program
  final String currentCurriculum;
  final VoidCallback onClose; // Callback to close the form

  ProgramEdit({
    required this.programId,
    required this.currentProgramName,
    required this.currentCurriculum,
    required this.onClose,
  });

  @override
  _ProgramEditState createState() => _ProgramEditState();
}

class _ProgramEditState extends State<ProgramEdit> {
  final DataService _dataService = DataService();
  final _formKey = GlobalKey<FormState>();
  String? _updatedProgramName;
  String? _updatedCurriculum; 

  @override
  void initState() {
    super.initState();
    _updatedProgramName = widget.currentProgramName;
    _updatedCurriculum = widget.currentCurriculum;
  }

  Future<void> _editProgram() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Use the DataService to edit the program
      await _dataService.editProgram(widget.programId, _updatedProgramName, _updatedCurriculum);
      widget.onClose();
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Curriculum updated successfully!'),backgroundColor: Colors.green,),
      );
    }
  }
 Widget _buildFormField(
    String labelText,
    void Function(String?)? onSaved,
    String? Function(String?)? validator, {
    String? initialValue,
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
          width: 300.0, // Set a fixed width for the input field
          child: TextFormField(
            initialValue: initialValue,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            ),
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
                'Curriculum Code: ',
                (value) => _updatedProgramName = value,
                (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a curriculum code';
                  }
                  return null;
                },
                 initialValue: _updatedProgramName,
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: _buildFormField(
                'Curriculum Name: ', // Label for the new curriculum field
                (value) => _updatedCurriculum = value,
                (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a curriculum';
                  }
                  return null;
                },
                initialValue: _updatedCurriculum, // Use the current curriculum
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _editProgram,
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
                  onPressed: widget.onClose,
                  child: Text('Cancel'),
                  style: TextButton.styleFrom(
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
