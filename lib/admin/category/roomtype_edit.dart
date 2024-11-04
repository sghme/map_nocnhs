import 'package:flutter/material.dart';
import 'categoryservice.dart';

class RoomTypeEdit extends StatefulWidget {
  final int roomTypeId; // The ID of the room type to edit
  final String currentRoomTypeName; // The current name of the room type
  final VoidCallback onClose; // Callback to close the form

  RoomTypeEdit({
    required this.roomTypeId,
    required this.currentRoomTypeName,
    required this.onClose,
  });

  @override
  _RoomTypeEditState createState() => _RoomTypeEditState();
}

class _RoomTypeEditState extends State<RoomTypeEdit> {
   final DataService _dataService = DataService();
  final _formKey = GlobalKey<FormState>();
  String? _updatedRoomTypeName;

  @override
  void initState() {
    super.initState();
    _updatedRoomTypeName = widget.currentRoomTypeName;
  }

 Future<void> _editRoomType() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      await _dataService.editRoomType(widget.roomTypeId, _updatedRoomTypeName); // Call the service method
      widget.onClose();

      // Display success message after calling the service
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Room Type updated successfully!'),backgroundColor: Colors.green,),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error updating room type. Please try again.')),
      );
    }
  }

  Widget _buildFormField(
    String labelText,
    void Function(String?)? onSaved,
    String? Function(String?)? validator,
  ) {
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
            initialValue: _updatedRoomTypeName,
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
                'Room Type Name: ',
                (value) => _updatedRoomTypeName = value,
                (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a room type name';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _editRoomType,
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
