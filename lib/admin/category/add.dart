import 'package:flutter/material.dart';
import 'roomtype_add.dart';
import 'program_add.dart';
import 'teacher_add.dart';
import 'teacher_edit.dart'; // Import the new screen for editing teachers
import 'program_edit.dart';
import 'roomtype_edit.dart';
import 'categoryservice.dart';

class AddItems extends StatefulWidget {
  @override
  _AddItemsState createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final DataService dataService = DataService(); // Initialize the DataService

  Future<List<dynamic>>? _roomTypesFuture;
  Future<List<dynamic>>? _programsFuture;
  Future<List<dynamic>>? _teachersFuture;

  bool _isAddingRoomType = false;
  bool _isAddingTeacher = false;
  bool _isAddingProgram = false;
  bool _isEditingTeacher = false;
  bool _isEditingProgram = false;
  bool _isEditingRoomType = false;
  int? _editingTeacherId;
  String? _editingTeacherName;
  int? _editingProgramId;
  String? _editingProgramName;
  String? _editingCurrName;
  int? _editingRoomtypeId;
  String? _editingRoomtypeName;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _fetchData();
  }

    void _fetchData() {
    _roomTypesFuture = dataService.fetchRoomTypes(); // Use the service method
    _programsFuture = dataService.fetchPrograms(); // Use the service method
    _teachersFuture = dataService.fetchTeachers(); // Use the service method
  }

  void _addItem(String type) {
    setState(() {
      if (type == 'roomtype') {
        _isAddingRoomType = true;
      } else if (type == 'program') {
        _isAddingProgram = true;
      } else if (type == 'teachers') {
        _isAddingTeacher = true;
      }
    });
  }

  void _editTeacher(int teacherId, String teacherName) {
    setState(() {
      _isEditingTeacher = true;
      _editingTeacherId = teacherId;
      _editingTeacherName = teacherName;
    });
  }

  void _editProgram(int programId, String programName, String curriculumName) {
    setState(() {
      _isEditingProgram = true;
      _editingProgramId = programId;
      _editingProgramName = programName;
      _editingCurrName = curriculumName;
    });
  }

void _editRoomType(int roomTypeId, String roomTypeName) {
  // Prevent editing 
  if (roomTypeName.toLowerCase() != 'classroom' && roomTypeName.toLowerCase() != 'laboratory' && roomTypeName.toLowerCase() != 'office'&& roomTypeName.toLowerCase() != 'tle laboratory') {
    setState(() {
      _isEditingRoomType = true;
      _editingRoomtypeId = roomTypeId;
      _editingRoomtypeName = roomTypeName;
    });
  } else {
    // Show a message if the user tries to edit "classroom" or "Laboratory"
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Editing for "$roomTypeName" is not allowed.'), backgroundColor: Colors.red, )
    );
  }
}

  void _closeAdd() {
    setState(() {
      _isAddingRoomType = false;
      _isAddingTeacher = false;
      _isAddingProgram = false;
      _isEditingTeacher = false;
      _editingTeacherId = null;
      _editingTeacherName = null;

      _isEditingProgram = false;
      _editingProgramId = null;
      _editingProgramName = null;
      _editingCurrName = null;

      _isEditingRoomType = false;
      _editingRoomtypeId = null;
      _editingRoomtypeName = null;
      _fetchData(); // Refresh data after add/edit
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TabBar(
        controller: _tabController,
        tabs: [
          Tab(text: 'Room Types'),
          Tab(text: 'Curriculum'),
          Tab(text: 'Advisers or Personnel'),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _isAddingRoomType 
              ? RoomTypeAdd(onClose: _closeAdd) 
              : _isEditingRoomType 
                  ? RoomTypeEdit(
                      roomTypeId: _editingRoomtypeId!,
                      currentRoomTypeName: _editingRoomtypeName!,
                      onClose: _closeAdd,
                    )
                  : _buildRoomTypeTable(), 

          _isAddingProgram 
              ? ProgramAdd(onClose: _closeAdd) 
              : _isEditingProgram
                  ? ProgramEdit(
                      programId: _editingProgramId!,
                      currentProgramName: _editingProgramName!,
                      currentCurriculum: _editingCurrName!,
                      onClose: _closeAdd,
                    )
                  : _buildProgramTable(),

          _isAddingTeacher
              ? TeacherAdd(onClose: _closeAdd)
              : _isEditingTeacher
                  ? TeacherEdit(
                      teacherId: _editingTeacherId!,
                      currentTeacherName: _editingTeacherName!,
                      onClose: _closeAdd,
                    )
                  : _buildTeacherTable(),
        ],
      ),
    );
  }

  Widget _buildTeacherTable() {
    return FutureBuilder<List<dynamic>>(
      future: _teachersFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No teachers available'));
        }

        final teachers = snapshot.data!;
        teachers.sort((a, b) => (a['teachers'] ?? '').compareTo(b['teachers'] ?? ''));
        return _buildTable(teachers, 'teachers', 'Name', 'teachers');
      },
    );
  }
  
  void _deleteTeacher(int teacherId) async {
  bool? confirmDelete = await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Delete Adviser or Personnel'),
        content: Text('Are you sure you want to delete this adviser or personnel?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('Delete'),
          ),
        ],
      );
    },
  );

  if (confirmDelete == true) {
      await dataService.deleteTeacher(teacherId);
      setState(() {
        _fetchData();
      });  // Refresh the data after deletion
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Advisers or Personnel deleted successfully'),
        backgroundColor: Colors.green,
      ));
    }
  }

  Widget _buildRoomTypeTable() {
    return FutureBuilder<List<dynamic>>(
      future: _roomTypesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No room types available'));
        }

        final roomTypes = snapshot.data!;
        roomTypes.sort((a, b) => (a['roomtype'] ?? '').compareTo(b['roomtype'] ?? ''));  
        return _buildTable(roomTypes, 'roomtype', 'Room Types', 'roomtype');
      },
    );
  }

   void _deleteRoomType(int roomTypeId, String roomTypeName) async {
     if (roomTypeName.toLowerCase() == 'classroom' || 
      roomTypeName.toLowerCase() == 'laboratory' || 
      roomTypeName.toLowerCase() == 'office' || 
      roomTypeName.toLowerCase() == 'tle laboratory') {
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Deletion of "$roomTypeName" is not allowed.'),
        backgroundColor: Colors.red,
      ),
    );
    return; // Exit the method, preventing deletion
  }
    bool? confirmDelete = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Room Type'),
          content: Text('Are you sure you want to delete this room type?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('Delete'),
            ),
          ],
        );
      },
    );

    if (confirmDelete == true) {
      await dataService.deleteRoomType(roomTypeId);
      setState(() {
        _fetchData();
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Room type deleted successfully'),
        backgroundColor: Colors.green,
      ));
    }
  }
  
 Widget _buildProgramTable() {
    return FutureBuilder<List<dynamic>>(
      future: _programsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No programs available'));
        }

        final programs = snapshot.data!;
        programs.sort((a, b) {
          String programA = a['program'] ?? '';
          String programB = b['program'] ?? '';

          if (programA == 'None') return 1;  // Place 'None' after other items
          if (programB == 'None') return -1; // Place other items before 'None'

          return programA.compareTo(programB); // Regular alphabetical comparison
        });
        
        return _buildTableWithProgramName(programs);
      },
    );
  }

  Widget _buildTableWithProgramName(List<dynamic> items) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton.icon(
                onPressed: () => _addItem('program'),
                icon: Icon(Icons.add),
                label: Text('Add'),
              ),
            ],
          ),
          SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              child: Table(
                border: TableBorder.all(color: const Color.fromARGB(255, 218, 218, 218)),
                columnWidths: {0: FlexColumnWidth(1), 1: FlexColumnWidth(1), 2: FixedColumnWidth(100.0)},
                children: [
                  TableRow(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade50,
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Curriculum Code',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Curriculum Name',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                         ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Actions',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  for (var program in items)
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(program['program'] ?? 'N/A'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(program['curriculum'] ?? 'N/A'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit, color: Colors.blue),
                              onPressed: () {
                                _editProgram(program['id'], program['program'],program['curriculum']);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                               _deleteProgram(program['id']);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _deleteProgram(int programId) async {
    bool? confirmDelete = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Curriculum'),
          content: Text('Are you sure you want to delete this curriculum?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('Delete'),
            ),
          ],
        );
      },
    );

    if (confirmDelete == true) {
      await dataService.deleteProgram(programId);
      setState(() {
        _fetchData();
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Curriculum deleted successfully'),
        backgroundColor: Colors.green,
      ));
    }
  }

Widget _buildTable(List<dynamic> items, String columnName, String headerTitle, String itemType) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton.icon(
              onPressed: () => _addItem(itemType),
              icon: Icon(Icons.add),
              label: Text('Add'),
            ),
          ],
        ),
        SizedBox(height: 16),
        Expanded(
          child: SingleChildScrollView(
            child: Table(
              border: TableBorder.all(color: const Color.fromARGB(255, 218, 218, 218)),
              columnWidths: {0: FlexColumnWidth(1), 1: FixedColumnWidth(150.0)},  // Adjusted for edit & delete icons
              children: [
                TableRow(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade50,
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        headerTitle,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Actions',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                ...items.map((item) {
                  return TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(item[columnName] ?? 'Unknown'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit, color: Colors.blue),
                              onPressed: () {
                                if (itemType == 'teachers') {
                                  _editTeacher(item['id'], item['teachers'] ?? 'Unknown');
                                } else if (itemType == 'roomtype') {
                                  _editRoomType(item['id'], item['roomtype'] ?? 'Unknown');
                                }
                              },
                            ),
                           IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              if (itemType == 'teachers') {
                                _deleteTeacher(item['id']);
                              } else if (itemType == 'roomtype') {
                                _deleteRoomType(item['id'], item['roomtype']);
                              } 
                            },
                          ),
                          ],
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}


}
