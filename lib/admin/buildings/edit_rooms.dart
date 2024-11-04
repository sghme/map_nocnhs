import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:intl/intl.dart';
import 'editservice.dart';

class EditRoomsPage extends StatefulWidget {
  final Map<String, dynamic> room;
  final bool isCr; // New parameter to identify if it's a CR

  EditRoomsPage({required this.room, this.isCr = false});

  @override
  _EditRoomsPageState createState() => _EditRoomsPageState();
}

class _EditRoomsPageState extends State<EditRoomsPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController; // For room_no or facility_name
  late TextEditingController _floorNoController;
  late TextEditingController _sectionController;
  late TextEditingController _teacherController;
  late String _selectedYearLevel;
  int? _selectedProgramId; 
  int? _selectedRoomtypeId; 

  List<int> _selectedTeachers = [];
  List<Map<String, dynamic>> _teachers = [];
  List<Map<String, dynamic>> _programs = [];
  List<Map<String, dynamic>> _roomtypes = [];

  // Static list of year levels
  final List<String> _yearLevels = ['7', '8', '9', '10', 'None'];
  late BuildingService buildingService;

 @override
  void initState() {
    super.initState();
    buildingService = BuildingService(Supabase.instance.client); // Initialize service

    _nameController = TextEditingController(text: widget.isCr ? widget.room['facility_name'] : widget.room['room_no']);
    _floorNoController = TextEditingController(text: widget.room['floor_no'].toString());
    _sectionController = TextEditingController(text: widget.room['section'] ?? '');
    _teacherController = TextEditingController(text: widget.room['teacher'] ?? '');
    _selectedYearLevel = widget.room['yearlevel'] ?? 'None';

    _fetchData(); // Fetch all data
  }

  @override
  void dispose() {
    _nameController.dispose();
    _floorNoController.dispose();
    _sectionController.dispose();
    _teacherController.dispose(); // Dispose of teacher controller
    super.dispose();
  }

  Future<void> _fetchData() async {
    try {
      final fetchedPrograms = await buildingService.fetchPrograms();
      final fetchedRoomProgram = await buildingService.fetchRoomProgram(widget.room['id']);
      final fetchedRoomTypeId = await buildingService.fetchRoomTypeId(widget.room['id']);
      final fetchedRoomTypes = await buildingService.fetchRoomTypes();
      final fetchedTeachers = await buildingService.fetchTeachersData();
      final fetchedRoomTeachers = await buildingService.fetchRoomTeachers(widget.room['id']);

      setState(() {
        _programs = fetchedPrograms;
        _selectedProgramId = fetchedRoomProgram;
        _selectedRoomtypeId = fetchedRoomTypeId;
        _roomtypes = fetchedRoomTypes;
        _teachers = fetchedTeachers;
        _selectedTeachers = fetchedRoomTeachers;
      });
    } catch (error) {
      print('Error fetching data: $error'); // Log any errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching data. Please try again.')),
      );
    }
  }

  Future<void> _updateRoomTeachers() async {
    try {
      final roomId = widget.room['id'];
      await buildingService.updateRoomTeachers(roomId, _selectedTeachers);
      print('Updated teachers for room ID: $roomId'); // Log success
    } catch (error) {
      print('Error updating teachers: $error'); // Log any errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error updating teachers. Please try again.')),
      );
    }
  }

  void _saveChanges() async {
    if (_formKey.currentState?.validate() ?? false) {
      await _updateRoomTeachers(); // Update teacher associations

      DateFormat dateFormat = DateFormat('MM/dd/yy h:mm a');
      String formattedDate = dateFormat.format(DateTime.now());

      final updatedRoom = widget.isCr
          ? {
              'facility_name': _nameController.text,
              'floor_no': int.tryParse(_floorNoController.text) ?? 0,
              'updated_at': formattedDate,
            }
          : {
              'room_no': _nameController.text,
              'floor_no': int.tryParse(_floorNoController.text) ?? 0,
              'teacher': _teacherController.text,
              'section': _sectionController.text,
              'yearlevel': _selectedYearLevel,
              'program_id': _selectedProgramId,
              'roomtype_id': _selectedRoomtypeId,
              'updated_at': formattedDate,
            };

      try {
        await buildingService.updateRoom(widget.room['id'], updatedRoom); // Update the room
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Room updated successfully!'),backgroundColor: Colors.green,),
        );
        Navigator.pop(context, true); // Close the dialog after saving changes
      } catch (error) {
        print('Error updating room: $error'); // Log any errors
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error updating room. Please try again.')),
        );
      }
    }
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(widget.isCr ? 'Edit CR' : 'Edit Room'),
    ),
    body: Center(
      child: SingleChildScrollView( // Added ScrollView here
        child: Container(
          width: 600.0, // Adjust width to match the user edit form
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                widget.isCr ? 'Edit CR' : 'Edit Room',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildFormField(
                      widget.isCr ? 'Facility Name:' : 'Room No:',
                      _nameController,
                      (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter ${widget.isCr ? 'facility name' : 'room number'}';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 12),           
                      Tooltip(
                      message: 'This field cannot be edited',
                      child: _buildFormField(
                        'Floor No:',
                        _floorNoController,
                        (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter floor number';
                          }
                          return null;
                        },
                        readOnly: true, // Set to true to make the field non-editable
                      ),
                    ),      
                    if (!widget.isCr) ...[  
                      SizedBox(height: 12),                     
                      _buildRoomTypesDropdown(),
                      SizedBox(height: 12),
                      _buildFormField(
                        'Room Name/Section:',
                        _sectionController,
                        (value) => null,
                      ),
                      SizedBox(height: 12),
                      _buildProgramDropdown(), // Add the program dropdown here
                      SizedBox(height: 12),
                      _buildFormField(
                        'Adviser:',
                        _teacherController,
                        (value) => null, // No validation required
                      ),
                      SizedBox(height: 12),
                      _buildMultiSelectField('Add Personnel or Adviser(s):', _teachers),   
                      SizedBox(height: 20),
                      _buildYearLevelDropdown(),
                      SizedBox(height: 12),
                    ],
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: _saveChanges,
                          child: Text('Save'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                          ),
                        ),
                        SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Cancel'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
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
    ),
  );
}

  // Helper Widget for Form Fields
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
          width: 120.0,
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

  Widget _buildYearLevelDropdown() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        width: 120.0,
        child: Text(
          'Year Level:',
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(width: 12),
      Expanded(
        child: DropdownButtonFormField<String>(
          value: _yearLevels.contains(_selectedYearLevel)
              ? _selectedYearLevel
              : 'None', // Ensure the value is within the items
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          ),
          items: _yearLevels.map((yearLevel) {
            return DropdownMenuItem<String>(
              value: yearLevel,
              child: Text(yearLevel),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              _selectedYearLevel = newValue!;
            });
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select a year level';
            }
            return null;
          },
        ),
      ),
    ],
  );
}

  Widget _buildMultiSelectField(String labelText, List<Map<String, dynamic>> options) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start, // Aligns the text to the top
      children: [
        SizedBox(
          width: 120.0, // Same width for alignment
          child: Text(
            labelText,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: GestureDetector(
            onTap: () {
              _showMultiSelectDialog(options);
            },
            child: AbsorbPointer(
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                 hintText: _selectedTeachers.isEmpty
                    ? 'Select Principal, Personnel, or Adviser(s)'
                    : _selectedTeachers.map((id) {
                        final teacher = options.firstWhere(
                          (option) => option['id'] == id,
                          orElse: () => {'name': 'Unknown'}, // Handle missing teachers
                        );
                        return teacher['name'];
                      }).join(', '),
                  suffixIcon: Icon(Icons.arrow_drop_down),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

    void _showMultiSelectDialog(List<Map<String, dynamic>> options) {
    final TextEditingController _searchController = TextEditingController();
    List<Map<String, dynamic>> _filteredOptions = List.from(options) // Copy original options
    ..sort((a, b) => (a['name'] as String).compareTo(b['name'] as String)); // Sort options by name


    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Principal, Personnel, or Adviser(s)'),
          content: StatefulBuilder(
            builder: (context, setState) {
              return Container(
                width: 400,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Search bar
                    TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (query) {
                        // Filter options based on the search query
                        setState(() {
                          _filteredOptions = options
                              .where((option) => option['name']
                                  .toLowerCase()
                                  .contains(query.toLowerCase()))
                              .toList();
                        });
                      },
                    ),
                    SizedBox(height: 12),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: _filteredOptions.map((option) {
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
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                 setState(() {
                // This will refresh the input field with the selected teachers' names
              });
                Navigator.of(context).pop();
              },
              child: Text('Done'),
            ),
          ],
        );
      },
    );
  }

Widget _buildProgramDropdown() {
  // Sort the _programs list alphabetically, placing "None" at the end.
  List<Map<String, dynamic>> sortedPrograms = List.from(_programs)
    ..sort((a, b) {
      if (a['name'] == 'None') return 1; // "None" should be at the end
      if (b['name'] == 'None') return -1;
      return (a['name'] as String).compareTo(b['name'] as String);
    });
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 120.0,
          child: Text(
            'Curriculum:',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: DropdownButtonFormField<int>(
            value: _selectedProgramId,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            ),
              items: sortedPrograms.isNotEmpty
          ? sortedPrograms.map((program) {
              return DropdownMenuItem<int>(
                value: program['id'],
                child: Text(program['name']),
              );
            }).toList()
          : [],
            onChanged: (newValue) {
              setState(() {
                _selectedProgramId = newValue;
              });
            },
            validator: (value) {
              if (value == null) {
                return 'Please select a curriculum';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
  
Widget _buildRoomTypesDropdown() {
  // Sort the _roomtypes list alphabetically, placing "None" at the end.
  List<Map<String, dynamic>> sortedRoomTypes = List.from(_roomtypes)
    ..sort((a, b) {
      if (a['name'] == 'None') return 1; // "None" should be at the end
      if (b['name'] == 'None') return -1;
      return (a['name'] as String).compareTo(b['name'] as String);
    });
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 120.0,
          child: Text(
            'Room Type:',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: DropdownButtonFormField<int>(
            value: _selectedRoomtypeId,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            ),
              items: sortedRoomTypes.isNotEmpty
          ? sortedRoomTypes.map((roomtype) {
              return DropdownMenuItem<int>(
                value: roomtype['id'],
                child: Text(roomtype['name']),
              );
            }).toList()
          : [],
            onChanged: (newValue) {
              setState(() {
                _selectedRoomtypeId = newValue;
              });
            },
            validator: (value) {
              if (value == null) {
                return 'Please select a room type';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
  


