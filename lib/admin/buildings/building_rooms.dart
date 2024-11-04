import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:intl/intl.dart';
import 'edit_rooms.dart'; // Import the edit_rooms.dart file
import 'service.dart';

class BuildingRoomsPage extends StatefulWidget {
  final int buildingId;
  final String buildingName;

  BuildingRoomsPage({required this.buildingId, required this.buildingName});

  @override
  _BuildingRoomsPageState createState() => _BuildingRoomsPageState();
}

class _BuildingRoomsPageState extends State<BuildingRoomsPage> {
  Future<Map<String, dynamic>>? _dataFuture;
  TextEditingController _searchController = TextEditingController();
  final BuildingService _buildingService = BuildingService(); // Create an instance of the service


  @override
  void initState() {
    super.initState();
    _fetchData();
    _searchController.addListener(_onSearchChanged);
  }

  
  void _fetchData() {
    setState(() {
      _dataFuture = _buildingService.fetchRoomsAndCRs(widget.buildingId, _searchController.text);
    });
  }

  void _fetchRoomInfo(String searchQuery) {
    setState(() {
      _dataFuture = _buildingService.fetchRoomsAndCRs(widget.buildingId, searchQuery);
    });
  }

  void _onSearchChanged() {
    _fetchRoomInfo(_searchController.text);
  }

  void _editRoom(Map<String, dynamic> room, {bool isCr = false}) async {
    final shouldRefresh = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditRoomsPage(room: room, isCr: isCr), // Pass the isCr flag
      ),
    );

    if (shouldRefresh ?? false) {
      _fetchData(); // Refresh the data after editing a room
    }
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('${widget.buildingName}'),
      actions: [
        SizedBox(
          height: 35.0,
          width: 250.0,
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
              suffixIcon: Icon(Icons.search),
            ),
          ),
        ),
        SizedBox(width: 10),
      ],
    ),
    body: FutureBuilder<Map<String, dynamic>>(
      future: _dataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return Center(child: Text('No data available'));
        }

        final data = snapshot.data!;
        final rooms = data['rooms'] as List<dynamic>;
        final crs = data['crs'] as List<dynamic>;

        if (rooms.isEmpty && crs.isEmpty) {
          return Center(
            child: Text(
              'No data available',
              style: TextStyle(fontSize: 16),
            ),
          );
        }

        return ListView(
          children: [
            if (rooms.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Rooms', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ),
            ...rooms.map((room) {
              // Format the updated_at date
              String formattedDate = '';
              if (room['updated_at'] != null) {
                DateTime dateTime = DateTime.parse(room['updated_at']);
                formattedDate = DateFormat('MM/dd/yy h:mm a').format(dateTime);
              }

              // Get the list of teachers for this room
              final teacherNames = room['teachers']?.join(', ') ?? 'No Teachers Assigned';
              final programName = room['program_name'];
              final roomtypeName = room['roomtype_name'];

              return Card(
                margin: EdgeInsets.all(10.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Room No: ${room['room_no']}',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            SizedBox(height: 8),
                            Text('Floor No: ${room['floor_no']}'),
                            Text('Room Name/Section: ${room['section'] ?? 'Not Assigned'}'),
                            Text('Curriculum: $programName'), 
                            Text('Room Type: $roomtypeName'),
                            Text('Adviser: ${room['teacher'] ?? 'Not Assigned'}'),
                            Text('Personnel or Adviser(s): $teacherNames'),  // Display teacher names
                            Text('Year Level: ${room['yearlevel'] ?? 'Not Assigned'}'),                          
                            SizedBox(height: 8),
                            Text('Last Updated: $formattedDate'),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.blue),
                        onPressed: () => _editRoom(room),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
            if (crs.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Comfort Rooms (CRs)', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ),
            ...crs.map((cr) {
              String formattedDate = '';
              if (cr['updated_at'] != null) {
                DateTime dateTime = DateTime.parse(cr['updated_at']);
                formattedDate = DateFormat('MM/dd/yy h:mm a').format(dateTime);
              }
              return Card(
                margin: EdgeInsets.all(10.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Facility Name: ${cr['facility_name']}',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            SizedBox(height: 8),
                            Text('Floor No: ${cr['floor_no']}'),
                            SizedBox(height: 8),
                            Text('Last Updated: $formattedDate'),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.blue),
                        onPressed: () => _editRoom(cr, isCr: true), // Pass true for CRs
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ],
        );
      },
    ),
  );
}
}

