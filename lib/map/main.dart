import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'home_screen.dart';
import 'mappeh.dart';
// import 'search_function.dart';


Future<String> getIpAddress() async {
  final response = await http.get(Uri.parse('https://api.ipify.org?format=json'));

  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    return jsonResponse['ip'];
  } else {
    throw Exception('Failed to get IP address');
  }
}

Future<void> saveIpAddressToSupabase(String ipAddress, String deviceId) async {
  try {
    print('Checking if the record exists for IP: $ipAddress, Device ID: $deviceId');

    // Check if the record with the given ip_address and device_id already exists
    final response = await Supabase.instance.client
        .from('user_reports')
        .select()
        .eq('ip_address', ipAddress)
        .eq('device_id', deviceId)
        .maybeSingle();

    // Log the response for debugging
    print('Response from Supabase: ${response.toString()}');

    if (response != null) {
      // If the record exists, increment the usage count
      print('Record exists. Updating usage count.');
      int currentUsage = response['usage'] ?? 0;
      final updateResponse = await Supabase.instance.client
          .from('user_reports')
          .update({
            'usage': currentUsage + 1,
            'timestamp': DateTime.now().toUtc().toIso8601String(), // Update timestamp
          })
          .eq('ip_address', ipAddress)
          .eq('device_id', deviceId);

      print('Update response: ${updateResponse.toString()}');
      if (updateResponse.error != null) {
        throw Exception('Failed to update record: ${updateResponse.error!.message}');
      }
    } else {
      // If the record doesn't exist, insert a new one with usage set to 1
      print('Record does not exist. Inserting a new record.');
      final insertResponse = await Supabase.instance.client
          .from('user_reports')
          .insert({
            'ip_address': ipAddress,
            'device_id': deviceId,
            'usage': 1, // Set initial usage count
            'timestamp': DateTime.now().toUtc().toIso8601String(),
          });

      print('Insert response: ${insertResponse.toString()}');
      if (insertResponse.error != null) {
        throw Exception('Failed to insert record: ${insertResponse.error!.message}');
      }
    }
  } catch (error) {
    // Catch any other errors that might occur during the process
    print('Error in saveIpAddressToSupabase: $error');
    throw Exception('Failed to save IP address to Supabase.');
  }
}

Future<String> getOrCreateUniqueId() async {
  final prefs = await SharedPreferences.getInstance();
  String? deviceId = prefs.getString('device_id');

  if (deviceId == null) {
    deviceId = Uuid().v4(); // Generate a new unique ID
    await prefs.setString('device_id', deviceId); // Store it
  }

  return deviceId; // Return the unique ID
}

void main() async {
  // Ensure that Flutter bindings are initialized before doing anything else
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase
  await Supabase.initialize(
    url:
        // 'https://nppwhgqcolvxctwjchca.supabase.co', // Replace with your Supabase API URL
        'https://iudqzyiastrupvhqsdkt.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml1ZHF6eWlhc3RydXB2aHFzZGt0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjM1OTU3MTgsImV4cCI6MjAzOTE3MTcxOH0.LnD6prXLd4EWRf4Xgh3bO524PsSsCpBbqMrnd6Kl_nY',
  );
  //   anonKey:
  //       'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5wcHdoZ3Fjb2x2eGN0d2pjaGNhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjM3MjkyODYsImV4cCI6MjAzOTMwNTI4Nn0.xfYu65ray5maexv4pW1moHneAlDrX2mLu1bvUywByCU', // Replace with your Supabase Anon Key
  // );
//   void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   await Supabase.initialize(
//     url: 'https://iudqzyiastrupvhqsdkt.supabase.co',
//     anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml1ZHF6eWlhc3RydXB2aHFzZGt0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjM1OTU3MTgsImV4cCI6MjAzOTE3MTcxOH0.LnD6prXLd4EWRf4Xgh3bO524PsSsCpBbqMrnd6Kl_nY',
//   );

//   runApp(MyApp());
// }


 try {
    String ipAddress = await getIpAddress();
    String deviceId = await getOrCreateUniqueId();

    await saveIpAddressToSupabase(ipAddress, deviceId);
    print('IP Address saved: $ipAddress');
  } catch (error) {
    print('Failed to save IP address: $error');
  }

  // Fetch building and room data
  await fetchBuildingsData();
  await fetchRoomsForBuilding();
  await fetchLandmarks();
  // await fetchBuildingsPolygon();

  // Run the app
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MapScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
