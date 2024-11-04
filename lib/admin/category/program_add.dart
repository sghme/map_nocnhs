import 'package:flutter/material.dart';
import 'categoryservice.dart';

class ProgramAdd extends StatefulWidget {
  final VoidCallback onClose; // Callback to close the form

  ProgramAdd({required this.onClose});
  @override
  _ProgramAddState createState() => _ProgramAddState();
}

class _ProgramAddState extends State<ProgramAdd> {
  final DataService dataService = DataService();
  final _formKey = GlobalKey<FormState>();
  String? _programName;
   String? _curriculumName; 

  @override
  void initState() {
    super.initState();
  }

  Future<void> _addProgram() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      await dataService.addProgram(_programName,_curriculumName); // Call the service method
      widget.onClose(); 

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Curriculum added successfully!'),backgroundColor: Colors.green,),
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
              'Curriculum Code: ',
              (value) => _programName = value,
              (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a urriculum code';
                }
                return null;
              },
            ),
            
            ),
              SizedBox(height: 20),
            Center(
              child: _buildFormField(
                'Curriculum Name: ',
                (value) => _curriculumName = value,
                (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a curriculum name';
                  }
                  return null;
                },
              ),
            ),
            
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Distribute buttons evenly
              children: [
                ElevatedButton(
                  onPressed: _addProgram,
                  child: Text('Save'),
                  style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          minimumSize: Size(80, 36),
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                        ),
                ),
                SizedBox(width: 8), 
                TextButton(
                  onPressed: widget.onClose, // Close the form when Cancel is pressed
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
    );
  }
}
