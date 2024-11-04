import 'package:latlong2/latlong.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'mappeh2.dart';
import 'mappeh3.dart';
import 'mappeh4.dart';

final Map<String, String> buildingsWithSpecificRooms = {};
final Map<String, String> buildingsWithSpecificRooms8 = {};
final Map<String, String> buildingsWithSpecificRooms9 = {};
final Map<String, String> buildingsWithSpecificRooms10 = {};
final Map<String, String> buildingsWithSpecificRoomsTLE = {};
final Map<String, String> buildingsWithSpecificRoomsOffices = {};
final Map<String, String> buildingsWithSpecificRoomsLaboratory = {};

final Map<String, List<LatLng>> landmarkPolygons = {};
final Map<String, LatLng> buildingMarkers = {};
//final Map<String, LatLng> LandmarkMarkers = {};
final Map<String, int> roomFloorNumbers = {};
final Map<String, String> roomTeacherMap = {};
//final Map<String, String> roomTeacherMaps = {};
final Map<String, String> roomTeacherMaps = {};
Map<String, List<String>> roomTeacherMapse = {};
final Map<String, LatLng> landmarkMarkers =
    {}; // For storing landmarks dynamically
final Map<String, String> buildingName = {};
final Map<String, String> landmarkKey = {};
final Map<String, String> buildingImages = {};
final Map<String, String> buildingImages2 = {};
final Map<String, String> buildingImages3 = {};
final Map<String, String> LandmarkImages = {};
final Map<String, String> LandmarkImages2 = {};
final Map<String, String> LandmarkImages3 = {};
final Map<String, int> buildingFloors = {}; // New map for number of floors
final Map<String, int> buildingRoomCounts = {}; // New map for number of rooms
final Map<String, String> roomTypes = {}; // New map for room types
final Map<String, String> roomNumbers = {};
final Map<String, String> roomyearlevel = {};
final Map<String, String> roomprograms = {};

final Map<String, String> buildingPolygonName = {};
final Map<String, String> roombuildingName = {};
Map<String, String> roomBuildingMap = {};
final Map<String, String> polygonToBuildingMap = {};
final Map<String, String> polygonToLandmarkMap = {};
final Map<String, String> polygonToRoomBuildingMap = {};
final Map<String, int> polygonToRoomFloorMap = {};
final Map<String, bool> buildingHasSpecificRooms = {};
final Map<String, bool> buildingHasSpecificRooms8 = {};
final Map<String, bool> buildingHasSpecificRooms9 = {};
final Map<String, bool> buildingHasSpecificRooms10 = {};
final Map<String, bool> buildingHasSpecificRoomsCR = {};
final Map<String, bool> buildingHasSpecificRoomsTLE = {};
final Map<String, bool> buildingHasSpecificRoomslaboratory = {};
final Map<String, bool> buildingHasSpecificRoomsoffices = {};
final Map<String, DateTime> buildingUpdates = {};
final Map<String, DateTime> LandmarkUpdates = {}; //  New map for room numbers
final Map<String, DateTime> RoomsUpdates = {};
final Map<String, DateTime> roomUpdates =
    {}; // New map to store updated_at for rooms
final Map<String, LatLng> combinedMarkersLowerCase = {};
//final Map<String, String> landmarkImages ={}; // Add this map to store landmark images
final Map<String, List<LatLng>> buildingPolygons = {};
Future<void> fetchBuildingsData([String searchQuery = '']) async {
  try {
    final response = await Supabase.instance.client
        .from('buildings')
        .select(
            'building_name, latitude, longitude, BuildingPolygonName, building_img1, building_img2, building_img3, no_of_floors, no_of_rooms, updated_at') // Fetch additional fields
        .like('building_name', '%$searchQuery%');

    if (response.isEmpty) {
      print('No buildings found');
      return;
    }

    final List<dynamic> data = response;

    for (var building in data) {
      final String buildingName = building['building_name'];
      final double latitude = building['latitude'];
      final double longitude = building['longitude'];
      final String polygonName = building['BuildingPolygonName'];
      final String? buildingImage = building['building_img1'];
        final String? buildingImage2 = building['building_img2'];
          final String? buildingImage3 = building['building_img3'];
      final int noOfFloors =
          building['no_of_floors'] ?? 0; // Fetch number of floors
      final int noOfRooms =
          building['no_of_rooms'] ?? 0; // Fetch number of rooms
      final DateTime? updatedAt = building['updated_at'] != null
          ? DateTime.parse(building['updated_at'])
          : null; // Handle null updated_at

      final String fullBuildingName = buildingName;
      final LatLng location = LatLng(latitude, longitude);

      // Store data with the concatenated key
      _storeBuildingData(
          fullBuildingName,
          getBuildingPolygonForBuilding(polygonName),
          location,
          buildingImage,
          buildingImage2,
          buildingImage3,
          noOfFloors,
          noOfRooms,
          updatedAt);
      polygonToBuildingMap[polygonName] = buildingName;
      combinedMarkersLowerCase[buildingName.toLowerCase()] =
          LatLng(latitude, longitude);

// Add entries to combinedMarkersLowerCase in fetchRoomsForBuilding

      // // Debugging print statements
      // print('Fetched Building: $buildingName');
      // print('Polygon Name: $polygonName');
      // print('Updated At: $updatedAt');
      // print('Fetched Building: $fullBuildingName');
      // print('Location: $location');
      // print('Floors: $noOfFloors');
      // print('Rooms: $noOfRooms');
      // print('polygon: $polygonName');
    }
  } catch (e) {
    print('Exception: $e');
  }
}

String formatTeachersList(List<String> teachers) {
  if (teachers.isEmpty) {
    return ''; // Return an empty string if there are no teachers
  } else if (teachers.length == 1) {
    return teachers[
        0]; // Return the single teacher's name without a bullet point
  } else {
    return teachers
        .map((teacher) => '• $teacher')
        .join('\n'); // Join with new lines for display
  }
}

Future<void> fetchRoomsForBuilding([String searchQuery = '']) async {
  try {
    final response = await Supabase.instance.client
        .from('rooms')
        .select(
            '*, programs(program, curriculum), roomtypes(roomtype), room_teacher(teacherlist(teachers)), buildings(building_name, building_img1, building_img2, building_img3, BuildingPolygonName)')
        .or('section.ilike.%$searchQuery%,teacher.ilike.%$searchQuery%');

    if (response.isEmpty) {
      print('No rooms or teacher found');
      return;
    }

    final List<dynamic> data = response;
    // Store building name and BuildingPolygonName

    for (var room in data) {
      final String roomName = room['section'];
      final double latitude = room['latitude'];
      final double longitude = room['longitude'];
      final String grade = (room['yearlevel'] == null ||
              room['yearlevel'].trim().toLowerCase() == 'none')
          ? ''
          : room['yearlevel'];
      final String roomPolygonName = room['RoomPolygonName'];
      final int floorNo = room['floor_no'];
      final String teacherName = room['teacher'];
      final List<dynamic> teachers = room['room_teacher'] ?? [];
      final String roombuildingName = room['buildings']['building_name'];
      final String roomprogram = (room['programs']?['program'] == 'None' ||
              room['programs']?['program'] == null)
          ? ''
          : room['programs']?['program'] ?? '';
      //  final String roombuildingName = room['buildings']['building_name'];

      final String? buildingImage = room['buildings']['building_img1'];
       final String? buildingImage2 = room['buildings']['building_img2'];
        final String? buildingImage3 = room['buildings']['building_img3'];
      final String buildingPolygonName =
          room['buildings']['BuildingPolygonName']; // Fetch BuildingPolygonName
       final String roomType = (room['roomtypes']?['roomtype'] == 'None' ||
              room['roomtypes']?['roomtype'] == null)
          ? ''
          : room['roomtypes']?['roomtype'] ?? ''; // Fetch room type
      final String roomNo = room['room_no']; // Fetch room number
      final String fullRoomName = '$roomprogram  $grade $roomName';
      final DateTime? updatedAt = room['updated_at'] != null
          ? DateTime.parse(room['updated_at'])
          : null;
      final LatLng location = LatLng(latitude, longitude);
      final String roomcurriculum =
          (room['programs']?['curriculum'] == 'None' ||
                  room['programs']?['curriculum'] == null)
              ? ''
              : room['programs']?['curriculum'] ?? '';
      final bool hasSpecificRooms = grade == '7' && roomType == 'Classroom';
      final bool hasSpecificRooms8 = grade == '8' && roomType == 'Classroom';
      final bool hasSpecificRooms9 = grade == '9' && roomType == 'Classroom';
      final bool hasSpecificRooms10 = grade == '10' && roomType == 'Classroom';

      final bool hasSpecificRoomsTLE = roomType == 'TLE Laboratory';
      final bool hasSpecificRoomsOffices = roomType == 'Office';
      final bool hasSpecificRoomsLaboratory = roomType == 'Laboratory';
      List<String> teachersName = [];
      for (var teacher in teachers) {
        teachersName.add(teacher['teacherlist']['teachers']);
      }

      if (hasSpecificRooms) {
        // Store the building name along with its BuildingPolygonName
        buildingsWithSpecificRooms[roombuildingName] = buildingPolygonName;
        // print(
        //     'Adding to buildingsWithSpecificRooms: $roombuildingName -> $buildingPolygonName');
        // print('Added: $roombuildingName -> $buildingPolygonName');
      }
      if (hasSpecificRooms8) {
        // Store the building name along with its BuildingPolygonName
        buildingsWithSpecificRooms8[roombuildingName] = buildingPolygonName;
        // print(
        //     'Adding to buildingsWithSpecificRooms: $roombuildingName -> $buildingPolygonName');
        // print('Added: $roombuildingName -> $buildingPolygonName');
      }
      if (hasSpecificRooms9) {
        // Store the building name along with its BuildingPolygonName
        buildingsWithSpecificRooms9[roombuildingName] = buildingPolygonName;
        // print(
        //     'Adding to buildingsWithSpecificRooms: $roombuildingName -> $buildingPolygonName');
        // print('Added: $roombuildingName -> $buildingPolygonName');
      }
      if (hasSpecificRooms10) {
        // Store the building name along with its BuildingPolygonName
        buildingsWithSpecificRooms10[roombuildingName] = buildingPolygonName;
        // print(
        //     'Adding to buildingsWithSpecificRooms: $roombuildingName -> $buildingPolygonName');
        // print('Added: $roombuildingName -> $buildingPolygonName');
      }
      if (hasSpecificRoomsTLE) {
        // Store the building name along with its BuildingPolygonName
        buildingsWithSpecificRoomsTLE[roombuildingName] = buildingPolygonName;
        // print(
        //     'Adding to buildingsWithSpecificRooms: $roombuildingName -> $buildingPolygonName');
        // print('Added: $roombuildingName -> $buildingPolygonName');
      }
      if (hasSpecificRoomsOffices) {
        // Store the building name along with its BuildingPolygonName
        buildingsWithSpecificRoomsOffices[roombuildingName] =
            buildingPolygonName;
        // print(
        //     'Adding to buildingsWithSpecificRooms: $roombuildingName -> $buildingPolygonName');
        // print('Added: $roombuildingName -> $buildingPolygonName');
      }
      if (hasSpecificRoomsLaboratory) {
        // Store the building name along with its BuildingPolygonName
        buildingsWithSpecificRoomsLaboratory[roombuildingName] =
            buildingPolygonName;
        // print(
        //     'Adding to buildingsWithSpecificRooms: $roombuildingName -> $buildingPolygonName');
        // print('Added: $roombuildingName -> $buildingPolygonName');
      }
      // Store the specific room details
      _storeRoomData(
        fullRoomName,
        getRoomPolygonForRoom(roomPolygonName),
        location,
        buildingImage,
        buildingImage2,
        buildingImage3,
        grade,
        floorNo,
        roomType,
        roomNo,
        teacherName,
        teachersName.join(" "),
        roomcurriculum,
        roombuildingName,
        updatedAt,
      );

      roomTeacherMap[fullRoomName] = teacherName;
      roomTeacherMaps[fullRoomName] = teachersName.join(" ");
      // roomTeacherMapse[fullRoomName] = teachersList;
      polygonToRoomBuildingMap[roomPolygonName] = roomName;
      polygonToRoomFloorMap[roomPolygonName] = floorNo;
      combinedMarkersLowerCase[roomName.toLowerCase()] =
          LatLng(latitude, longitude);
      print('Teacher: ${teachersName.join(" ")}');
// Add entries to combinedMarkersLowerCase in fetchLandmarks
// for (String teacher in teachersList) {
//   print('Teacher: $teacher');
// }

      // Debugging print statements
      print('Fetched Room: $fullRoomName');
      print('curriculum: $roomcurriculum');
//       print('Location: $location');
//     //  print('Teacher: $teacherName');
//       print('Updated At: $updatedAt');
//       print('Building: $roombuildingName');
//       print('Room Type: $roomType');
//       print('Room No: $roomNo');
      print('yearlevel: $grade');
//       print('Building List: $hasSpecificRooms');
//        print('Building List: $hasSpecificRooms8');
//         print('Building List: $hasSpecificRooms9');
//          print('Building List: $hasSpecificRooms10');
//           print('Building List: $hasSpecificRoomsTLE');

//     }

// //    // Print the buildings with BuildingPolygonName that have rooms matching the criteria
//     print('Buildings with rooms having yearlevel 7 and roomtype classroom:');
//     for (var entry in buildingsWithSpecificRooms.entries) {
//       print('Building: ${entry.key}, BuildingPolygonName: ${entry.value}');
//     }

//     print('Total count: ${buildingsWithSpecificRooms.length}');
//     print('Buildings with rooms having yearlevel 7 and roomtype classroom:');
//     for (var entry in buildingsWithSpecificRooms8.entries) {
//       print('Building: ${entry.key}, BuildingPolygonName: ${entry.value}');
//     }

//     print('Total count: ${buildingsWithSpecificRooms8.length}');
//     print('Buildings with rooms having yearlevel 7 and roomtype classroom:');
//     for (var entry in buildingsWithSpecificRooms9.entries) {
//       print('Building: ${entry.key}, BuildingPolygonName: ${entry.value}');
//     }

//     print('Total count: ${buildingsWithSpecificRooms9.length}');
//     print('Buildings with rooms having yearlevel 7 and roomtype classroom:');
//     for (var entry in buildingsWithSpecificRooms10.entries) {
//       print('Building: ${entry.key}, BuildingPolygonName: ${entry.value}');
//     }

//     print('Total count: ${buildingsWithSpecificRooms10.length}');
//     print('Buildings with rooms having yearlevel 7 and roomtype classroom:');
//     for (var entry in buildingsWithSpecificRoomsTLE.entries) {
//       print('Building: ${entry.key}, BuildingPolygonName: ${entry.value}');
    }

//     print('Total count: ${buildingsWithSpecificRoomsTLE.length}');
  } catch (e) {
    print('Exception: $e');
  }
}

Future<void> fetchLandmarks([String searchQuery = '']) async {
  try {
    final response = await Supabase.instance.client.from('landmarks').select();

    if (response.isEmpty) {
      print('No landmarks found');
      return;
    }

    final List<dynamic> data = response;

    for (var landmarke in data) {
      final String landmarkName = landmarke['landmark_name'];
      final double latitude = landmarke['latitude'];
      final double longitude = landmarke['longitude'];
      final String polygonName = landmarke['landmarkpolygon'];
      final String? landmarkImage = landmarke['landmark_img'];
      final String? landmarkImage2 = landmarke['landmark_img2'];
      final String? landmarkImage3 = landmarke['landmark_img3'];
      final DateTime? updatedAt = landmarke['updated_at'] != null
          ? DateTime.parse(landmarke['updated_at'])
          : null; // Handle null updated_at
      //    final String fullLandmarkName = landmarkName;
      final LatLng location = LatLng(latitude, longitude);
      polygonToLandmarkMap[polygonName] = landmarkName;
      final String landmarkKey = landmarkName;

      buildingPolygons[landmarkKey] =
          getLandmarkPolygonForLandmark(polygonName);
      // print('Fetched Landmark: $landmarkName, Polygon: $polygonName');
      // Store landmark data
      landmarkMarkers[landmarkName] = location;
      combinedMarkersLowerCase[landmarkName.toLowerCase()] =
          LatLng(latitude, longitude);
      // Store data with the concatenated key
      _storeLandmarkData(
        landmarkKey,
        getLandmarkPolygonForLandmark(polygonName),
        location,
        landmarkImage,
        landmarkImage2,
        landmarkImage3,
        updatedAt,

        // Use DateTime here
      );

      polygonToLandmarkMap[polygonName] = landmarkName;
//Map<String, List<LatLng>> landmarkPolygons = {}
      // Debugging print statements
      // print('Fetched Landmark: $landmarkName');
      // print('Polygon Name: $polygonName');
      // print('Location: $location');
      //  if (updatedAt!= null) {
      //   print('updated at: $updatedAt');
      // } else {
      //   print('Not yet updated the $landmarkName');
      // }
    }
  } catch (e) {
    print('Exception: $e');
  }
}
// Future<void> fetchLandmarks([String searchQuery = '']) async {
//   try {
//     final response = await Supabase.instance.client
//         .from('landmarks')
//          .select();

//     if (response.isEmpty) {
//       print('No landmarks found');
//       return;
//     }
// Future<void> fetchTeachersData([String searchQuery = '']) async {
//   try {
//     final response = await Supabase.instance.client
//         .from('nocnhs_teachers')
//         .select(
//             '*, buildings(building_name, building_img1, BuildingPolygonName)')// Fetch required fields
//         .like('teachers_name', '%$searchQuery%');

//     if (response.isEmpty) {
//       print('No buildings found');
//   // Return empty list if no buildings found
//     }

//     final List<dynamic> data = response;
//   //  List<Map<String, dynamic>> teachersList = []; // List to hold teachers data

//     for (var room in data) {
//    // final String buildingName = room['building_name'];
//       final String teacherName = room['teachers_name'];
//       final String roomName = room['room_name'];
//       final String roomPolygonName = room['roompolygon'];
//       final String position = room['position'];
//       final String grade = room['grades'];
//        final double latitude = room['latitude'];
//       final double longitude = room['longitude'];
//       final int floorNo = room['floor_no'];
//      // final String teacherName = room['teacher'];
//       final String roombuildingName = room['buildings']['building_name'];
//       final String? buildingImage = room['buildings']['building_img1'];
//       final String buildingPolygonName = room['buildings']['BuildingPolygonName']; // Fetch BuildingPolygonName
//       final String roomType = room['room_type']; // Fetch room type
//       final String roomNo = room['room_no'];
//        final String fullRoomName = '$grade $roomName ';
//         final LatLng location = LatLng(latitude, longitude);
//           final DateTime? updatedAt = room['updated_at'] != null
//           ? DateTime.parse(room['updated_at'])
//           : null;
//         _storeRoomData(
//           fullRoomName,
//           getRoomPolygonForRoom(roomPolygonName),
//           location,
//           buildingImage,
//           floorNo,
//           roomType,
//           roomNo,
//           teacherName,
//           teacherName,
//           roombuildingName,
//           updatedAt
//           );

//       roomTeacherMap[fullRoomName] = teacherName;
//      // roomTeacherMapse[fullRoomName] = teachersList;
//       polygonToRoomBuildingMap[roomPolygonName] = roomName;
//       polygonToRoomFloorMap[roomPolygonName] = floorNo;
//       combinedMarkersLowerCase[roomName.toLowerCase()] =
//           LatLng(latitude, longitude);

// if (!roomTeacherMaps.containsKey(fullRoomName)) {
//     roomTeacherMaps[fullRoomName] = [];
// }
// roomTeacherMaps[fullRoomName]!.add(teacherName);
//       // Debugging print statements
//       print('Fetched Building: $buildingName');
//       print('Teachers: $teacherName');
//       print('Room Name: $roomName');
//       print('Polygon Name: $roomPolygonName');
//       print('Position: $position');
//       print('Position: $grade');
//     }

//    // return; // Return the list of teachers
//   } catch (e) {
//     print('Exception: $e');
//   }
// }

// Helper function to store data for buildings
void _storeBuildingData(String key, List<LatLng> polygon, LatLng location,
    String? image, String? image2, String? image3, int floors, int rooms, DateTime? updatedAt) {
  // Nullable updatedAt
  buildingPolygons[key] = polygon;
  buildingMarkers[key] = location;
  buildingImages[key] = image ?? ''; // Handle null building_img1
   buildingImages2[key] = image2 ?? ''; 
    buildingImages3[key] = image3 ?? ''; 
  buildingFloors[key] = floors;
  buildingRoomCounts[key] = rooms;
//   print('Landmark Key: $key');
// print('Landmark Polygon: $polygon');

  if (updatedAt != null) {
    buildingUpdates[key] = updatedAt; // Store updated_at only if it's not null
  }
}

// Helper function to store data for rooms
void _storeRoomData(
  String key,
  List<LatLng> polygon,
  LatLng location,
  String? image,
  String? image2, 
  String? image3,
  String grade,
  int floorNo,
  String roomType,
  String roomNo,
  String teacherName,
  String teachersName,
  String roomcurriculum,
  String roombuildingName,
  DateTime? updatedAt,
) {
  buildingPolygons[key] = polygon;
  buildingMarkers[key] = location;
  buildingImages[key] = image ?? '';
  buildingImages2[key] = image2 ?? ''; 
  buildingImages3[key] = image3 ?? ''; 
  // roombuildingName[key] = roombuildingName;
  roomyearlevel[key] = grade;
  roomFloorNumbers[key] = floorNo;
  roomTypes[key] = roomType;
  roomNumbers[key] = roomNo;
  roomTeacherMap[key] = teacherName;
  roomTeacherMaps[key] = teachersName;
  roomprograms[key] = roomcurriculum;
  roomBuildingMap[key] = roombuildingName;
  if (updatedAt != null) {
    buildingUpdates[key] =
        updatedAt; // Store lowercase version of updated_at only if it's not null
  }

  // Add building name to the map
}

void _storeLandmarkData(String key, List<LatLng> polygon, LatLng location,
    String? image,String? image2,String? image3, DateTime? updatedAt // Update type to DateTime
    ) {
  buildingPolygons[key] = polygon;
  landmarkMarkers[key] = location;

  LandmarkImages[key] = image ?? '';
  LandmarkImages2[key] = image2 ?? '';
  LandmarkImages3[key] = image3 ?? ''; // Store lowercase key image
  if (updatedAt != null) {
    LandmarkUpdates[key] = updatedAt; // Store updated_at only if it's not null
  }
}
