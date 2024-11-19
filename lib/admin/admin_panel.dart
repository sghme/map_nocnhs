// admin_panel.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'buildings/building_info.dart';
import 'home_screen.dart';
import 'manage_user/manage_users.dart';
import 'user_logs.dart';
import 'landmark/landmarks.dart';
import 'logout.dart'; // Import the logout file
import 'buildings/teacher_list.dart';
import 'Helppage.dart';
import 'category/add.dart';
import 'usage.dart';
import '../map/home_screen.dart';
import 'change_password.dart';
import 'change_email.dart';

class AdminPanel extends StatefulWidget {
  final String username;

  AdminPanel({required this.username});

  @override
  _AdminPanelState createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  String _selectedRoute = '/';
  final SupabaseClient _supabaseClient = Supabase.instance.client;

@override
  void initState() {
    super.initState();
    _loadSelectedRoute();
  }

Future<void> _loadSelectedRoute() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedRoute = prefs.getString('selectedRoute') ?? '/';
    });
  }

 Future<void> _saveSelectedRoute(String route) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedRoute', route);
  }



  // Method to return the correct screen based on the route
  Widget _getScreenForRoute(String? route) {
    switch (route ?? '/') {
      case '/buildinginfo':
        return BuildingInfo();
      case '/landmarks':
        return Landmarks();
      case '/teacherlist':
        return TeacherList();
      case '/manageuser':
        return ManageUsers();
      case '/additems':
        return AddItems(); 
      case '/userlogs':
        return UserLogs();  
      case '/usage':
      return Usage();   
       case '/HelpPage':
        return HelpPage();
      default:
        return Home(onRouteChange: (route) { // Include the callback here
          setState(() {
            _selectedRoute = route; // Update the selected route
            _saveSelectedRoute(route);
          });
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      appBar: AppBar(
         title: Row(
        children: [
          // Wrap the image with a SizedBox to make it responsive
          ClipOval(
            child: Container(
              color: Colors.white,  // Border color
              padding: EdgeInsets.all(1),  // Border thickness
              child: Image.asset(
                'assets/images/nlogo.png',  // Adjust the path to match your image location
                height: 35,
                width: 35,
                fit: BoxFit.cover,  // Ensures the image fits within the circle
              ),
            ),
          ),
          SizedBox(width: 8),
          // Use Flexible to allow the text to adjust if needed
          Flexible(
            child: Text(
              'MAPNOCNHS Admin Panel',
              style: TextStyle(color: Colors.white),
              overflow: TextOverflow.ellipsis,  // Adds ellipsis if text overflows
              softWrap: true,  // Allows the text to wrap to a new line if necessary
            ),
          ),
        ],
      ), 
        backgroundColor: Colors.red.shade900,
         iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(Icons.map, color: Colors.white),
            tooltip: 'Open Map',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MapScreen()),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'logout') {
                  Logout(context, _supabaseClient, widget.username).showLogoutConfirmation();
                }else if (value == 'change_password') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChangePasswordScreen()),
                );} else if (value == 'change_email') {
                  final currentUser = _supabaseClient.auth.currentUser;
                  if (currentUser != null && currentUser.email != null) {
                    showDialog(
                      context: context,
                      builder: (context) => ChangeEmailDialog(
                        currentEmail: currentUser.email!,
                        userId: currentUser.id, // Pass the user ID here
                      ),
                    );
                  }
                }
              },
              itemBuilder: (context) => [
               PopupMenuItem<String>(
                value: 'change_password',
                child: Row(
                  children: [
                    Icon(Icons.lock, size: 20,color: Colors.black),  // Icon for "Change Password"
                    SizedBox(width: 8),  // Space between icon and text
                    Text('Change Password'),
                  ],
                ),
              ),
              PopupMenuItem<String>(
                value: 'change_email',
                child: Row(
                  children: [
                    Icon(Icons.email, size: 20, color: Colors.black),
                    SizedBox(width: 8),
                    Text('Change Email'),
                  ],
                ),
              ),
              PopupMenuItem<String>(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(Icons.exit_to_app, size: 20,color: Colors.black),  // Icon for "Logout"
                    SizedBox(width: 8),  // Space between icon and text
                    Text('Logout'),
                  ],
                ),
              ),

              ],
              child: Row(
                children: [
                  Icon(Icons.account_circle, size: 24, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    widget.username,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_drop_down, color: Colors.white),
                ],
              ),
            ),
          ),
        ],
      ),
      sideBar: SideBar(
        selectedRoute: _selectedRoute,
        onSelected: (item) {
          setState(() {
            if (item.route == '/logout') {
              Logout(context, _supabaseClient, widget.username).showLogoutConfirmation();
            } else {
              _selectedRoute = item.route ?? '/';
              _saveSelectedRoute(_selectedRoute);
            }
          });
        },
        items: [
          AdminMenuItem(
            title: 'Dashboard',
            icon: Icons.dashboard,
            route: '/',
          ),
          AdminMenuItem(
            title: 'Building Info',
            icon: Icons.apartment,
            route: '/buildinginfo',
          ),
          AdminMenuItem(
            title: 'Facilities',
            icon: Icons.business,
            route: '/landmarks',
          ),
          AdminMenuItem(
            title: 'Advisers or Personnel',
            icon: Icons.school,
            route: '/teacherlist',
          ),  
          AdminMenuItem(
            title: 'Manage User',
            icon: Icons.people,
            route: '/manageuser',
          ),
          AdminMenuItem(
            title: 'Add',
            icon: Icons.add,
            route: '/additems',
          ),  
          AdminMenuItem(
            title: 'User Logs',
            icon: Icons.history,
            route: '/userlogs',
          ), 
          AdminMenuItem(
            title: 'User Reports',
            icon: Icons.bar_chart,
            route: '/usage',
          ),
           AdminMenuItem(
            title: 'Help',
            icon: Icons.help_center_rounded,
            route: '/HelpPage',
          ),
           
        ],
      ),
      body: _getScreenForRoute(_selectedRoute), // This now includes the Home widget with callback
    );
  }
   
}