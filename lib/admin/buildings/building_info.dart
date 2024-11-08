import 'package:flutter/material.dart';
import 'service.dart';
import 'building_rooms.dart';
import 'building_edit.dart';
import 'add_rooms.dart';
import 'add_cr.dart';
import 'package:intl/intl.dart';


class BuildingInfo extends StatefulWidget {
  @override
  _BuildingInfoState createState() => _BuildingInfoState();
}

class _BuildingInfoState extends State<BuildingInfo> {
  Future<List<Map<String, dynamic>>>? _buildingInfoFuture;
  TextEditingController _searchController = TextEditingController();
  bool _isAddingBuilding = false;
  bool _isEditingBuilding = false;
  bool _isAddingRoom = false;
  bool _isAddingCR = false;

  Map<String, dynamic>? _buildToEdit;
  final _buildingService = BuildingService(); // Create an instance of BuildingService


  @override
  void initState() {
    super.initState();
    _fetchBuildingInfo();
    _searchController.addListener(_onSearchChanged);
  }

    void _fetchBuildingInfo([String searchQuery = '']) {
    setState(() {
      _buildingInfoFuture = _buildingService.fetchBuildingInfo(searchQuery);
    });
  }

  void _onSearchChanged() {
    _fetchBuildingInfo(_searchController.text);
  }

  void _toggleAddBuilding() {
    setState(() {
      _isAddingBuilding = !_isAddingBuilding;
      _isEditingBuilding = false;
      _isAddingRoom = false;
      _isAddingCR = false;
    });
  }

  void _toggleEditBuilding(Map<String, dynamic> info) {
    setState(() {
      _buildToEdit = info;
      _isEditingBuilding = !_isEditingBuilding;
      _isAddingBuilding = false;
      _isAddingRoom = false;
      _isAddingCR = false;
    });
  }

  void _toggleAddRoom() {
    setState(() {
      _isAddingRoom = !_isAddingRoom;
      _isAddingBuilding = false;
      _isEditingBuilding = false;
      _isAddingCR = false;
    });
  }

  void _toggleAddCR() {
    setState(() {
      _isAddingCR = !_isAddingCR;
      _isAddingBuilding = false;
      _isEditingBuilding = false;
      _isAddingRoom = false;
    });
  }

  Future<void> _addBuilding(Map<String, String> buildingData) async {
    try {
      await _buildingService.addBuilding(buildingData);
      _fetchBuildingInfo();
      setState(() {
        _isAddingBuilding = false;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> _editBuilding(Map<String, dynamic> buildingData) async {
    await _buildingService.editBuilding(buildingData);
    _fetchBuildingInfo();
    setState(() {
      _isEditingBuilding = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Building updated successfully!'),backgroundColor: Colors.green,),
    );
  }

  Future<void> _addRoom(Map<String, String> roomData) async {
    try {
      await _buildingService.addRoom(roomData);
      _fetchBuildingInfo();
      setState(() {
        _isAddingRoom = false;
      });
    } catch (e) {
      print(e);
    }
  }

   Future<void> _addCR(Map<String, String> crData) async {
    try {
      await _buildingService.addCR(crData);
      _fetchBuildingInfo();
      setState(() {
        _isAddingCR = false;
      });
    } catch (e) {
      print(e);
    }
  }


  void _showImageDialog(List<String> imageUrls, int initialIndex, String buildingName) {
    showDialog(
      context: context,
      builder: (context) {
        return ImageViewer(
          imageUrls: imageUrls,
          initialIndex: initialIndex,
          buildingName: buildingName, // Pass the building name
        );
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  TableRow _buildTableRow(Map<String, dynamic> building) {
    List<String> images = [];
    if (building['building_img1'] != null && building['building_img1'].isNotEmpty) images.add(building['building_img1']);
    if (building['building_img2'] != null && building['building_img2'].isNotEmpty) images.add(building['building_img2']);
    if (building['building_img3'] != null && building['building_img3'].isNotEmpty) images.add(building['building_img3']);

  DateFormat dateFormat = DateFormat('MM/dd/yy h:mm a');
  String formattedDate = '';
  if (building['updated_at'] != null) {
    DateTime dateTime = DateTime.parse(building['updated_at']);
    formattedDate = dateFormat.format(dateTime);
  } 
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Tooltip(
            message: 'Click to see the rooms.',
            child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => BuildingRoomsPage(
                    buildingId: building['id'],
                    buildingName: building['building_name'],
                  ),
                ),
              );
            },
            child: Text(
              building['building_name'],
              style: TextStyle(color: Colors.blue), // Text color
            ),
          ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(building['no_of_floors'].toString()),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(building['no_of_rooms'].toString()),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
           child: Tooltip(
            message: 'Click to view the full image.',
            child: images.isNotEmpty
            ? InkWell(
                onTap: () {
                  List<String> imageUrls = [];
                    if (building['building_img1'] != null && building['building_img1'].isNotEmpty) {
                      imageUrls.add(building['building_img1']);
                    }
                    if (building['building_img2'] != null && building['building_img2'].isNotEmpty) {
                      imageUrls.add(building['building_img2']);
                    }
                    if (building['building_img3'] != null && building['building_img3'].isNotEmpty) {
                      imageUrls.add(building['building_img3']);
                    }
                    if (imageUrls.isNotEmpty) {
                     _showImageDialog(imageUrls, 0, building['building_name']);
                    }
                },
                child: Image.network(
                  images[0],
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              )
            : Text('No Image'),
           ),
      ),
       Padding(
          padding: const EdgeInsets.all(8.0),
        child: Text(formattedDate), // Display formatted date
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: Icon(Icons.edit, color: Colors.blue),
            onPressed: () => _toggleEditBuilding(building),

          ),
        ),
      ],
    );
  }

 @override
Widget build(BuildContext context) {
  // Get screen width
  double screenWidth = MediaQuery.of(context).size.width;
  bool isSmallScreen = screenWidth < 600; // Define threshold for small screens

  return Scaffold(
    appBar: AppBar(
      title: Text('Building Info'),
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
    body: _isAddingRoom
        ? RoomAddForm(
            formKey: GlobalKey<FormState>(),
            onAddRoom: _addRoom,
            onCancel: _toggleAddRoom,
          )
        : _isAddingCR
            ? CRAddForm(
                formKey: GlobalKey<FormState>(),
                onAddCR: _addCR,
                onCancel: _toggleAddCR,
              )
            : _isEditingBuilding && _buildToEdit != null
                ? BuildingEditForm(
                    info: _buildToEdit!,
                    formKey: GlobalKey<FormState>(),
                    onEditBuilding: _editBuilding,
                    onCancel: () {
                      setState(() {
                        _isEditingBuilding = false;
                      });
                    },
                  )
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [],
                        ),
                      ),
                      Expanded(
                        child: FutureBuilder<List<Map<String, dynamic>>>(
                          future: _buildingInfoFuture,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Center(child: Text('Error: ${snapshot.error}'));
                            } else {
                              List<Map<String, dynamic>> data = snapshot.data ?? [];
                              bool hasData = data.isNotEmpty;

                              return SingleChildScrollView(
                                padding: const EdgeInsets.all(16.0),
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  children: [
                                    // Wrap the Table with SingleChildScrollView for horizontal scroll in mobile
                                    if (isSmallScreen)
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Table(
                                          border: TableBorder.all(
                                            color: const Color.fromARGB(255, 218, 218, 218),
                                          ),
                                          columnWidths: {
                                            0: IntrinsicColumnWidth(),
                                            1: IntrinsicColumnWidth(),
                                            2: IntrinsicColumnWidth(),
                                            3: IntrinsicColumnWidth(),
                                            4: IntrinsicColumnWidth(),
                                            5: IntrinsicColumnWidth(),
                                          },
                                          children: [
                                            TableRow(
                                              decoration: BoxDecoration(
                                                color: Colors.blueGrey.shade50,
                                              ),
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    'Building Name',
                                                    style: TextStyle(fontWeight: FontWeight.bold),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    'No. of Floors',
                                                    style: TextStyle(fontWeight: FontWeight.bold),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    'No. of Rooms',
                                                    style: TextStyle(fontWeight: FontWeight.bold),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    'Building Picture',
                                                    style: TextStyle(fontWeight: FontWeight.bold),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    'Last Updated',
                                                    style: TextStyle(fontWeight: FontWeight.bold),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    'Actions',
                                                    style: TextStyle(fontWeight: FontWeight.bold),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            // Add data rows only if available
                                            if (hasData) ...data.map(_buildTableRow).toList(),
                                          ],
                                        ),
                                      )
                                    else
                                      Table(
                                        border: TableBorder.all(
                                          color: const Color.fromARGB(255, 218, 218, 218),
                                        ),
                                        columnWidths: {
                                          0: FlexColumnWidth(1),
                                          1: FlexColumnWidth(1),
                                          2: FlexColumnWidth(1),
                                          3: FlexColumnWidth(1),
                                          4: FlexColumnWidth(1),
                                          5: FixedColumnWidth(100.0),
                                        },
                                        children: [
                                          TableRow(
                                            decoration: BoxDecoration(
                                              color: Colors.blueGrey.shade50,
                                            ),
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Building Name',
                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'No. of Floors',
                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'No. of Rooms',
                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Building Picture',
                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Last Updated',
                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Actions',
                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                          // Add data rows only if available
                                          if (hasData) ...data.map(_buildTableRow).toList(),
                                        ],
                                      ),
                                    if (!hasData)
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(32.0),
                                          child: Text(
                                            'No data available',
                                            style: TextStyle(fontSize: 16.0),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
  );
}

}


class ImageViewer extends StatefulWidget {
  final List<String> imageUrls;
  final int initialIndex;
  final String buildingName; 

  ImageViewer({required this.imageUrls, required this.initialIndex,required this.buildingName, });

  @override
  _ImageViewerState createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

   void _prevImage() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
    }
  }

  void _nextImage() {
    if (_currentIndex < widget.imageUrls.length - 1) {
      setState(() {
        _currentIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '${widget.buildingName} ',
            style: TextStyle(
              color: Colors.blue,
              // fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: 'Image',
            style: TextStyle(
              color: Colors.black,
              // fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
      content: Container(
        width: 300,
        height: 300,
        child: Column(
          children: [
            Expanded(
              child: Image.network(widget.imageUrls[_currentIndex]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: _currentIndex > 0 ? _prevImage : null, // Disable if on first image
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: _currentIndex < widget.imageUrls.length - 1 ? _nextImage : null, // Disable if on last image
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: Text('Close'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
