import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'landmark_edit.dart';
import 'service.dart';

class Landmarks extends StatefulWidget {
  @override
  _LandmarksState createState() => _LandmarksState();
}

class _LandmarksState extends State<Landmarks> {
  final LandmarkService _landmarkService = LandmarkService();
  Future<List<dynamic>>? _landmarksFuture;
  TextEditingController _searchController = TextEditingController();
  bool _isEditingLandmark = false;
  bool _isAddingLandmark = false;
  Map<String, dynamic>? _landmarkToEdit;

  @override
  void initState() {
    super.initState();
    _fetchLandmarks();
    _searchController.addListener(_onSearchChanged);
  }

   void _fetchLandmarks([String searchQuery = '']) {
    setState(() {
      _landmarksFuture = _landmarkService.fetchLandmarks(searchQuery);
    });
  }

  void _onSearchChanged() {
    _fetchLandmarks(_searchController.text);
  }

  void _toggleAddLandmark() {
    setState(() {
      _isAddingLandmark = !_isAddingLandmark;
      _isEditingLandmark = false; // Ensure we're not in edit mode when adding a landmark
    });
  }

  void _toggleEditLandmark(Map<String, dynamic> landmark) {
    setState(() {
      _landmarkToEdit = landmark;
      _isEditingLandmark = !_isEditingLandmark;
      _isAddingLandmark = false; // Ensure we're not in add mode when editing a landmark
    });
  }

  Future<void> _addLandmark(Map<String, String> landmarkData) async {
    await _landmarkService.addLandmark(landmarkData);
    _fetchLandmarks();
    setState(() {
      _isAddingLandmark = false;
    });
  }

  Future<void> _editLandmark(Map<String, dynamic> landmarkData) async {
    await _landmarkService.editLandmark(landmarkData);
    _fetchLandmarks();
    setState(() {
      _isEditingLandmark = false;
    });
     ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Facility updated successfully!'), backgroundColor: Colors.green,),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _showImageDialog(List<String> imageUrls, int initialIndex, String landmarkName) {
    showDialog(
      context: context,
      builder: (context) {
        return ImageViewer(
           imageUrls: imageUrls,
          initialIndex: initialIndex,
          landmarkName: landmarkName, // Pass the landmark name
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Facilities'),
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
      body:
      //  _isAddingLandmark
      //     ? LandmarkAddForm(
      //         formKey: GlobalKey<FormState>(),
      //         onAddLandmark: _addLandmark,
      //         onCancel: _toggleAddLandmark,
      //       )
           _isEditingLandmark && _landmarkToEdit != null
              ? LandmarkEditForm(
                  formKey: GlobalKey<FormState>(),
                  info: _landmarkToEdit!,
                  onEditLandmark: _editLandmark,
                  onCancel: () {
                    setState(() {
                      _isEditingLandmark = false;
                    });
                  },
                )
              : _buildLandmarkTable(),
    );
  }

Widget _buildLandmarkTable() {
  return Column(
    children: [
       // Padding(
        //   padding: const EdgeInsets.all(16.0),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       ElevatedButton(
        //         onPressed: _toggleAddLandmark,
        //         child: Text('Add Landmark'),
        //       ),
        //     ],
        //   ),
        // ),
      Expanded(
        child: FutureBuilder<List<dynamic>>(
          future: _landmarksFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            // Always display the table with headers
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Table(
                    border: TableBorder.all(color: const Color.fromARGB(255, 218, 218, 218)),
                    columnWidths: const {
                      0: FlexColumnWidth(1),
                      1: FlexColumnWidth(1),
                      2: FlexColumnWidth(1),
                      3: FixedColumnWidth(100.0),
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
                              'Facility Name',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Facility Picture',
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
                    ],
                  ),
                  if (!snapshot.hasData || snapshot.data!.isEmpty)
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'No data available',
                        style: TextStyle(fontSize: 16.0 ),
                      ),
                    )
                  else
                    Table(
                      border: TableBorder.all(color: const Color.fromARGB(255, 218, 218, 218)),
                      columnWidths: const {
                        0: FlexColumnWidth(1),
                        1: FlexColumnWidth(1),
                        2: FlexColumnWidth(1),
                        3: FixedColumnWidth(100.0),
                      },
                      children: snapshot.data!.map((landmark) {
                        DateFormat dateFormat = DateFormat('MM/dd/yy h:mm a');
                        String formattedDate = landmark['updated_at'] != null
                            ? dateFormat.format(DateTime.parse(landmark['updated_at']))
                            : '';

                        return TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(landmark['landmark_name'] ?? 'Unknown'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Tooltip(
                                message: 'Click to view the full image.',
                                child: InkWell(
                                  onTap: () {
                                    List<String> imageUrls = [];
                                    if (landmark['landmark_img'] != null && landmark['landmark_img'].isNotEmpty) {
                                      imageUrls.add(landmark['landmark_img']);
                                    }
                                    if (landmark['landmark_img2'] != null && landmark['landmark_img2'].isNotEmpty) {
                                      imageUrls.add(landmark['landmark_img2']);
                                    }
                                    if (landmark['landmark_img3'] != null && landmark['landmark_img3'].isNotEmpty) {
                                      imageUrls.add(landmark['landmark_img3']);
                                    }
                                    if (imageUrls.isNotEmpty) {
                                      _showImageDialog(imageUrls, 0, landmark['landmark_name']);
                                    }
                                  },
                                  child: Image.network(
                                    landmark['landmark_img'] ?? '',
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.asset(
                                        'assets/images/noimage.jpg',
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(formattedDate),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                icon: Icon(Icons.edit, color: Colors.blue),
                                onPressed: () => _toggleEditLandmark(landmark),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    ],
  );
}
}

class ImageViewer extends StatefulWidget {
  final List<String> imageUrls;
  final int initialIndex;
  final String landmarkName;

  ImageViewer({required this.imageUrls, required this.initialIndex, required this.landmarkName});

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
              text: '${widget.landmarkName} ',
              style: TextStyle(color: Colors.blue),
            ),
            TextSpan(
              text: 'Image',
              style: TextStyle(color: Colors.black),
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