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
        ],
      ),
    ),
  );
}



Widget _buildFormField(
  String labelText,
  void Function(String?)? onSaved,
  String? Function(String?)? validator, {
  bool obscureText = false,
}) {
  return LayoutBuilder(
    builder: (context, constraints) {
      bool isSmallScreen = constraints.maxWidth < 600;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
              // Wrapping the input field and buttons together
              Container(
                width: isSmallScreen ? constraints.maxWidth * 0.6 : 300.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                      ),
                      obscureText: obscureText,
                      onSaved: onSaved,
                      validator: validator,
                    ),
                    SizedBox(height: 10),
                    // Buttons aligned under the input field on mobile
                    if (isSmallScreen)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                          SizedBox(width: 4), // Reduced spacing between buttons
                          TextButton(
                            onPressed: widget.onClose,
                            child: Text('Cancel'),
                            style: TextButton.styleFrom(
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
          // Desktop layout remains the same
          if (!isSmallScreen)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
                  onPressed: widget.onClose,
                  child: Text('Cancel'),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    minimumSize: Size(80, 36),
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                  ),
                ),
              ],
            ),
        ],
      );
    },
  );
}

}