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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
       
        child: Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
      //  borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
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
              // controller: scrollController,
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
                                     // Image Carousel with navigation buttons
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


                  // Section for displaying names
                  // Section for displaying names
                  if (widget.buildingName != null &&
                      widget.buildingName!.isNotEmpty) ...[
                    Text(
                      'Building Name:',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black, decoration: TextDecoration.none,),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      widget.buildingName ?? '',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 0, 0, 0), decoration: TextDecoration.none,),
                    ),
                  ] else if (widget.landmarkName != null &&
                      widget.landmarkName!.isNotEmpty) ...[
                    Text(
                      'Facility Name:',
                      // 'Landmark Name:',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.grey[300], decoration: TextDecoration.none,),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      //  widget.buildingName ?? '',
                      widget.landmarkName ?? '',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 0, 0, 0), decoration: TextDecoration.none,),
                    ),
                  ],

                  Divider(thickness: 1, color: Colors.grey[300]),
                  SizedBox(height: 12.0),

                  // Section for displaying building details
                  if (widget.landmarkName == null &&
                      widget.roomName == null) ...[
                    _buildDetailText(
                        'Number of Floors', widget.numberOfFloors?.toString()),
                    _buildDetailText(
                        'Number of Rooms', widget.numberOfRooms?.toString()),
                  ],

                  // Section for displaying room details
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
    ));
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
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 100.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: _isBase64Image(image)
          ? Image.memory(
              base64Decode(_normalizeBase64(image.split(',').last)),
              width: 450, // Set fixed width for the image
              height: 550, // Set fixed height for the image
              fit: BoxFit.cover,
            )
          : Image.network(
              image,
              width: 450, // Set fixed width for the image
              height: 550, 
              fit: BoxFit.cover,
            ),
    ),
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
