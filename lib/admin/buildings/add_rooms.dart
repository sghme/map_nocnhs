import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RoomAddForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final void Function(Map<String, String>) onAddRoom;
  final VoidCallback onCancel;

  const RoomAddForm({
    Key? key,
    required this.formKey,
    required this.onAddRoom,
    required this.onCancel,
  }) : super(key: key);

  @override
  _RoomAddFormState createState() => _RoomAddFormState();
}

class _RoomAddFormState extends State<RoomAddForm> {
  List<Map<String, dynamic>> _buildings = [];
  List<Map<String, dynamic>> _teachers = [];
  late SupabaseClient _supabaseClient;
  String? _roomNo, _roomType, _yearLevel, _section;
  int? _floorNo, _buildingId, _roomId; // Added _roomId to store new room ID
  List<int> _selectedTeachers = []; // For selected teacher IDs

  final List<String> _yearLevels = ['7', '8', '9', '10', 'None'];
  final List<String> _roomTypes = ['Classroom', 'Laboratory', 'Office', 'TLE Room', 'None'];

  @override
  void initState() {
    super.initState();
    _supabaseClient = Supabase.instance.client;
    _fetchBuildingsData();
    _fetchTeachersData(); // Fetch teachers
  }

  Future<void> _fetchBuildingsData() async {
    final buildingsResponse = await _supabaseClient.from('buildings').select();

    if (buildingsResponse != null) {
      setState(() {
        _buildings = (buildingsResponse as List)
            .map((item) => {'id': item['id'], 'name': item['building_name']})
            .toList();
      });
    } else {
      print(buildingsResponse);
    }
  }

  Future<void> _fetchTeachersData() async {
    final teachersResponse = await _supabaseClient.from('teacherlist').select();

    if (teachersResponse != null) {
      setState(() {
        _teachers = (teachersResponse as List)
            .map((item) => {'id': item['id'], 'name': item['teacher']})
            .toList();
      });
    } else {
      print(teachersResponse);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 400.0,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add New Room Info',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 3),
            Form(
              key: widget.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 3),
                  if (_buildings.isNotEmpty)
                    _buildDropdownFormField(
                      'Building:',
                      _buildings,
                      (value) {
                        _buildingId = value;
                      },
                    ),
                  SizedBox(height: 3),
                  _buildStaticDropdownFormField(
                    'Room Type:',
                    _roomTypes,
                    (value) {
                      _roomType = value;
                    },
                  ),
                  SizedBox(height: 3),
                  _buildFormField('Room No.:', (value) {
                    _roomNo = value;
                  }, (value) {
                    return value!.isEmpty ? 'Please enter a room number' : null;
                  }),
                  SizedBox(height: 3),
                  _buildFormField('Floor No.:', (value) {
                    _floorNo = int.tryParse(value ?? '');
                  }, (value) {
                    return value!.isEmpty ? 'Please enter the floor number' : null;
                  }),
                  SizedBox(height: 3),
                  _buildMultiSelectField('Select Teachers:', _teachers),
                  SizedBox(height: 3),
                  _buildFormField('Room Name/Section:', (value) {
                    _section = value?.isEmpty ?? true ? 'None' : value;
                  }, null),
                  SizedBox(height: 3),
                  _buildStaticDropdownFormField(
                    'Year Level:',
                    _yearLevels,
                    (value) {
                      _yearLevel = value;
                    },
                  ),
                  SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          if (widget.formKey.currentState!.validate()) {
                            widget.formKey.currentState!.save();

                            // Add new room
                            final response = await _supabaseClient.from('rooms').insert({
                              'room_no': _roomNo!,
                              'floor_no': _floorNo,
                              'room_type': _roomType!,
                              'section': _section ?? 'None',
                              'yearlevel': _yearLevel ?? 'None',
                              'building_id': _buildingId,
                            }).select('id').single(); // Get the ID of the newly created room
                            
                            if (response != null) {
                              _roomId = response['id']; // Store newly created room ID
                              _addRoomTeachers(); // Add room-teacher associations
                            }

                            widget.onCancel();
                          }
                        },
                        child: Text('Add Room'),
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
    );
  }

  // Function to add room-teacher associations
  Future<void> _addRoomTeachers() async {
    for (var teacherId in _selectedTeachers) {
      await _supabaseClient.from('room_teacher').insert({
        'room_id': _roomId, // Use the stored ID of the newly created room
        'teacher_id': teacherId,
      });
    }
  }

  // Helper Widget for Form Fields
  Widget _buildFormField(
    String labelText,
    void Function(String?)? onSaved,
    String? Function(String?)? validator, {
    bool obscureText = false,
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

  // Helper Widget for Static Dropdown Fields
  Widget _buildStaticDropdownFormField(
    String labelText,
    List<String> options,
    void Function(String?)? onSaved,
  ) {
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
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            ),
            items: options.map((option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(option),
              );
            }).toList(),
            onChanged: (value) {},
            onSaved: onSaved,
            validator: (value) {
              return value == null || value.isEmpty 
                ? 'Please select ${labelText.toLowerCase().replaceFirst(":", "")}' 
                : null;
            },
          ),
        ),
      ],
    );
  }

  // Helper Widget for Dropdown Fields
  Widget _buildDropdownFormField(
    String labelText,
    List<Map<String, dynamic>> options,
    void Function(int?)? onSaved,
  ) {
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
          child: DropdownButtonFormField<int>(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            ),
            items: options.map((option) {
              return DropdownMenuItem<int>(
                value: option['id'],
                child: Text(option['name']),
              );
            }).toList(),
            onChanged: (value) {},
            onSaved: onSaved,
            validator: (value) {
              return value == null ? 'Please select a building' : null;
            },
          ),
        ),
      ],
    );
  }

  // Multi-select dropdown using a dialog
  Widget _buildMultiSelectField(String labelText, List<Map<String, dynamic>> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        ElevatedButton(
          onPressed: () {
            _showMultiSelectDialog(options);
          },
          child: Text('Select Teachers'),
        ),
      ],
    );
  }

  // Function to show the multi-select dialog
 void _showMultiSelectDialog(List<Map<String, dynamic>> options) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Select Teachers'),
        content: Container(
          width: double.maxFinite,
          child: ListView(
            children: options.map((option) {
              return StatefulBuilder(
                builder: (context, setState) {
                  return CheckboxListTile(
                    title: Text(option['name']),
                    value: _selectedTeachers.contains(option['id']),
                    onChanged: (bool? selected) {
                      setState(() {
                        if (selected != null) {
                          if (selected) {
                            _selectedTeachers.add(option['id']);
                          } else {
                            _selectedTeachers.remove(option['id']);
                          }
                        }
                      });
                    },
                  );
                },
              );
            }).toList(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Done'),
          ),
        ],
      );
    },
  );
}

}
