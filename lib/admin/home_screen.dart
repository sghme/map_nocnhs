import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'buildings/building_info.dart';
import 'landmark/landmarks.dart';
import 'manage_user/manage_users.dart';
import 'buildings/teacher_list.dart';
import 'usage.dart';
import 'adminservice.dart';

class Home extends StatefulWidget {
  final Function(String) onRouteChange; // Callback to change route

  Home({required this.onRouteChange}); // Accepting the callback in constructor

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int buildingCount = 0;
  int landmarkCount = 0;
  int userCount = 0;
  int teacherCount = 0;
  int roomCount = 0;
  int usageCount = 0; 

  // Map to track hover state for each info box
  Map<String, bool> _isHovering = {
    'Buildings': false,
    'Rooms': false,
    'Facilities': false,
    'Manage Users': false,
    'Advisers or Personnel': false,
    'User Reports': false,
  };

    final AdminService _adminService = AdminService(); // Create an instance of AdminService


  @override
  void initState() {
    super.initState();
    fetchCounts();
  }

  Future<void> fetchCounts() async {
    final counts = await _adminService.fetchCounts(); // Call the fetchCounts function
    setState(() {
      buildingCount = counts['buildingCount'] ?? 0;
      roomCount = counts['roomCount'] ?? 0;
      landmarkCount = counts['landmarkCount'] ?? 0;
      userCount = counts['userCount'] ?? 0;
      teacherCount = counts['teacherCount'] ?? 0;
      usageCount = counts['usageCount'] ?? 0;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard Overview'),
      ),
      body: Container(
         // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     colors: [const Color.fromARGB(255, 224, 133, 133)!, Colors.white],
        //     begin: Alignment.topLeft,
        //     end: Alignment.bottomRight,
        //   ),
        // ),
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: buildInfoBox('Buildings', buildingCount, Colors.red, Icons.apartment, () {
                    widget.onRouteChange('/buildinginfo');
                  })),
                  SizedBox(width: 10),
                  Expanded(child: buildInfoBox('Rooms', roomCount, Colors.red, Icons.door_back_door, () {
                    widget.onRouteChange('/buildinginfo');
                  })),
                  SizedBox(width: 10),
                  Expanded(child: buildInfoBox('Facilities', landmarkCount, Colors.red, Icons.business, () {
                    widget.onRouteChange('/landmarks');
                  })),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: buildInfoBox('Manage Users', userCount, Colors.red, Icons.people, () {
                    widget.onRouteChange('/manageuser');
                  })),
                  SizedBox(width: 10),
                  Expanded(child: buildInfoBox('Advisers or Personnel', teacherCount, Colors.red, Icons.person, () {
                    widget.onRouteChange('/teacherlist');
                  })),
                  SizedBox(width: 10),
                  Expanded(child: buildInfoBox('User Reports', usageCount, Colors.red, Icons.analytics, () {
                    widget.onRouteChange('/usage'); // Navigate to usage.dart
                  })),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoBox(String title, int count, Color color, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        onEnter: (_) => setState(() {
          _isHovering[title] = true;
        }),
        onExit: (_) => setState(() {
          _isHovering[title] = false;
        }),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: color.withOpacity(0.3)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 40,
                  color: color,
                ),
                SizedBox(height: 8),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: _isHovering[title]! ?  Colors.red.shade900: color,
                      decoration: _isHovering[title]! ? TextDecoration.none : null,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  count.toString(),
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
