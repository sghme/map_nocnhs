import 'dart:convert';

import 'package:flutter/material.dart';

class InfoContainer extends StatefulWidget {
  final String? roomName;
  final String? teacherName;
  final String? buildingName;
  final String? landmarkName;
  final int? floorNo;
  final int? numberOfFloors;
  final int? numberOfRooms;
  final String? roombuildingName;
  final String? roomType;
  final String? curriculum;
  final String? roomNo;
  final String? yearLevel;

  final VoidCallback onClose;
  final String? buildingImage;
  final String? buildingImage2;
  final String? buildingImage3;
  final String? LandmarkImage;
  final String? LandmarkImage2;
  final String? LandmarkImage3;

  InfoContainer({
    this.roomName,
    this.teacherName,
    this.buildingName,
    this.floorNo,
    this.numberOfFloors,
    this.numberOfRooms,
    this.roombuildingName,
    this.roomType,
    this.curriculum,
    this.roomNo,
    this.yearLevel,
    this.landmarkName,
    required this.onClose,
    this.buildingImage,
    this.buildingImage2,
    this.buildingImage3,
    this.LandmarkImage,
    this.LandmarkImage2,
    this.LandmarkImage3,
  });

  @override
  _InfoContainerState createState() => _InfoContainerState();
}

class _InfoContainerState extends State<InfoContainer> {
  int _currentImageIndex = 0; // Track the current image index

  String _normalizeBase64(String base64String) {
    int paddingLength = base64String.length % 4;
    if (paddingLength > 0) {
      base64String += '=' * (4 - paddingLength);
    }
    return base64String;
  }

  bool _isBase64Image(String base64String) {
    return base64String.startsWith('data:image');
  }

  
Widget build(BuildContext context) {
  // Get screen width
  double screenWidth = MediaQuery.of(context).size.width;

  return SizedBox(
    child: Container(
      // Set padding for mobile screens to allow more space
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: 12.0), // 5% of screen width
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              // Add some padding to prevent overflow in small screens
              padding: EdgeInsets.only(bottom: 16.0), // Extra space at the bottom for scrolling
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: widget.onClose,
                    ),
                  ),

                  // Image Carousel with indicator
                  if (_hasAnyImage())
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Column(
                        children: [
                          _buildImageWidget(_getCurrentImage()),
                          SizedBox(height: 8.0),
                          _buildImageNavigationButtons(),
                          SizedBox(height: 8.0),
                          Text(
                            'Image ${_currentImageIndex + 1} of ${_totalImages()}',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                    ),

                  // Display building name or landmark name
                  if (widget.buildingName != null && widget.buildingName!.isNotEmpty) ...[
                    Text(
                      'Building Name:',
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black, decoration: TextDecoration.none),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      widget.buildingName ?? '',
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black, decoration: TextDecoration.none),
                    ),
                  ] else if (widget.landmarkName != null && widget.landmarkName!.isNotEmpty) ...[
                    Text(
                      'Facility Name:',
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black, decoration: TextDecoration.none),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      widget.landmarkName ?? '',
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,  color: Colors.black, decoration: TextDecoration.none,),
                    ),
                  ],

                  Divider(thickness: 1, color: Colors.grey[300]),
                  SizedBox(height: 12.0),

                  // Section for building details or room details
                  if (widget.landmarkName == null && widget.roomName == null) ...[
                    _buildDetailText('Number of Floors', widget.numberOfFloors?.toString()),
                    _buildDetailText('Number of Rooms', widget.numberOfRooms?.toString()),
                  ],

                  if (widget.roomName != null) ...[
                    _buildDetailText('Building Name', widget.roombuildingName),
                    _buildDetailText('Curriculum', widget.curriculum),
                    _buildDetailText('Room Name', widget.roomName),
                    _buildDetailText('Teacher Name', widget.teacherName),
                    _buildDetailText('Floor No', widget.floorNo?.toString()),
                    _buildDetailText('Room Type', widget.roomType),
                    _buildDetailText('Room No', widget.roomNo),
                    _buildDetailText('Year Level', widget.yearLevel),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}


  bool _hasAnyImage() {
    return _totalImages() > 0;
  }


  int _totalImages() {
    int count = 0;
    if (widget.LandmarkImage != null && widget.LandmarkImage!.isNotEmpty)
      count++;
    if (widget.LandmarkImage2 != null && widget.LandmarkImage2!.isNotEmpty)
      count++;
    if (widget.LandmarkImage3 != null && widget.LandmarkImage3!.isNotEmpty)
      count++;
    if (widget.buildingImage != null && widget.buildingImage!.isNotEmpty)
      count++;
    if (widget.buildingImage2 != null && widget.buildingImage2!.isNotEmpty)
      count++;
    if (widget.buildingImage3 != null && widget.buildingImage3!.isNotEmpty)
      count++;
    return count;
  }

  String _getCurrentImage() {
    List<String> images = [];
    if (widget.LandmarkImage != null && widget.LandmarkImage!.isNotEmpty) images.add(widget.LandmarkImage!);
    if (widget.LandmarkImage2 != null && widget.LandmarkImage2!.isNotEmpty) images.add(widget.LandmarkImage2!);
    if (widget.LandmarkImage3 != null && widget.LandmarkImage3!.isNotEmpty) images.add(widget.LandmarkImage3!);
    if (widget.buildingImage != null && widget.buildingImage!.isNotEmpty) images.add(widget.buildingImage!);
    if (widget.buildingImage2 != null && widget.buildingImage2!.isNotEmpty) images.add(widget.buildingImage2!);
    if (widget.buildingImage3 != null && widget.buildingImage3!.isNotEmpty) images.add(widget.buildingImage3!);
    return images.isNotEmpty ? images[_currentImageIndex] : '';
  }
  
  Widget _buildImageWidget(String image) {
  double screenWidth = MediaQuery.of(context).size.width;
  
  // Check if the screen width is mobile size (you can adjust the threshold as needed)
  bool isMobile = screenWidth < 600; // Consider mobile if width is less than 600px

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0), // Adjust padding for mobile
    child: isMobile
        ? GestureDetector(
            onTap: () => _showFullScreenImage(image), // Trigger the full-screen view
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double imageHeight = constraints.maxWidth > 600
                      ? 400.0
                      : MediaQuery.of(context).size.height * 0.3;

                  return _isBase64Image(image)
                      ? Image.memory(
                          base64Decode(_normalizeBase64(image.split(',').last)),
                          width: double.infinity,
                          height: imageHeight,
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          image,
                          width: double.infinity,
                          height: imageHeight,
                          fit: BoxFit.cover,
                        );
                },
              ),
            ),
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: LayoutBuilder(
              builder: (context, constraints) {
                double imageHeight = constraints.maxWidth > 600
                    ? 400.0
                    : MediaQuery.of(context).size.height * 0.3;

                return _isBase64Image(image)
                    ? Image.memory(
                        base64Decode(_normalizeBase64(image.split(',').last)),
                        width: double.infinity,
                        height: imageHeight,
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        image,
                        width: double.infinity,
                        height: imageHeight,
                        fit: BoxFit.cover,
                      );
              },
            ),
          ),
  );
}



void _showFullScreenImage(String image) {
  int currentImageIndex = _currentImageIndex;
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Container(
          width: MediaQuery.of(context).size.width * 0.9, // Larger width for mobile screens
          height: MediaQuery.of(context).size.height * 0.7, // Adjust height for full-screen view
          child: Column(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(), // Close the image on tap
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double imageHeight = constraints.maxHeight;
                        double imageWidth = constraints.maxWidth;

                        return _isBase64Image(image)
                            ? Image.memory(
                                base64Decode(_normalizeBase64(image.split(',').last)),
                                width: imageWidth,
                                height: imageHeight,
                                fit: BoxFit.contain, // Ensure the image is fully contained within the available space
                              )
                            : Image.network(
                                image,
                                width: imageWidth,
                                height: imageHeight,
                                fit: BoxFit.contain, // Ensure the image is fully contained within the available space
                              );
                      },
                    ),
                  ),
                ),
              ),
              // Row for arrow buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: currentImageIndex > 0
                        ? () {
                            setState(() {
                              _currentImageIndex--;
                              currentImageIndex = _currentImageIndex;
                            });
                            Navigator.of(context).pop(); // Close the dialog to refresh with the new image
                            _showFullScreenImage(_getCurrentImage()); // Show updated image
                          }
                        : null,
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward),
                    onPressed: currentImageIndex < _totalImages() - 1
                        ? () {
                            setState(() {
                              _currentImageIndex++;
                              currentImageIndex = _currentImageIndex;
                            });
                            Navigator.of(context).pop(); // Close the dialog to refresh with the new image
                            _showFullScreenImage(_getCurrentImage()); // Show updated image
                          }
                        : null,
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
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
        ],
      );
    },
  );
}




 Widget _buildImageNavigationButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: _currentImageIndex > 0
              ? () {
                  setState(() {
                    _currentImageIndex--;
                  });
                }
              : null, // Disable button if at the first image
        ),
        IconButton(
          icon: Icon(Icons.arrow_forward),
          onPressed: _currentImageIndex < _totalImages() - 1
              ? () {
                  setState(() {
                    _currentImageIndex++;
                  });
                }
              : null, // Disable button if at the last image
        ),
      ],
    );
  }


  // Helper function to create a text with consistent styling
  Widget _buildDetailText(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // Align both at the top
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$label: ',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(255, 0, 0, 0),
              decoration: TextDecoration.none,
            ),
          ),
          Flexible(
            child: Text(
              value ?? 'N/A',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                 color: const Color.fromARGB(255, 0, 0, 0),
                 decoration: TextDecoration.none,
              ),
              // maxLines: null, // Allow multi-line text
              // softWrap: true, // Enable wrapping
            ),
          ),
        ],
      ),
    );
  }
}
