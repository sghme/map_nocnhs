import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

// import 'navigation3.dart';

import 'info_container.dart';
import 'maplayerss.dart';
//import 'dart:math' as math;
import 'mappeh.dart';
import 'search_function.dart';
import 'tap2.dart';
import 'tap3.dart';
import 'tap4.dart';
import 'taplandmark.dart';
import 'taptap.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController mapController = MapController();
  late MapController mapControllers;
  bool isNorth = true;
  double _markerRotation = 0;
  List<Marker> _markers = [];
  List<Marker> tapmarkers = [];
  List<Polygon> polygons = [];
  List<Polygon> tap_polygons = [];
  Map<String, LatLngBounds> polygonBoundsMap = {};
  Map<String, LatLngBounds> LandmarkpolygonBoundsMap = {};
  Map<String, LatLngBounds> roompolygonBoundsMap = {};
  Map<String, LatLngBounds> roompolygon2BoundsMap = {};
  Map<String, LatLngBounds> roompolygon3BoundsMap = {};
  Map<String, LatLngBounds> roompolygon4BoundsMap = {};
  String _iconImagePath = 'assets/north-compass.png'; // Default image
  bool hasSpecificRooms = true;
// Map to hold polygon names and their bounds
  double _currentZoom = 17.4;
  LatLng _currentCenter = LatLng(11.011528, 124.604616);
  double initialZoom = 17.4;
  LatLng southcompassCenter = LatLng(11.010897, 124.604359);
  LatLng initialCenter = LatLng(11.011528, 124.604616); // Default center
  // Layer visibility states
  bool isLayer1Visible = false;
  bool isLayer2Visible = false;
  bool isLayer3Visible = false;
  bool isLayer4Visible = false;
  bool isRoomLayerVisible = false;
  bool isRoomLayer2Visible = false;
  bool isRoomLayer3Visible = false;
  bool isRoomLayer4Visible = false;
  List<Polygon> highlightedPolygons = [];
  List<Polygon> mainPolygons = [];
  bool isLayerButtonVisible = false;
  bool _isFacingSouth = false;
  bool areLayerButtonsVisible = false;
  bool isCategoryBarVisible = false;
  List<Marker> markers = [];
  final TextEditingController _searchController = TextEditingController();
  List<String> _searchResults = [];
  List<Polygon> allPolygons = [];
  List<Polygon> RoomPolygons = [];
  bool _isSearchClicked = false;
  int _selectedIndex = 1;
  LatLng? polygonCenter;
  double? _heading;
  void updateInfoContainer(
    //BuildContext context, // Ensure you pass the context
    String? roomName,
    String? teacherName,
    String? buildingName,
    String? roombuildingName,
    String? buildingImage,
    String? buildingImage2,
    String? buildingImage3, {
    int? numberOfFloors,
    int? numberOfRooms,
    int? floorNo,
    String? roomType,
    String? curriculum,
    String? roomNo,
    String? yearLevel,
    String? landmarkName,
    String? LandmarkImage,
    String? LandmarkImage2,
    String? LandmarkImage3,
  }) {
    showDialog(
      context: context,
      // barrierDismissible: true,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.6,
            // Adjust width as needed
            child: InfoContainer(
              roomName: roomName,
              teacherName: teacherName,
              buildingName: landmarkName != null && landmarkName.isNotEmpty
                  ? ''
                  : buildingName,
              landmarkName: landmarkName,
              buildingImage: landmarkName != null && landmarkName.isNotEmpty
                  ? LandmarkImage
                  : buildingImage,
              buildingImage2: landmarkName != null && landmarkName.isNotEmpty
                  ? LandmarkImage2
                  : buildingImage2,
              buildingImage3: landmarkName != null && landmarkName.isNotEmpty
                  ? LandmarkImage3
                  : buildingImage3,
              roombuildingName: roomName != null ? roombuildingName ?? '' : '',
              numberOfFloors: numberOfFloors,
              numberOfRooms: numberOfRooms,
              floorNo: floorNo,
              roomType: roomType,
              curriculum: curriculum,
              roomNo: roomNo,
              yearLevel: yearLevel,
              onClose: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        );
      },
    );
  }

  void _fetchDataForCategory(Map<String, String> buildingsMap) async {
    print('Before fetching: $buildingsMap');
    await fetchRoomsForBuilding();
    print('After fetching: $buildingsMap');

    setState(() {
      _markers.clear();
      print('Buildings with specific rooms in the category:');

      for (var entry in buildingsMap.entries) {
        String buildingName = entry.key;
        String polygonName = entry.value;

        if (polygonBoundsMap.containsKey(polygonName)) {
          LatLngBounds bounds = polygonBoundsMap[polygonName]!;
          LatLng center = LatLng(
            (bounds.northEast.latitude + bounds.southWest.latitude) / 2,
            (bounds.northEast.longitude + bounds.southWest.longitude) / 2,
          );

          _markers.add(Marker(
            point: center,
            child: Transform.rotate(
              angle: _markerRotation,
              child: Icon(Icons.location_on, color: Colors.redAccent),
            ),
          ));
          print('Added marker for $buildingName at: $center');
        } else {
          print('No polygon found for $polygonName');
        }

        print('Building: $buildingName, BuildingPolygonName: $polygonName');
      }
      print('Total count: ${buildingsMap.length}');
    });
  }

// Now call the generic function with each specific map
  void _fetchData() => _fetchDataForCategory(buildingsWithSpecificRooms);
  void _fetchDataForGrade8() =>
      _fetchDataForCategory(buildingsWithSpecificRooms8);
  void _fetchDataForGrade9() =>
      _fetchDataForCategory(buildingsWithSpecificRooms9);
  void _fetchDataForGrade10() =>
      _fetchDataForCategory(buildingsWithSpecificRooms10);
  void _fetchDataForTLE() =>
      _fetchDataForCategory(buildingsWithSpecificRoomsTLE);
  void _fetchDataForOffices() =>
      _fetchDataForCategory(buildingsWithSpecificRoomsOffices);
  void _fetchDataForLaboratory() =>
      _fetchDataForCategory(buildingsWithSpecificRoomsLaboratory);
// para ni sa tap if mo tap sila sa map
  void _onMapTap(LatLng tappedPoint) {
    bool polygonTapped = false;
    // Clear existing markers and polygons before checking the new tap
    setState(() {
      tapmarkers.clear();
      tap_polygons.clear();
    });
    if (isRoomLayerVisible ||
        isRoomLayer2Visible ||
        isRoomLayer3Visible ||
        isRoomLayer4Visible) {
      // Check all room layers and their respective polygon maps
      Map<String, LatLngBounds>? selectedRoomPolygonBoundsMap;
      // Determine which layer is visible and assign the correct bounds map
      if (isRoomLayerVisible) {
        selectedRoomPolygonBoundsMap = roompolygonBoundsMap;
      } else if (isRoomLayer2Visible) {
        selectedRoomPolygonBoundsMap = roompolygon2BoundsMap;
      } else if (isRoomLayer3Visible) {
        selectedRoomPolygonBoundsMap = roompolygon3BoundsMap;
      } else if (isRoomLayer4Visible) {
        selectedRoomPolygonBoundsMap = roompolygon4BoundsMap;
      }
      // Ensure the map is not null before checking entries
      if (selectedRoomPolygonBoundsMap != null) {
        for (var entry in selectedRoomPolygonBoundsMap.entries) {
          if (entry.value.contains(tappedPoint)) {
            print('Tapped Room Polygon: ${entry.key}');
            String polygonName = entry.key; // The polygon key
            String? fullRoomName = polygonToRoomBuildingMap[polygonName];

            if (fullRoomName != null) {
              Marker newMarker =
                  _createMarkerForPolygon(fullRoomName, entry.value);
              setState(() {
                tapmarkers.add(newMarker);
                // Loop through all polygons and check if the tap point is inside any polygon
                for (var polygon in RoomPolygons) {
                  if (isPointInPolygon(tappedPoint, polygon.points)) {
                    highlightedPolygon(polygon); // Highlight the tapped polygon
                    break; // Exit loop once we find the tapped polygon
                  }
                }
              });
              print('Full Room Name: $fullRoomName');
            } else {
              print('Room not found for polygon: ${entry.key}');
            }
            return;
          }
        }
      }
      if (!polygonTapped) {
        tap_polygons = [];
        tapmarkers = []; // Clear markers if no polygon is tapped
        print('Tap point $tappedPoint is outside all polygons.');
      }
      print('Tap point $tappedPoint is outside all room polygons.');
    } else {
      for (var entry in LandmarkpolygonBoundsMap.entries) {
        if (entry.value.contains(tappedPoint)) {
          print('Tapped Landmark Polygon: ${entry.key}');
          String polygonName = entry.key; // The polygon key
          String? landmarkName = polygonToLandmarkMap[polygonName];
          if (landmarkName != null) {
            Marker newMarker =
                _createMarkerForPolygon(landmarkName, entry.value);
            setState(() {
              tapmarkers.add(newMarker);
              // Loop through all polygons and check if the tap point is inside any polygon
              for (var polygon in allPolygons) {
                if (isPointInPolygon(tappedPoint, polygon.points)) {
                  highlightedPolygon(polygon);
                  // Highlight the tapped polygon
                  polygonTapped = true;
                  break; // Exit loop once we find the tapped polygon
                }
              }
            });
          }
          return;
        }
      }
    }
    // Room layers are not visible, check for building polygons
    for (var entry in polygonBoundsMap.entries) {
      if (entry.value.contains(tappedPoint)) {
        print('Tapped Building Polygon: ${entry.key}');
        String polygonName = entry.key; // The polygon key
        String? buildingName = polygonToBuildingMap[polygonName];

        if (buildingName != null) {
          Marker newMarker = _createMarkerForPolygon(buildingName, entry.value);
          setState(() {
            tapmarkers.add(newMarker);

            // Loop through all polygons and check if the tap point is inside any polygon
            for (var polygon in allPolygons) {
              if (isPointInPolygon(tappedPoint, polygon.points)) {
                highlightedPolygon(polygon);

                polygonTapped = true;

                break; // Exit loop once we find the tapped polygon
              }
            }
          });
          // print('Building Name: $buildingName');
        } else {
          // print('Building not found for polygon: ${entry.key}');
        }
        return;
      }
    }
    if (!polygonTapped) {
      print('No polygon was tapped, clearing polygons and markers.');
      setState(() {
        tap_polygons = []; // Clear highlighted polygons
        tapmarkers = []; // Clear markers if no polygon is tapped
      });
    }
  }

  Marker _createMarkerForPolygon(String name, LatLngBounds bounds) {
    LatLng center = LatLng(
      (bounds.north + bounds.south) / 2,
      (bounds.east + bounds.west) / 2,
    );
    LatLng offsetCenter = offsetPointAbove(center, 0.0001);

    return Marker(
      point: offsetCenter,
      width: 200.0,
      height: 20.0,
      child: Transform.rotate(
        angle: _markerRotation, // Apply the rotation to both text and icon
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 12, // Reduce font size to fit within bounds
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isPointInPolygon(LatLng point, List<LatLng> polygon) {
    int n = polygon.length;
    bool inside = false;

    for (int i = 0, j = n - 1; i < n; j = i++) {
      if (((polygon[i].longitude > point.longitude) !=
              (polygon[j].longitude > point.longitude)) &&
          (point.latitude <
              (polygon[j].latitude - polygon[i].latitude) *
                      (point.longitude - polygon[i].longitude) /
                      (polygon[j].longitude - polygon[i].longitude) +
                  polygon[i].latitude)) {
        inside = !inside;
      }
    }

    return inside;
  }

  void updateMapLayers(Polygon? polygon) {
    if (polygon == null) {
      setState(() {
        polygons.clear(); // Assume polygons is a List<Polygon>
      });
    } else {
      setState(() {
        polygons.add(polygon);
      });
    }
  }

  void updateMapLayerss(Polygon? polygon) {
    if (polygon == null) {
      setState(() {
        tap_polygons.clear(); // Assume polygons is a List<Polygon>
      });
    } else {
      setState(() {
        tap_polygons.add(polygon);
      });
    }
  }

  void highlightedPolygon(Polygon polygon) {
    final Polygon highlightedPolygon = Polygon(
      points: polygon.points,
      color: Colors.yellowAccent,
      borderStrokeWidth: 1.0,
      borderColor: const Color.fromARGB(255, 173, 202, 5),
    );

    final Polygon mainPolygons = Polygon(
      points: polygon.points,
      color: Colors.yellowAccent,
      borderStrokeWidth: 1.0,
      borderColor: const Color.fromARGB(255, 173, 202, 5),
    );

    updateMapLayerss(highlightedPolygon);
    updateMapLayerss(mainPolygons);
    print('polygonname: $polygon.points');

    LatLng polygonCenter = _calculatePolygonCenter(polygon.points);

    // Move and zoom the map to the polygon's center
    _moveMapToLocation(polygonCenter);

    print('Polygon center: $polygonCenter');
  }

// Function to calculate the center of the polygon based on its points
  LatLng _calculatePolygonCenter(List<LatLng> points) {
    double totalLat = 0;
    double totalLng = 0;

    for (LatLng point in points) {
      totalLat += point.latitude;
      totalLng += point.longitude;
    }

    double centerLat = totalLat / points.length;
    double centerLng = totalLng / points.length;

    return LatLng(centerLat, centerLng);
  }

// Function to move the map to the specified location with zoom
  void _moveMapToLocation(LatLng location) {
    mapController.move(location, 20.0); // Move to location with zoom level 18
  }

//para sa zoom in og out
  void _zoomout() {
    _currentZoom = _currentZoom - 1;
    mapController.move(_currentCenter, _currentZoom);
  }

  void _zoomin() {
    _currentZoom = _currentZoom + 1;
    mapController.move(_currentCenter, _currentZoom);
  }

//para ni sa search function kani sila
  // Function to update map markers if nagsearch i update niyang markers
  void updateMarkers() {
    setState(() {});
  }

  // Function to update floor visibility if nagsearch i update niyang floor
  void updateFloorVisibility(int? floorNo) {
    setState(() {
      // Reset visibility for all layers if no specific floor is selected
      if (floorNo == null) {
        isLayer1Visible = false;
        isLayer2Visible = false;
        isLayer3Visible = false;
        isLayer4Visible = false;
      } else {
        // Update visibility for the specific floor number
        isLayer1Visible = floorNo == 1;
        isLayer2Visible = floorNo == 2;
        isLayer3Visible = floorNo == 3;
        isLayer4Visible = floorNo == 4;
      }
    });
  }

  void onSearchChanged(String query) async {
    if (query.isNotEmpty) {
      _searchResults = await getSearchSuggestions(query); // Fetch suggestions
      setState(() {}); // Update UI with new search results
    } else if (_searchResults.isNotEmpty) {
      _searchResults.clear();
      setState(() {}); // Only update UI if results were previously non-empty
    }
  }

  void setLayerButtonVisibility(bool isVisible) {
    setState(() {
      isLayerButtonVisible = isVisible;
    });
  }

  // Function to perform the search when an item is tapped or search is submitted
  Future<void> performSearch(BuildContext context,
      {String? selectedResult, double markerRotation = 0.0}) async {
    // Set the search field text if a specific result is selected
    if (selectedResult != null) {
      _searchController.text = selectedResult;
    }

    // Check if the search field is empty
    if (_searchController.text.trim().isEmpty) {
      print("Search field is empty");
      return; // Exit the function if there's no query
    }
    // Proceed with the search operation
    await searchBuildings(
      _searchController.text,
      mapController,
      markers,
      updateMarkers,
      updateMapLayers,
      setLayerVisibility,
      updateFloorVisibility,
      context,
      setLayerButtonVisibility,
      updateInfoContainer,
      _markerRotation,
    );

    // Check if there are search results to display
    bool searchSuccessful = markers.isNotEmpty || polygons.isNotEmpty;
    if (mounted) {
      setState(() {
        _isSearchClicked = searchSuccessful;
        _searchResults.clear(); // Clear suggestions after search
        tapmarkers.clear();
        tap_polygons.clear();
        _markers.clear();
      });
    }
  }

  // para ni sa layers na button if iya itap tong naay 1f, 2f,3f, 4f ma visible or dili
  void setLayerVisibility({
    bool? layer1Visible,
    bool? layer2Visible,
    bool? layer3Visible,
    bool? layer4Visible,
    bool? roomLayerVisible,
    bool? roomLayer2Visible,
    bool? roomLayer3Visible,
    bool? roomLayer4Visible,
  }) {
    setState(() {
      // If a layer is set to visible, deactivate others
      if (layer1Visible != null && layer1Visible && roomLayerVisible != null) {
        isLayer1Visible = layer1Visible ? !isLayer1Visible : isLayer1Visible;
        isRoomLayerVisible =
            roomLayerVisible ? !isRoomLayerVisible : isRoomLayerVisible;
        isLayer2Visible = false;
        isLayer3Visible = false;
        isLayer4Visible = false;
        isRoomLayer2Visible = false;
        isRoomLayer3Visible = false;
        isRoomLayer4Visible = false;
      } else if (layer2Visible != null &&
          layer2Visible &&
          roomLayer2Visible != null) {
        isLayer1Visible = false;
        isLayer2Visible = layer2Visible ? !isLayer2Visible : isLayer2Visible;
        isRoomLayer2Visible =
            roomLayer2Visible ? !isRoomLayer2Visible : isRoomLayer2Visible;
        isLayer3Visible = false;
        isLayer4Visible = false;
        isRoomLayerVisible = false;
        isRoomLayer3Visible = false;
        isRoomLayer4Visible = false;
      } else if (layer3Visible != null &&
          layer3Visible &&
          roomLayer3Visible != null) {
        isLayer1Visible = false;
        isLayer2Visible = false;
        isLayer3Visible = layer3Visible ? !isLayer3Visible : isLayer3Visible;
        isRoomLayer3Visible =
            roomLayer3Visible ? !isRoomLayer3Visible : isRoomLayer3Visible;
        isLayer4Visible = false;
        isRoomLayer2Visible = false;
        isRoomLayerVisible = false;
        isRoomLayer4Visible = false;
      } else if (layer4Visible != null &&
          layer4Visible &&
          roomLayer4Visible != null) {
        isLayer1Visible = false;
        isLayer2Visible = false;
        isLayer3Visible = false;
        isLayer4Visible = layer4Visible ? !isLayer4Visible : isLayer4Visible;
        isRoomLayer4Visible =
            roomLayer4Visible ? !isRoomLayer4Visible : isRoomLayer4Visible;
        isRoomLayer2Visible = false;
        isRoomLayer3Visible = false;
        isRoomLayerVisible = false;
      }
    });
  }

  // Function to handle search input changes and show suggestions
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      if (_selectedIndex == 0) {
        // Show the CategoryIcon popup menu with custom styling and animation
        showMenu(
          context: context,
          position: RelativeRect.fromLTRB(50, 650, 50, 0), // Adjust position
          items: [
            PopupMenuItem<String>(
              value: 'Grade7Buildings',
              child: _buildMenuItem(Icons.apartment, 'Grade 7 Buildings'),
            ),
            PopupMenuItem<String>(
              value: 'Grade8Buildings',
              child: _buildMenuItem(Icons.apartment, 'Grade 8 Buildings'),
            ),
            PopupMenuItem<String>(
              value: 'Grade9Buildings',
              child: _buildMenuItem(Icons.apartment, 'Grade 9 Buildings'),
            ),
            PopupMenuItem<String>(
              value: 'Grade10Buildings',
              child: _buildMenuItem(Icons.apartment, 'Grade 10 Buildings'),
            ),
            PopupMenuItem<String>(
              value: 'Offices',
              child: _buildMenuItem(Icons.business, 'Offices'),
            ),
            PopupMenuItem<String>(
              value: 'Laboratory',
              child: _buildMenuItem(Icons.science, 'Laboratory'),
            ),
            PopupMenuItem<String>(
              value: 'TLEBuildings',
              child: _buildMenuItem(Icons.build, 'TLE Buildings'),
            ),
          ],
          elevation: 10.0,
          color: Colors.blueGrey[50], // Light background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // Rounded edges
          ),
          constraints: BoxConstraints(
            maxHeight: 200, // Adjust height for visible items
          ),
        ).then((value) {
          if (value != null) {
            // Handle the selected value and add markers
            print('Selected: $value');
            _handleSelectedCategory(value);
          }
        });
      } else if (_selectedIndex == 1) {
        // Call refreshMap when index is 1
        _refreshMap();
        print('Selected index 1, calling _refreshMap');
      } else if (_selectedIndex == 2) {
        _refreshMap();
        // Navigator.of(context).pop();
        _showUpdateMessage();
        // Navigate to another screen if needed
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => NavigationScreen()),
        //  );
      } else {
        isCategoryBarVisible = false;
      }
    });
  }

// Helper method to build menu items with icons and text
  Widget _buildMenuItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.blueGrey[600], // Icon color
        ),
        SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(
            color: Colors.blueGrey[900], // Text color
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

// Handle the category selection and data fetching
  void _handleSelectedCategory(String value) {
    if (value == 'Grade7Buildings') {
      _fetchData(); // Fetch and display Grade 7 buildings
    } else if (value == 'Grade8Buildings') {
      _fetchDataForGrade8(); // Fetch and display Grade 8 buildings
    } else if (value == 'Grade9Buildings') {
      _fetchDataForGrade9(); // Fetch and display Grade 9 buildings
    } else if (value == 'Grade10Buildings') {
      _fetchDataForGrade10(); // Fetch and display Grade 10 buildings
    } else if (value == 'TLEBuildings') {
      _fetchDataForTLE(); // Fetch and display TLE buildings
    } else if (value == 'Offices') {
      _fetchDataForOffices(); // Fetch and display TLE buildings
    } else if (value == 'Laboratory') {
      _fetchDataForLaboratory(); // Fetch and display TLE buildings
    }
  }

  @override
  void initState() {
    super.initState();
    mapControllers = MapController();
    // fetchRoomsWithSpecificCriteria();
    List<Polygon> buildingPolygons = initializePolygons(polygonBoundsMap);
    List<Polygon> LandmarkPolygons =
        initializeLandmarkPolygons(LandmarkpolygonBoundsMap);
    List<Polygon> roomPolygons1 = initializeRoomPolygons1(roompolygonBoundsMap);
    List<Polygon> roomPolygons2 =
        initializeRoomPolygons2(roompolygon2BoundsMap);
    List<Polygon> roomPolygons3 =
        initializeRoomPolygons3(roompolygon3BoundsMap);
    List<Polygon> roomPolygons4 =
        initializeRoomPolygons4(roompolygon4BoundsMap);
    RoomPolygons = [
      ...roomPolygons1,
      ...roomPolygons2,
      ...roomPolygons3,
      ...roomPolygons4
    ];
    allPolygons = buildingPolygons + LandmarkPolygons;
    initializeRoomPolygons1(roompolygonBoundsMap);
    fetchBuildingsData().then((_) {
      fetchRoomsForBuilding().then((_) {});
    });
  }

  //double _mapRotation = 0.0; // Initial rotation angle

// Update this variable in your _resetMapRotation method
  void _resetMapRotation() {
    setState(() {
      if (_isFacingSouth) {
        mapController.rotate(0); // Rotate to North
        _iconImagePath = 'assets/north-compass.png';
        _markerRotation = 0; // Reset marker rotation to north
        //  _mapRotation = 0;
        mapController.move(
            initialCenter, _currentZoom); // Update the rotation state
        // Update the rotation state
      } else {
        mapController.rotate(180); // Rotate to South
        _iconImagePath = 'assets/south-compass.png';
        _markerRotation = 3.1416; // Rotate markers to 180 degrees (pi radians)
        // _mapRotation = 180;
        mapController.move(
            southcompassCenter, _currentZoom); // Update the rotation state
      }
      _isFacingSouth = !_isFacingSouth;
    });
  }

  Future<void> _refreshMap() async {
    print('Refresh map called'); // Debugging purpose

    // Synchronously update state
    setState(() {
      mapController.move(initialCenter, initialZoom);
      markers.clear();
      polygons.clear();
      tap_polygons.clear();
      _markers.clear();
      tapmarkers.clear();
      _isSearchClicked = false;
      _searchController.clear();
      isLayer1Visible = false;
      isLayer2Visible = false;
      isLayer3Visible = false;
      isLayer4Visible = false;
      isRoomLayerVisible = false;
      isRoomLayer2Visible = false;
      isRoomLayer3Visible = false;
      isRoomLayer4Visible = false;
      areLayerButtonsVisible = false;
      _searchResults.clear();
    });

    // Perform async tasks after state has been updated
    await fetchBuildingsData();
    await fetchRoomsForBuilding();
    await fetchLandmarks();

    // Optional delay for debugging
    await Future.delayed(Duration(seconds: 1));
    print('Map refreshed'); // Debugging purpose
  }

  bool _isPointInPolygon(LatLng point, List<LatLng> polygon) {
    int n = polygon.length;
    bool inside = false;

    for (int i = 0, j = n - 1; i < n; j = i++) {
      if (((polygon[i].longitude > point.longitude) !=
              (polygon[j].longitude > point.longitude)) &&
          (point.latitude <
              (polygon[j].latitude - polygon[i].latitude) *
                      (point.longitude - polygon[i].longitude) /
                      (polygon[j].longitude - polygon[i].longitude) +
                  polygon[i].latitude)) {
        inside = !inside;
      }
    }

    return inside;
  }

// setState(() {
//     currentSearchQuery = cleanSearchQuery; // Update the state here
//   });
  void checkTapPoint(LatLng tappedPoint) {
    bool polygonTapped = false; // Flag to check if any polygon was tapped

    // Loop through all polygons and check if the tap point is inside any polygon
    for (var polygon in allPolygons) {
      if (isPointInPolygon(tappedPoint, polygon.points)) {
        // highlightPolygon(polygon); // Highlight the tapped polygon
        polygonTapped = true;

        break; // Exit loop once we find the tapped polygon
      }
    }

    // If no polygon was tapped, reset state
    if (!polygonTapped) {
      print('No polygon was tapped, clearing polygons and markers.');

      // Debugging print statements
      print(
          'Before clear: markers length: ${markers.length}, polygons length: ${polygons.length}');

      setState(() {
        polygons.clear(); // Clear highlighted polygons
        markers.clear(); // Clear markers if no polygon is tapped
      });

      // Check if the clear action worked
      print(
          'After clear: markers length: ${markers.length}, polygons length: ${polygons.length}');

      print('Tap point $tappedPoint is outside all polygons.');
    }
  }

  void _showUpdateMessage() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Data is Updated'),
          content: Text('You are up to date!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'NOCNHS Mobile Map',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ), // Set text color here
        ),
        backgroundColor: Colors.red[900],
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.legend_toggle),
            onPressed: () {
              _showLegendDialog(context);
            },
          ),
        ],
      ),
      // drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: <Widget>[
      //       DrawerHeader(
      //         decoration: BoxDecoration(
      //           color: Colors.red[900],
      //         ),
      //         child: Container(
      //           child: Column(
      //             mainAxisAlignment:
      //                 MainAxisAlignment.center, // Center the content vertically
      //             children: [
      //               Image.asset(
      //                 'assets/logo.png', // Update this path to your logo image
      //                 fit: BoxFit.contain, // Adjust the fit as necessary
      //                 height: 100,
      //                 width: 100.0, // Adjust height as needed
      //               ),
      //               SizedBox(
      //                   height: 5), // Adds space between the logo and the text
      //               Text(
      //                 'NOCNHS',
      //                 style: TextStyle(
      //                   color: Colors.white,
      //                   fontSize: 18,
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.info),
      //         title: Text('About'),
      //         onTap: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => AboutPage()),
      //           );
      //         },
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.help),
      //         title: Text('Help'),
      //         onTap: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => HelpPage()),
      //           );
      //         },
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.feedback),
      //         title: Text('Feedback'),
      //         onTap: () async {
      //           const url = 'https://forms.gle/NWw9sY1aYH7kjzBu9';
      //           final Uri uri = Uri.parse(url);

      //           if (await canLaunchUrl(uri)) {
      //             await launchUrl(uri);
      //           } else {
      //             throw 'Could not launch $url';
      //           }
      //         },
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.download),
      //         title: Text('Update Data'),
      //         onTap: () {
      //           _refreshMap();
      //           Navigator.of(context).pop();
      //           _showUpdateMessage();
      //         },
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.exit_to_app),
      //         title: Text('Exit'),
      //         onTap: () {
      //           exit(0); // Exit for both Android and iOS
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      body: RefreshIndicator(
        onRefresh: _refreshMap, // Call the refresh function
        child: Stack(
          children: [
            FlutterMap(
              options: MapOptions(
                initialCenter: _currentCenter, // Initial center of the map
                initialZoom: _currentZoom,
                minZoom: 17.4,
                maxZoom: 20,
                onTap: (_, tappedPoint) =>
                    _onMapTap(tappedPoint), // Initial zoom level
              ),
              mapController: mapController,
              children: build_MapLayers(
                mapController,
                _markers,
                [],
                markers,
                tapmarkers,
                polygons,
                tap_polygons,
                isLayer1Visible,
                isLayer2Visible,
                isLayer3Visible,
                isLayer4Visible,
              ),
            ),
            Positioned(
              top: 100,
              left: 10,
              child: GestureDetector(
                onTap: _resetMapRotation,
                child: Container(
                  width: 60, // Adjust the width
                  height: 60, // Adjust the height
                  child: Image.asset(
                    _iconImagePath, // Replace with your image path
                    fit: BoxFit.contain, // Adjust to maintain aspect ratio
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10.0,
              left: 10,
              child: Container(
                color: Colors.black
                    .withOpacity(0.5), // Semi-transparent background
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: Text(
                  '© OpenStreetMap contributors',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 120,
              right: 20,
              child: FloatingActionButton(
                heroTag: 'uniqueTagForButton1',
                onPressed: _zoomin, // Call the zoom function
                child: Icon(Icons.add),
                backgroundColor: Colors.white, // Set the background color here
                foregroundColor: Colors.black,
              ),
            ),

            Positioned(
              top: 180,
              right: 20,
              child: FloatingActionButton(
                heroTag: 'uniqueTagForButton2',
                onPressed: _zoomout, // Call the zoom function
                child: Icon(Icons.remove),
                backgroundColor: Colors.white, // Set the background color here
                foregroundColor: Colors.black,
              ),
            ),
            // Search and results UI
            Positioned(
              top: 45,
              left: 10,
              right: 10,
              child: Container(
                height: _searchResults.isNotEmpty ? 200 : 49,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
                  ],
                ),

                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                           child: TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                              labelText: 'Search Building',
                              labelStyle: TextStyle(
                                color: Colors.black, // Label color
                              ),
                              hintText:
                                  'Search for a building, room, or teacher...',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(
                                  color: Colors.black45, // Border color
                                  width: 2.0, // Border width
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                // Focused border
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(
                                  color: Colors.black45, // Focused border color
                                  width: 2.0,
                                ),
                              ),
                              suffixIcon: _searchController.text.isNotEmpty
                                  ? IconButton(
                                      icon:
                                          Icon(Icons.clear, color: Colors.red),
                                      onPressed: () {
                                        _searchController.clear();
                                        //  _searchController.clear();
                                        _searchResults.clear();
                                        onSearchChanged('');
                                        setState(() {});
                                      },
                                    )
                                  : IconButton(
                                      icon: Icon(Icons.search,
                                          color: Colors.indigo),
                                      onPressed: () async {
                                        if (_searchController.text
                                            .trim()
                                            .isNotEmpty) {
                                          await performSearch(context);
                                        } else {
                                          print("Search field is empty");
                                        }
                                      },
                                    ),
                            ),
                            onChanged: (value) {
                              setState(() {}); // Update UI when text changes
                              if (value.trim().isNotEmpty) {
                                onSearchChanged(value);
                              }
                              areLayerButtonsVisible = false;
                              _markers.clear(); // Trigger search change
                              tapmarkers.clear();
                              tap_polygons.clear();
                            },
                            onSubmitted: (value) => performSearch(context),
                          ),
                        ),
                      ],
                    ),
                    if (_searchResults
                        .isNotEmpty) // Display results if available
                      Expanded(
                        child: ListView.builder(
                          itemCount: _searchResults.length,
                          itemBuilder: (context, index) {
                            String displayedName = _searchResults[index];
                            String actualName = displayedName.replaceAll(
                                ' (newly updated)',
                                ''); // Clean up for actual name
                            bool isNewlyUpdated = displayedName.contains(
                                '(newly updated)'); // Check if it's newly updated

                            return ListTile(
                              title: Row(
                                children: [
                                  Text(actualName), // Display the actual name
                                  if (isNewlyUpdated) // Only display the blue oblong if newly updated
                                    Container(
                                      margin: EdgeInsets.only(
                                          left:
                                              8.0), // Space between text and tag
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0,
                                          vertical:
                                              5.0), // Padding for the oblong
                                      decoration: BoxDecoration(
                                        color: Colors.red[
                                            900], // Blue background for the tag
                                        borderRadius: BorderRadius.circular(
                                            20.0), // Make it an oblong shape
                                      ),
                                      child: Text(
                                        'newly updated',
                                        style: TextStyle(
                                          color: Colors
                                              .white, // White text on blue background
                                          fontSize:
                                              12.0, // Smaller text size for the tag
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              onTap: () async {
                                _searchController.text = actualName;

                                await performSearch(
                                  context,
                                  selectedResult: actualName,
                                  markerRotation: _markerRotation,
                                );
                              },
                            );
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ),

            if (_isSearchClicked) // Display circles only when search is clicked
              SizedBox(height: 10), // Space between search bar and circles
            if (_isSearchClicked) // Display circles only when search is clicked
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildCircleButton(1, '1f'),
                  buildCircleButton(2, '2f'),
                  buildCircleButton(3, '3f'),
                  buildCircleButton(4, '4f'),
                ],
              ),

            Positioned(
              bottom: 60,
              right: 20,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FloatingActionButton(
                    heroTag: 'mainLayerButton',
                    onPressed: () {
                      setState(() {
                        areLayerButtonsVisible = !areLayerButtonsVisible;
                      });
                    },
                    backgroundColor: Colors.red[900],
                    child: Transform.rotate(
                      angle: 45 * 3.14 / 180,
                      child: Icon(Icons.layers, color: Colors.white),
                    ),
                  ),
                  if (areLayerButtonsVisible)
                    Column(
                      children: [
                        FloatingActionButton(
                          heroTag: 'layer1Button',
                          onPressed: () {
                            setLayerVisibility(
                              layer1Visible: true,
                              layer2Visible: false,
                              layer3Visible: false,
                              layer4Visible: false,
                              roomLayerVisible: true,
                              roomLayer2Visible: false,
                              roomLayer3Visible: false,
                              roomLayer4Visible: false,
                            );
                          },
                          backgroundColor:
                              const Color.fromARGB(255, 100, 180, 247),
                          child: Text(
                            '1f',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: isLayer1Visible || isRoomLayerVisible
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                        FloatingActionButton(
                          heroTag: 'layer2Button',
                          onPressed: () {
                            setLayerVisibility(
                              layer1Visible: false,
                              layer2Visible: true,
                              layer3Visible: false,
                              layer4Visible: false,
                              roomLayerVisible: false,
                              roomLayer2Visible: true,
                              roomLayer3Visible: false,
                              roomLayer4Visible: false,
                            );
                          },
                          backgroundColor:
                              const Color.fromARGB(255, 245, 196, 175),
                          child: Text(
                            '2f',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: isLayer2Visible || isRoomLayer2Visible
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                        FloatingActionButton(
                          heroTag: 'layer3Button',
                          onPressed: () {
                            setLayerVisibility(
                              layer1Visible: false,
                              layer2Visible: false,
                              layer3Visible: true,
                              layer4Visible: false,
                              roomLayerVisible: false,
                              roomLayer2Visible: false,
                              roomLayer3Visible: true,
                              roomLayer4Visible: false,
                            );
                          },
                          backgroundColor: Colors.orangeAccent,
                          child: Text(
                            '3f',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: isLayer3Visible || isRoomLayer3Visible
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                        FloatingActionButton(
                          heroTag: 'layer4Button',
                          onPressed: () {
                            setLayerVisibility(
                              layer1Visible: false,
                              layer2Visible: false,
                              layer3Visible: false,
                              layer4Visible: true,
                              roomLayerVisible: false,
                              roomLayer2Visible: false,
                              roomLayer3Visible: false,
                              roomLayer4Visible: true,
                            );
                          },
                          backgroundColor: Colors.green,
                          child: Text(
                            '4f',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: isLayer4Visible || isRoomLayer4Visible
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.location_pin),
            label: 'Areas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.refresh),
            label: 'Reload',
          ),
        ],
      ),
    );
  }

  Widget buildCircleButton(int floorNo, String label) {
    return GestureDetector(
      // onTap: () {
      //   // updateFloorVisibility(floorNo);
      // },
      child: CircleAvatar(
        backgroundColor: _getCircleColor(floorNo),
        radius: 20,
        child: Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Color _getCircleColor(int floorNo) {
    switch (floorNo) {
      case 1:
        return isLayer1Visible
            ? const Color.fromARGB(255, 100, 180, 247)
            : Colors.grey;
      case 2:
        return isLayer2Visible
            ? const Color.fromARGB(255, 245, 196, 175)
            : Colors.grey;
      case 3:
        return isLayer3Visible ? Colors.orangeAccent : Colors.grey;
      case 4:
        return isLayer4Visible ? Colors.green : Colors.grey;

      default:
        return Colors.grey;
    }
  }
}

void _showLegendDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          'Legend',
          style: TextStyle(
              color: Colors.black87), // Change title text color to white
        ),
        backgroundColor:
            Colors.white70, // Make the dialog background transparent
        content: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Colors
                  .transparent, // Slightly transparent white background for the container
              borderRadius:
                  BorderRadius.circular(10), // Optional: rounded corners
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0), // Add padding for spacing
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.center, // Center column items
                children: <Widget>[
                  _buildLegendItem(
                      const Color.fromARGB(255, 167, 158, 152), 'Buildings'),
                  _buildLegendItem(const Color.fromARGB(255, 100, 180, 247),
                      '1st Floor Rooms'),
                  _buildLegendItem(const Color.fromARGB(255, 245, 196, 175),
                      '2nd Floor Rooms'),
                  _buildLegendItem(Colors.orangeAccent, '3rd Floor Rooms'),
                  _buildLegendItem(Colors.green, '4th Floor Rooms'),
                  _buildLegendItem(Colors.blueGrey, 'Landmarks'),
                  _buildLegendItem(
                      const Color.fromARGB(255, 138, 125, 120), 'Canteens'),
                  _buildLegendItem(const Color.fromARGB(255, 216, 209, 143),
                      'Comfort Rooms (outside)'),
                  _buildLegendItem(Colors.white, 'Comfort Rooms (inside)'),
                ],
              ),
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'Close',
              style: TextStyle(
                  color: Colors.black87), // Change button text color to white
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Widget _buildLegendItem(Color color, String text) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start, // Center the row items
    children: [
      Container(
        width: 20,
        height: 20,
        color: color,
      ),
      const SizedBox(width: 20), // Space between color box and text
      Text(
        text,
        style: const TextStyle(
            color: Colors.black87), // Change text color to white
      ),
    ],
  );
}
