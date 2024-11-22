import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'mappeh.dart';
//import 'dart:math' as math;

//double _markerRotation = 0;
// Function to get search suggestions
Future<List<String>> getSearchSuggestions(String query) async {
  List<String> suggestions = [];
  String searchQuery = query.toLowerCase(); // Convert the query to lowercase
  DateTime oneWeekAgo = DateTime.now().subtract(Duration(days: 7));

  // Search in landmarks
  landmarkMarkers.keys.forEach((key) {
    String originalKey = key; // Store the original key
    String lowerCaseKey = key.toLowerCase(); // Convert the key to lowercase

    DateTime? updatedAt = LandmarkUpdates[key];

    if (lowerCaseKey.contains(searchQuery)) {
      String displayName = originalKey; // Use original key for display
      if (updatedAt != null && updatedAt.isAfter(oneWeekAgo)) {
        displayName = '$originalKey (newly updated)';
      }
      suggestions.add(displayName);
    }
  });

  // Search in building names
  buildingMarkers.keys.forEach((key) {
    String originalKey = key; // Store the original key
    String lowerCaseKey = key.toLowerCase();
     // Convert the key to lowercase

    DateTime? updatedAt = buildingUpdates[key];

    if (lowerCaseKey.contains(searchQuery)) {
      String displayName = originalKey; // Use original key for display
      if (updatedAt != null && updatedAt.isAfter(oneWeekAgo)) {
        displayName = '$originalKey (newly updated)';
      }
      suggestions.add(displayName);
    }
  });
  // Search in teacher names
  roomTeacherMap.forEach((room, teacher) {
  String lowerCaseTeacher = teacher.toLowerCase(); // Convert the teacher name to lowercase

  // Check if the teacher is not "None" and contains the search query
  if (teacher != "None" && lowerCaseTeacher.contains(searchQuery)) {
    suggestions.add(teacher); // Use the original teacher name for display
  }
});
 roomTeacherMaps.forEach((room, teachers) {
    List<String> teacherList = teachers.split(', '); // Split by comma
    for (String teacher in teacherList) {
      if (teacher.toLowerCase().contains(searchQuery)) {
        suggestions.add(teacher); // Add teacher name
      }
    }
  });

  return suggestions;
  //search in teachers name
}

//search in section name along with Grade

String? getGradeFromRoomName(String roomName) {
  List<String> parts = roomName.split(' ');
  // Return null if the parts do not have enough elements
  return parts.length > 1 ? parts[1] : null;
}

// Function to return the room number (name) without splitting
String? getRoomNumberFromName(String roomNo) {
  // If roomNo is not empty, return it directly
  if (roomNo.isNotEmpty) {
    return roomNo;  // Return the room number as is
  }
  // If roomNo is empty, return null
  return null;
}

// Function to search buildings and rooms
Future<void> searchBuildings(
  String query,
  MapController mapController,
  List<Marker> markers,
  Function updateMarkers,
  Function updateMapLayers,
  Function setLayerVisibility,
  Function updateFloorVisibility,
  // Function setContainerVisibility,
  BuildContext context,
  Function setLayerButtonVisibility,
  Function
      updateInfoContainer, 
  //double mapRotation,
  double _markerRotation,// This is now the function to update info container
) async {
  print('Fetching building, landmarks, room data for query: $query');
  String searchQuery = query;
  print('Searching for: $searchQuery');

  markers.clear();
  updateMapLayers(null);
  updateFloorVisibility(null); // Clear existing markers

  final Map<String, LatLng> combinedMarkersLowerCase = {};
  buildingMarkers.forEach((key, value) {
    combinedMarkersLowerCase[key] = value;
  });
  landmarkMarkers.forEach((key, value) {
    combinedMarkersLowerCase[key] = value;
  });

  // Check if query matches a teacher's name
  String? matchedTeacherRoom;
  roomTeacherMap.forEach((room, teacher) {
    if (teacher == searchQuery) {
      matchedTeacherRoom = room;
    }
  });

  // Use teacher's room name if teacher matches
  if (matchedTeacherRoom != null) {
    searchQuery = matchedTeacherRoom!;
  }

     String? matchedTeacherRooms;
  roomTeacherMaps.forEach((room, teachers) {
    List<String> teacherList = teachers.split(', ');
    for (String teacher in teacherList) {
      if (teacher.toLowerCase() == searchQuery.toLowerCase()) {
        matchedTeacherRooms = room;
      }
    }
  });

  // Use teacher's room name if teacher matches
  if (matchedTeacherRooms != null) {
    searchQuery = matchedTeacherRooms!;
  }

  // Find matching key (either building, room, or landmark)
  String? matchedKey = combinedMarkersLowerCase.keys.firstWhere(
    (key) => key == searchQuery,
    orElse: () => '',
  );

  if (matchedKey.isNotEmpty) {
    // LatLng location = combinedMarkersLowerCase[matchedKey]!;
    if (roomTeacherMaps.containsKey(matchedKey)) {
      String roomName = matchedKey;
     String teachersName = roomTeacherMaps[matchedKey] ?? 'N/A';

  // Get teacher from roomTeacherMap (single teacher)
  String teacherName = roomTeacherMap[matchedKey] ?? ''; // Empty if not found

  // Combine the teacher names, avoiding duplicates
 if (teacherName.isNotEmpty && teacherName != "None" && !teachersName.contains(teacherName)) {
      if (teachersName.isEmpty) {
        teachersName = ' $teacherName'; // Initialize with the first teacher and a bullet point
      } else {
        teachersName = '$teacherName\n• $teachersName'; // Append subsequent teachers with a bullet and newline
      }
    }
    // Convert teacher names into bullet format
  if (teachersName.isNotEmpty && teachersName != 'None') {
    List<String> teacherList = teachersName.split(', ').where((t) => t.trim() != 'None').toList();
    teachersName = teacherList.map((teacher) => '• $teacher').join('\n'); // Format as bullet points
  } else {
    teachersName = ''; // Clear if empty or "None"
  }

  print('Room: $roomName');
  print('Teachers:\n$teachersName');


    // If teachersName is "None", clear it
    if (teachersName.trim() == "None") {
      teachersName = ''; // Clear to avoid showing "None"
    
    
}
      String roombuildingName = roomBuildingMap[matchedKey] ?? 'N/A';
      int floorNo = roomFloorNumbers[matchedKey] ?? 0;
      String roomType = roomTypes[matchedKey] ?? 'N/A';
      String roomNo = roomNumbers[matchedKey] ?? 'N/A';
      String? yearLevel = roomyearlevel[matchedKey] ?? 'N/A';
      String? curriculum = roomprograms[matchedKey] ?? 'N/A';
      
      // roomNo ??= 'N/A';
      // yearLevel ??= 'N/A';

      String buildingImage = buildingImages[roombuildingName] ?? 'N/A';
      String buildingImage2 = buildingImages2[roombuildingName] ?? 'N/A';
      String buildingImage3 = buildingImages3[roombuildingName] ?? 'N/A';

      // Update InfoContainer with room details
      updateInfoContainer(
        curriculum:curriculum,
        roomName,
        teachersName,
        '', // Empty for building name
        roombuildingName,
        buildingImage,
        buildingImage2,
        buildingImage3,
        floorNo: floorNo,
        roomType: roomType,
        roomNo: roomNo,
        yearLevel: yearLevel,

      );
    }
    
    // Handle room case
  else  if   (roomTeacherMap.containsKey(matchedKey)) {
      String roomName = matchedKey;
      String teacherName = roomTeacherMap[matchedKey] ?? 'N/A';
      String roombuildingName = roomBuildingMap[matchedKey] ?? 'N/A';
      int floorNo = roomFloorNumbers[matchedKey] ?? 0;
      String roomType = roomTypes[matchedKey] ?? 'N/A';
      String roomNo = roomNumbers[matchedKey] ?? 'N/A';
      String? yearLevel = roomyearlevel[matchedKey] ?? 'N/A';
     String? curriculum = roomprograms[matchedKey] ?? 'N/A';
      
      // roomNo ??= 'N/A';
      // yearLevel ??= 'N/A';

      String buildingImage = buildingImages[roombuildingName] ?? 'N/A';
       String buildingImage2 = buildingImages2[roombuildingName] ?? 'N/A';
        String buildingImage3 = buildingImages2[roombuildingName] ?? 'N/A';

      // Update InfoContainer with room details
      updateInfoContainer(
        curriculum:curriculum,
        roomName,
        teacherName,
        '', // Empty for building name
        roombuildingName,
        buildingImage,
        buildingImage2,
        buildingImage3,
        floorNo: floorNo,
        roomType: roomType,
        roomNo: roomNo,
        yearLevel: yearLevel,
      );
    } else if (buildingMarkers.containsKey(matchedKey)) {
      // Handle building case
      String buildingName = matchedKey;
      int numberOfFloors = buildingFloors[matchedKey] ?? 0;
      int numberOfRooms = buildingRoomCounts[matchedKey] ?? 0;
      String buildingImage = buildingImages[matchedKey] ?? 'N/A';
       String buildingImage2 = buildingImages2[matchedKey] ?? 'N/A';
        String buildingImage3 = buildingImages3[matchedKey] ?? 'N/A';

      // Update InfoContainer with building details
      updateInfoContainer(
        null, // No room details
        null, // No teacher details
        buildingName,
        '', // Empty for room-building name
        buildingImage,
        buildingImage2,
        buildingImage3,
        numberOfFloors: numberOfFloors,
        numberOfRooms: numberOfRooms,
      );
    }  else if (landmarkMarkers.containsKey(matchedKey)) {
      // Handle landmark case
      String landmarkName = matchedKey;
      print('Landmark Name: $landmarkName'); // Print the landmark name

      String LandmarkImage = LandmarkImages[matchedKey] ?? 'N/A';
        String LandmarkImage2 = LandmarkImages2[matchedKey] ?? 'N/A';
          String LandmarkImage3 = LandmarkImages3[matchedKey] ?? 'N/A';
      print(
          'Landmark Image: $LandmarkImage'); // Print the fetched image (or N/A)

      if (LandmarkImage != 'N/A' && LandmarkImage.isNotEmpty) {
        print('It has images'); // Print when the image is available
      } else {
        print('Picture is N/A'); // Print when the image is not properly fetched
      }

      // Update InfoContainer with landmark details
      updateInfoContainer(
         null, // No room details for landmarks
         null, // No teacher details for landmarks
        // landmarkName,
       '',
        null, 
         '',
         '',
         '',// No building name
        LandmarkImage: LandmarkImage,
        LandmarkImage2: LandmarkImage2,
        LandmarkImage3: LandmarkImage3,
         landmarkName: landmarkName,
        // numberOfFloors: 0,
        // numberOfRooms: 0,
        
      );
    }
    LatLng calculatePolygonCenter(List<LatLng> points) {
      double latitudeSum = 0;
      double longitudeSum = 0;

      for (var point in points) {
        latitudeSum += point.latitude;
        longitudeSum += point.longitude;
      }

      return LatLng(latitudeSum / points.length, longitudeSum / points.length);
    }

    LatLng offsetPointAbove(LatLng point, double offset) {
      return LatLng(point.latitude + offset, point.longitude);
    }

    void addTextOverlayMarker(String matchedKey, List<Marker> markers) {
      if (buildingPolygons.containsKey(matchedKey)) {
        LatLng center = calculatePolygonCenter(buildingPolygons[matchedKey]!);
        LatLng offsetCenter = offsetPointAbove(center, 0.0001);

        String overlayText;
        if (roomTeacherMaps.containsKey(matchedKey)) {
          // If it's a room, show the grade, room number, and teacher

          // Updated extraction functions
          String? grade = getGradeFromRoomName(matchedKey);
          String? roomNumber = getRoomNumberFromName(matchedKey);
         String teachers = roomTeacherMaps[matchedKey] ?? 'No teachers assigned';
          // Provide default values if null
           String gradeText = grade ?? '';
          String roomNumberText = roomNumber ?? '';

          overlayText = ' $gradeText $roomNumberText\n $teachers';
        } else {
          // If it's a building, just show the building name
          overlayText = matchedKey;
        }

        // Check if the matchedKey is a room or a building
        if (roomTeacherMap.containsKey(matchedKey)) {
          // If it's a room, show the grade, room number, and teacher

          // Updated extraction functions
         // String? grade = getGradeFromRoomName(matchedKey);
          String? roomNumber = getRoomNumberFromName(matchedKey);
         // String teacher = roomTeacherMap[matchedKey] ?? '';

          // Provide default values if null
         // String gradeText = grade ?? '';
          String roomNumberText = roomNumber ?? '';

          overlayText = 
          //' $gradeText 
          '$roomNumberText';
          //\n $teacher';
        } else {
          // If it's a building, just show the building name
          overlayText = matchedKey;
        }

        markers.add(
          Marker(
            point: offsetCenter,
            width: 150.0,
            height: 45.0,
            child: Transform.rotate(
              angle:
                _markerRotation,  // Apply the rotation to both text and icon
              child: Column(
                children: [
                  Text(
                    overlayText,
                    style: TextStyle(
                       color: Colors.black87,
                      fontSize: 12.0,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  // Icon(
                  //   Icons.circle,
                  //   size: 8,
                  //    color: Colors.yellowAccent, // Customize the color of the dot
                  // ),
                ],
              ),
            ),
          ),
        );
      } else {
        print('No polygon found for the given key: $matchedKey');
      }
    }

    addTextOverlayMarker(matchedKey, markers);
    updateMarkers();

    if (roomFloorNumbers.containsKey(matchedKey)) {
      final int floorNo = roomFloorNumbers[matchedKey]!;
      updateFloorVisibility(floorNo);
      print('Floor number updated to: $floorNo');
    }
    print('polygons:$buildingPolygons');
    if (buildingPolygons.containsKey(matchedKey)) {
      final List<LatLng>? polygonCoords = buildingPolygons[matchedKey];
      if (polygonCoords != null && polygonCoords.isNotEmpty) {
        double avgLat =
            polygonCoords.map((c) => c.latitude).reduce((a, b) => a + b) /
                polygonCoords.length;
        double avgLng =
            polygonCoords.map((c) => c.longitude).reduce((a, b) => a + b) /
                polygonCoords.length;
        LatLng polygonCenter = LatLng(avgLat, avgLng);

        mapController.move(polygonCenter, 20.0);

          final Polygon highlightPolygon = Polygon(
          points: polygonCoords,
          color: const Color.fromARGB(255, 10, 10, 10).withOpacity(0.5),
          borderStrokeWidth: 2.0,
          borderColor:  const Color.fromARGB(221, 141, 172, 29),
        );

         final Polygon mainPolygon = Polygon(
          points: polygonCoords,
          color:  Colors.yellowAccent,
          borderStrokeWidth: 2.0,
          borderColor:  const Color.fromARGB(221, 141, 172, 29),
        );

        updateMapLayers(highlightPolygon);
        updateMapLayers(mainPolygon);

        markers.add(
          Marker(
            width: 80.0,
            height: 80.0,
            point: polygonCenter,
            child: GestureDetector(
              onTap: () {
                if (roomTeacherMaps.containsKey(matchedKey)) {
                  // If it's a room, provide room details
                  String roomName = matchedKey;
                String teachersName = roomTeacherMaps[matchedKey] ?? 'N/A';

  // Get teacher from roomTeacherMap (single teacher)
  String teacherName = roomTeacherMap[matchedKey] ?? ''; // Empty if not found

  // Combine the teacher names, avoiding duplicates
 //String teacherName = roomTeacherMap[matchedKey] ?? ''; // Empty if not found

  // Combine the teacher names, avoiding duplicates
 if (teacherName.isNotEmpty && teacherName != "None" && !teachersName.contains(teacherName)) {
      if (teachersName.isEmpty) {
        teachersName = ' $teacherName'; // Initialize with the first teacher and a bullet point
      } else {
        teachersName = '$teacherName\n• $teachersName'; // Append subsequent teachers with a bullet and newline
      }
    }
    // Convert teacher names into bullet format
  if (teachersName.isNotEmpty && teachersName != 'None') {
    List<String> teacherList = teachersName.split(', ').where((t) => t.trim() != 'None').toList();
    teachersName = teacherList.map((teacher) => '• $teacher').join('\n'); // Format as bullet points
  } else {
    teachersName = ''; // Clear if empty or "None"
  }

  print('Room: $roomName');
  print('Teachers:\n$teachersName');

    // If teachersName is "None", clear it
    if (teachersName.trim() == "None") {
      teachersName = ''; // Clear to avoid showing "None"
    
    
}
                  String roombuildingName =
                      roomBuildingMap[matchedKey] ?? 'N/A';
                  int floorNo = roomFloorNumbers[matchedKey] ?? 0;
                  String roomType = roomTypes[matchedKey] ?? 'N/A';
                  String roomNo = roomNumbers[matchedKey] ?? 'N/A';
                  String? yearLevel =roomyearlevel[matchedKey] ?? 'N/A';
                 String? curriculum = roomprograms[matchedKey] ?? 'N/A';
      
      // roomNo ??= 'N/A';
      // yearLevel ??= 'N/A';

      String buildingImage = buildingImages[roombuildingName] ?? 'N/A';
      String buildingImage2 = buildingImages2[roombuildingName] ?? 'N/A';
      String buildingImage3 = buildingImages3[roombuildingName] ?? 'N/A';

      // Update InfoContainer with room details
      updateInfoContainer(
        curriculum:curriculum,
                    roomName,
                    teachersName,
                    '', // Empty building name for room search
                    roombuildingName,
                    buildingImage,
                    buildingImage2,
                    buildingImage3,
                    floorNo: floorNo,
                    roomType: roomType,
                    roomNo: roomNo,
                    yearLevel: yearLevel,
                  );
                }

                // Determine if the tapped location is a room, a building, or a landmark
            else if  (roomTeacherMap.containsKey(matchedKey)) {
                  // If it's a room, provide room details
                  String roomName = matchedKey;
                  String teacherName = roomTeacherMap[matchedKey] ?? 'N/A';
                  String roombuildingName =
                      roomBuildingMap[matchedKey] ?? 'N/A';
                  int floorNo = roomFloorNumbers[matchedKey] ?? 0;
                  String roomType = roomTypes[matchedKey] ?? 'N/A';
                  String roomNo = roomNumbers[matchedKey] ?? 'N/A';
                  String? yearLevel = roomyearlevel[matchedKey] ?? 'N/A';
                String? curriculum = roomprograms[matchedKey] ?? 'N/A';
      
      // roomNo ??= 'N/A';
      // yearLevel ??= 'N/A';

      String buildingImage = buildingImages[roombuildingName] ?? 'N/A';
      String buildingImage2 = buildingImages2[roombuildingName] ?? 'N/A';
      String buildingImage3 = buildingImages3[roombuildingName] ?? 'N/A';

      // Update InfoContainer with room details
      updateInfoContainer(
        curriculum:curriculum,
                    roomName,
                    teacherName,
                    '', // Empty building name for room search
                    roombuildingName,
                    buildingImage,
                    buildingImage2,
                    buildingImage3,
                    floorNo: floorNo,
                    roomType: roomType,
                    roomNo: roomNo,
                    yearLevel: yearLevel,
                  );
                } else if (buildingMarkers.containsKey(matchedKey)) {
                  // If it's a building, provide building details
                  String buildingName = matchedKey;
                  int numberOfFloors = buildingFloors[matchedKey] ??
                      0; // Default to 0 if not available
                  int numberOfRooms = buildingRoomCounts[matchedKey] ??
                      0; // Default to 0 if not available
                  String buildingImage = buildingImages[matchedKey] ?? 'N/A';
                  String buildingImage2 = buildingImages2[matchedKey] ?? 'N/A';

                  String buildingImage3 = buildingImages3[matchedKey] ?? 'N/A';


                  updateInfoContainer(
                    null, // No room details
                    null, // No teacher details
                    buildingName,
                    '', // Empty for room-building name
                    buildingImage,
                    buildingImage2,
                    buildingImage3,
                    numberOfFloors: numberOfFloors,
                    numberOfRooms: numberOfRooms,
                  );
                } else if (landmarkMarkers.containsKey(matchedKey)) {
      // Handle landmark case
      String landmarkName = matchedKey;
      print('Landmark Name: $landmarkName'); // Print the landmark name

      String LandmarkImage = LandmarkImages[matchedKey] ?? 'N/A';
        String LandmarkImage2 = LandmarkImages2[matchedKey] ?? 'N/A';
          String LandmarkImage3 = LandmarkImages3[matchedKey] ?? 'N/A';
      print(
          'Landmark Image: $LandmarkImage'); // Print the fetched image (or N/A)

      if (LandmarkImage != 'N/A' && LandmarkImage.isNotEmpty) {
        print('It has images'); // Print when the image is available
      } else {
        print('Picture is N/A'); // Print when the image is not properly fetched
      }

      // Update InfoContainer with landmark details
      updateInfoContainer(
         null, // No room details for landmarks
         null, // No teacher details for landmarks
        // landmarkName,
       '',
        null, 
         '',
         '',
         '',// No building name
        LandmarkImage: LandmarkImage,
        LandmarkImage2: LandmarkImage2,
        LandmarkImage3: LandmarkImage3,
         landmarkName: landmarkName,
        // numberOfFloors: 0,
        // numberOfRooms: 0,
        
      );
    }
              },
              // },
              child: Transform.rotate(
              angle:
                 _markerRotation, 
              child: Center(
                child: Icon(
                  Icons.apartment,
                  color: Colors.red.withOpacity(1),
                ),
              ),
            ),
          ),
          ),
        );

        updateMarkers();
        print('Polygon found and highlighted for $matchedKey');
      } else {
        print('Polygon not found for $matchedKey');
      }
    }
  } else {
    // Show warning notification if no matches found
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            'No rooms, teacher, or building found with that name. Please be specific.'),
        duration: Duration(seconds: 3),
      ),
    );
    setLayerButtonVisibility(false); // Hide layer button on failed search
    print('No matching building or room found for: $searchQuery');
  }
}
