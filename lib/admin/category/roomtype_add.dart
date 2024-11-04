import 'package:flutter/material.dart';
import 'categoryservice.dart';

class RoomTypeAdd extends StatefulWidget {
  final VoidCallback onClose; // Callback to close the form

  RoomTypeAdd({required this.onClose});

  @override
  _RoomTypeAddState createState() => _RoomTypeAddState();
}

class _RoomTypeAddState extends State<RoomTypeAdd> {
  final DataService _dataService = DataService();
  final _formKey = GlobalKey<FormState>();
  String? _roomTypeName;

  @override
  void initState() {
    super.initState();
  }

   Future<void> _addRoomType() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Use the DataService to add the room type
      await _dataService.addRoomType(_roomTypeName);
      widget.onClose();

      // You might want to fetch the response for any potential errors if needed
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Room type added successfully!'),backgroundColor: Colors.green,),
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
          crossAxisAlignment: CrossAxisAlignment.center, // Center the form horizontally
          children: [
            Center(
              child: _buildFormField(
                'Room Type: ',
                (value) => _roomTypeName = value,
                (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a room type';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Center the buttons horizontally
              children: [
                ElevatedButton(
                  onPressed: _addRoomType,
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
