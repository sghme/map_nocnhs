// service.dart
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:intl/intl.dart';  // Import this package for formatting dates

class AdminService {
  final SupabaseClient _supabaseClient = Supabase.instance.client;
  
  //queries for userlogs.dart
  Future<List<Map<String, dynamic>>> fetchUserLogs() async {
    try {
      // Fetch all logs and order by login_time in descending order
      final response = await _supabaseClient
          .from('user_logs')
          .select()
          .order('login_time', ascending: false);

      if (response != null && response is List) {
        return List<Map<String, dynamic>>.from(response);  // Convert response to list of maps
      } else {
        print('No data found');
        return [];
      }
    } catch (error) {
      print('Error fetching user logs: $error');
      return [];
    }
  }

  // Convert UTC time to local time and format it
  String formatDateTime(String dateTimeStr) {
    try {
      DateTime utcTime = DateTime.parse(dateTimeStr).toUtc();  // Parse as UTC time
      DateTime localTime = utcTime.toLocal();  // Convert to local time
      return DateFormat('MM/dd/yyyy h:mm a').format(localTime);  // Format in MM/DD/YYYY 12-hour format with AM/PM
    } catch (e) {
      return '';  // Handle errors in case the date format is invalid
    }
  }

  //queries for usage.dart
  Future<Map<String, int>> fetchUsageData() async {
    // Get the start of the day
    DateTime now = DateTime.now();
    DateTime startOfDay = DateTime(now.year, now.month, now.day);
    DateTime endOfDay = startOfDay.add(Duration(days: 1));

    final response = await _supabaseClient
        .from('user_reports')
        .select('device_id, usage')
        .gte('timestamp', startOfDay.toIso8601String())
        .lt('timestamp', endOfDay.toIso8601String());

    Map<String, int> usageData = {};
    if (response != null) {
      for (var record in response as List<dynamic>) {
        String deviceId = record['device_id'];
        int usage = record['usage'];
        usageData[deviceId] = (usageData[deviceId] ?? 0) + usage;
      }
    } else {
      print('Error fetching data: ${response}');
    }
    return usageData;
  }

  //queries for homscreen.dart
  Future<Map<String, int>> fetchCounts() async {
    // Initialize count variables
    int buildingCount = 0;
    int landmarkCount = 0;
    int userCount = 0;
    int teacherCount = 0;
    int roomCount = 0;
    int usageCount = 0;

    // Count buildings
    final buildingResponse = await _supabaseClient.from('buildings').select('id');
    buildingCount = buildingResponse.length;

    // Count rooms
    final roomResponse = await _supabaseClient.from('rooms').select('id');
    roomCount = roomResponse.length;

    // Count landmarks
    final landmarkResponse = await _supabaseClient.from('landmarks').select('id');
    landmarkCount = landmarkResponse.length;

    // Count users
    final userResponse = await _supabaseClient.from('user').select('id');
    userCount = userResponse.length;

    // Fetch today's date
    final today = DateTime.now();
    final todayStart = DateTime(today.year, today.month, today.day);
    
    // Count devices used today (user reports with today's timestamp)
    final usageResponse = await _supabaseClient
        .from('user_reports')
        .select('device_id, timestamp')
        .gte('timestamp', todayStart.toIso8601String()); // Only get records from today
    
    // Count the number of unique devices used today
    final List<String> uniqueDeviceIds = usageResponse
        .map<String>((report) => report['device_id'])
        .toSet()
        .toList();

    usageCount = uniqueDeviceIds.length;

    // Fetch teachers from room_teacher table
    final roomTeacherResponse = await _supabaseClient.from('room_teacher').select('teacherlist(teachers)');
    final List<String> uniqueTeachers = roomTeacherResponse
        .where((teacher) => teacher['teacherlist']['teachers'] != null && teacher['teacherlist']['teachers'] != "None")
        .map<String>((teacher) => teacher['teacherlist']['teachers'])
        .toSet() // Use a Set to ensure uniqueness
        .toList();

    // Fetch teachers from rooms table
    final roomsResponse = await _supabaseClient.from('rooms').select('teacher');
    final List<String> roomTeachers = roomsResponse
        .where((room) => room['teacher'] != null && room['teacher'] != "None")
        .map<String>((room) => room['teacher'])
        .toList();

    // Combine the unique teachers from both sources
    uniqueTeachers.addAll(roomTeachers);
    uniqueTeachers.toSet(); // Ensure uniqueness again

    teacherCount = uniqueTeachers.length; // Count of unique teachers

    return {
      'buildingCount': buildingCount,
      'roomCount': roomCount,
      'landmarkCount': landmarkCount,
      'userCount': userCount,
      'teacherCount': teacherCount,
      'usageCount': usageCount,
    };
  }

}
