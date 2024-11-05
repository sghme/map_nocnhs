// main.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'admin_panel.dart'; 
import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://iudqzyiastrupvhqsdkt.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml1ZHF6eWlhc3RydXB2aHFzZGt0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjM1OTU3MTgsImV4cCI6MjAzOTE3MTcxOH0.LnD6prXLd4EWRf4Xgh3bO524PsSsCpBbqMrnd6Kl_nY',
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<Map<String, dynamic>> _getLoginDetails() async {
    final prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    String username = prefs.getString('username') ?? 'Admin';
    return {'isLoggedIn': isLoggedIn, 'username': username};
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Panel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder<Map<String, dynamic>>(
        future: _getLoginDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data!['isLoggedIn']) {
            return AdminPanel(username: snapshot.data!['username']);
          } else {
            return LoginScreen();
          }
        },
      ),
      onGenerateRoute: (settings) {
        if (settings.name == '/admin') {
          final username = settings.arguments as String?;
          return MaterialPageRoute(
            builder: (context) => AdminPanel(username: username ?? 'Admin'),
          );
        }
        return null;
      },
      debugShowCheckedModeBanner: false,
    );
  }
}