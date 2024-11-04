import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data'; 
import 'dart:io'; // For mobile


class BuildingService {
  final SupabaseClient _supabaseClient = Supabase.instance.client;

  //queries for buildings.dart
  final ImagePicker _picker = ImagePicker();

  Future<List<Map<String, dynamic>>> fetchBuildingInfo(String searchQuery) async {
    return await Supabase.instance.client
        .from('buildings')
        .select()
        .ilike('building_name', '%$searchQuery%')
        .order('building_name', ascending: true);
  }

  Future<void> addBuilding(Map<String, String> buildingData) async {
    final response = await Supabase.instance.client
        .from('buildings')
        .insert(buildingData);

    if (response.error != null) {
      throw Exception('Error adding building: ${response.error?.message}');
    }
  }

  Future<void> editBuilding(Map<String, dynamic> buildingData) async {
    DateFormat dateFormat = DateFormat('MM/dd/yy h:mm a');
    String formattedDate = dateFormat.format(DateTime.now());

    await _supabaseClient.from('buildings')
        .update({
          'building_name': buildingData['building_name'],
          'no_of_floors': buildingData['no_of_floors'],
          'no_of_rooms': buildingData['no_of_rooms'],
          'building_img1': buildingData['building_img1'] ?? null,
          'building_img2': buildingData['building_img2'] ?? null,
          'building_img3': buildingData['building_img3'] ?? null,
          'updated_at': formattedDate,
        })
        .eq('id', buildingData['id']);
  }

  Future<void> addRoom(Map<String, String> roomData) async {
    final response = await Supabase.instance.client
        .from('rooms')
        .insert(roomData);

    if (response.error != null) {
      throw Exception('Error adding room: ${response.error?.message}');
    }
  }

  Future<void> addCR(Map<String, String> crData) async {
    final response = await Supabase.instance.client
        .from('cr')
        .insert(crData);

    if (response.error != null) {
      throw Exception('Error adding CR: ${response.error?.message}');
    }
  }

  //queries building_edit.dart
   Future<void> pickImage(BuildContext context, Function(dynamic) callback, String defaultImageUrl) async {
    if (kIsWeb) {
      // Web-specific code for file upload
      final result = await FilePicker.platform.pickFiles(type: FileType.image);
      if (result != null) {
        final bytes = result.files.single.bytes;
        callback(bytes);
      } else {
        callback(null);
      }
    } else {
      // Mobile and desktop-specific code for image picking
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        callback(File(pickedFile.path));
      } else {
        callback(null);
      }
    }
  }

  Future<String?> uploadImages(File? imageFile, Uint8List? imageBytes) async {
    if (imageFile != null || imageBytes != null) {
    try {
      final fileName = 'building_img/${DateTime.now().millisecondsSinceEpoch}.jpg';

      if (kIsWeb && imageBytes != null) {
        // Upload for web using Uint8List
        await _supabaseClient.storage.from('imagesnocnhs').uploadBinary(fileName, imageBytes);
      } else if (imageFile != null) {
        // Upload for mobile using File
        await _supabaseClient.storage.from('imagesnocnhs').upload(fileName, imageFile);
      }

      // Generate the public URL for the uploaded image
      final String imageUrl = _supabaseClient.storage.from('imagesnocnhs').getPublicUrl(fileName);

      return imageUrl;
    } catch (e) {
      print('Failed to upload image: $e');
      return null;
    }
  }
  }

   Future<void> deleteImages(String imageUrl) async {
  try {
    // Extract the correct path, ensuring it includes 'landmark_img/'
    final String path = imageUrl.split('imagesnocnhs/').last; 
    await _supabaseClient.storage.from('imagesnocnhs').remove([path]);
    print('Image deleted: $path');
  } catch (e) {
    print('Error deleting image: $e');
  }
}
  

//buildingrooms.dart
 Future<Map<String, dynamic>> fetchRoomsAndCRs(int buildingId, String searchQuery) async {
    final roomsResponse = await Supabase.instance.client
        .from('rooms')
        .select('id, room_no, floor_no, section, teacher, yearlevel, program_id, roomtype_id, updated_at')
        .eq('building_id', buildingId)
        .or('room_no.ilike.%$searchQuery%,section.ilike.%$searchQuery%,teacher.ilike.%$searchQuery%,yearlevel.ilike.%$searchQuery%')
        .order('room_no', ascending: true);

    final crResponse = await Supabase.instance.client
        .from('cr')
        .select('id, facility_name, floor_no, updated_at')
        .eq('building_id', buildingId)
        .ilike('facility_name', '%$searchQuery%')
        .order('facility_name', ascending: true);

    // Fetch teachers for each room
    for (var room in roomsResponse as List<dynamic>) {
      final teacherResponse = await Supabase.instance.client
          .from('room_teacher')
          .select('teacherlist(teachers)')
          .eq('room_id', room['id']);

      // Add the list of teachers to each room
      room['teachers'] = (teacherResponse as List)
          .map((entry) => entry['teacherlist']['teachers'] as String)
          .toList();

      // Fetch the program name based on the program_id
      if (room['program_id'] != null) {
        final programResponse = await Supabase.instance.client
            .from('programs')
            .select('program')
            .eq('id', room['program_id'])
            .single();

        // Add the program name to the room if available
        room['program_name'] = programResponse['program'] ?? 'No Program';
      } else {
        room['program_name'] = 'No Program';
      }

      if (room['roomtype_id'] != null) {
        final roomtypesResponse = await Supabase.instance.client
            .from('roomtypes')
            .select('roomtype')
            .eq('id', room['roomtype_id'])
            .single();

        // Add the program name to the room if available
        room['roomtype_name'] = roomtypesResponse['roomtype'] ?? 'No Room Type';
      } else {
        room['roomtype_name'] = 'No Room Type';
      }
    }

    return {
      'rooms': roomsResponse as List<dynamic>,
      'crs': crResponse as List<dynamic>,
    };
  }

  
  //queries for teacherlist.dart
  Future<List<Map<String, dynamic>>> fetchTeachers() async {
    List<Map<String, dynamic>> combinedTeachers = [];

    try {
      // Fetch data from room_teacher table
      final roomTeacherResponse = await _supabaseClient
          .from('room_teacher')
          .select('teacherlist(teachers), rooms(room_no, yearlevel, buildings(building_name), programs(program))');

      // Fetch data from rooms table
      final roomsResponse = await _supabaseClient
          .from('rooms')
          .select('teacher, section, room_no, yearlevel, buildings(building_name), programs(program)');

      // Process room_teacher response
      if (roomTeacherResponse != null && roomTeacherResponse is List) {
        for (var teacher in roomTeacherResponse) {
          String teacherName = teacher['teacherlist']['teachers'] ?? '';
          if (teacherName.isNotEmpty && teacherName != 'None') {
            combinedTeachers.add({
              'teacher': teacherName,
              'section': teacher['rooms']['section'] ?? 'None',
              'room_no': teacher['rooms']['room_no'] ?? 'None',
              'yearlevel': teacher['rooms']['yearlevel'] ?? 'None',
              'building_name': teacher['rooms']['buildings']['building_name'] ?? 'None',
              'program': teacher['rooms']['programs']['program'] ?? 'None',
            });
          }
        }
      }

      // Process rooms response
      if (roomsResponse != null && roomsResponse is List) {
        for (var room in roomsResponse) {
          String teacherName = room['teacher'] ?? '';
          if (teacherName.isNotEmpty && teacherName != 'None') {
            combinedTeachers.add({
              'teacher': teacherName,
              'section': room['section'] ?? 'None',
              'room_no': room['room_no'] ?? 'None',
              'yearlevel': room['yearlevel'] ?? 'None',
              'building_name': room['buildings']['building_name'] ?? 'None',
              'program': room['programs']['program'] ?? 'None',
            });
          }
        }
      }

      combinedTeachers.sort((a, b) {
        // Assign a high value for 'None' so it appears at the end
        int yearLevelA = a['yearlevel'] == 'None' ? 1000 : int.tryParse(a['yearlevel']) ?? 0;
        int yearLevelB = b['yearlevel'] == 'None' ? 1000 : int.tryParse(b['yearlevel']) ?? 0;
        return yearLevelA.compareTo(yearLevelB); // Sort by yearlevel in ascending order (numerically)
      });

      return combinedTeachers;
    } catch (error) {
      print('Error fetching teachers: $error');
      return [];
    }
  }

}
