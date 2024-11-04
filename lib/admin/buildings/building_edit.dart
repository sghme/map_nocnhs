import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:intl/intl.dart';
import 'dart:typed_data'; 
import 'service.dart';
import 'dart:io'; 

class BuildingEditForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Map<String, dynamic> info;
  final Future<void> Function(Map<String, String>) onEditBuilding;
  final VoidCallback onCancel;

  const BuildingEditForm({
    Key? key,
    required this.formKey,
    required this.info,
    required this.onEditBuilding,
    required this.onCancel,
  }) : super(key: key);

  @override
  _BuildingEditFormState createState() => _BuildingEditFormState();
}

class _BuildingEditFormState extends State<BuildingEditForm> {
  final BuildingService _buildingService = BuildingService();
  late TextEditingController buildingNameController ;
  File? _image1,_image2, _image3;
  Uint8List? _imageBytes, _imageBytes2, _imageBytes3;
  String? currentImageUrl, currentImageUrl2, currentImageUrl3;

  final String defaultImageUrl = Supabase.instance.client.storage
  .from('imagesnocnhs')
  .getPublicUrl('noimage.jpg');

  @override
  void initState() {
    super.initState();
    buildingNameController = TextEditingController(text: widget.info['building_name']);
    currentImageUrl = widget.info['building_img1'] ?? defaultImageUrl;
    currentImageUrl2 = widget.info['building_img2'] ?? defaultImageUrl;
    currentImageUrl3 = widget.info['building_img3'] ?? defaultImageUrl;
  }

  Future<void> _pickImage(int imageNumber) async {
    await _buildingService.pickImage(context, (image) {
      setState(() {
        if (imageNumber == 1) {
          if (image is File) {
            _image1 = image;
            _imageBytes = null;
          } else if (image is Uint8List) {
            _imageBytes = image;
            _image1 = null;
          }
        } else if (imageNumber == 2) {
          if (image is File) {
            _image2 = image;
            _imageBytes2 = null;
          } else if (image is Uint8List) {
            _imageBytes2 = image;
            _image2 = null;
          }
        } else if (imageNumber == 3) {
          if (image is File) {
            _image3 = image;
            _imageBytes3 = null;
          } else if (image is Uint8List) {
            _imageBytes3 = image;
            _image3 = null;
          }
        }
      });
    }, defaultImageUrl);
  }

  Future<String?> _uploadImages(File? imageFile, Uint8List? imageBytes) async {
    return await _buildingService.uploadImages(imageFile, imageBytes);
  }

  @override
 Widget build(BuildContext context) {
    final TextEditingController buildingNameController =
        TextEditingController(text: widget.info['building_name']);
    final TextEditingController floorNoController =
        TextEditingController(text: widget.info['no_of_floors'].toString());
    final TextEditingController roomNoController =
        TextEditingController(text: widget.info['no_of_rooms'].toString());

    return Scaffold(
      body: Center(
        child: Container(
          width: 400.0,
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Edit Building Info',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10), 
                Form(
                  key: widget.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildFormField(
                        'Building Name:',
                        buildingNameController,
                        (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a building name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      // _buildFormField(
                      //   'No. of Floors:',
                      //   floorNoController,
                      //   (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'Please enter number of floors';
                      //     }
                      //     return null;
                      //   },
                      // ),
                      Tooltip(
                      message: 'This field cannot be edited',
                      child: _buildFormField(
                        'No. of Floors:',
                        floorNoController,
                        (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter number of floors';
                          }
                          return null;
                        },
                        readOnly: true, // Set to true to make the field non-editable
                      ),
                    ),    
                      SizedBox(height: 10),
                      Tooltip(
                      message: 'This field cannot be edited',
                      child:
                      _buildFormField(
                        'No. of Rooms:',
                        roomNoController,
                        (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter number of rooms';
                          }
                          return null;
                        },
                      readOnly: true, // Set to true to make the field non-editable
                      ),
                    ), 
                     SizedBox(height: 20),
                      _buildImageUploadSection('Image 1:', _image1, _imageBytes, 1),
                      SizedBox(height: 20),
                      _buildImageUploadSection('Image 2:', _image2, _imageBytes2, 2),
                      SizedBox(height: 20),
                      _buildImageUploadSection('Image 3:', _image3, _imageBytes3, 3),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: ()  async {
                              if (widget.formKey.currentState!.validate()) {
                                widget.formKey.currentState!.save();
                                
                                String? imageUrl1 = await _uploadImages(_image1, _imageBytes);
                                String? imageUrl2 = await _uploadImages(_image2, _imageBytes2);
                                String? imageUrl3 = await _uploadImages(_image3, _imageBytes3);


                                DateFormat dateFormat = DateFormat('MM/dd/yy h:mm a');
                                String formattedDate = dateFormat.format(DateTime.now());

                                widget.onEditBuilding({
                                  'id': widget.info['id'].toString(),
                                  'building_name': buildingNameController.text,
                                  'no_of_floors': floorNoController.text,
                                  'no_of_rooms': roomNoController.text,
                                  'building_img1': imageUrl1 ?? currentImageUrl ?? defaultImageUrl,
                                  'building_img2': imageUrl2 ?? currentImageUrl2 ?? defaultImageUrl,
                                  'building_img3': imageUrl3 ?? currentImageUrl3 ?? defaultImageUrl,
                                  'updated_at': formattedDate,
                                });
                                widget.onCancel();
                              }
                            },
                            child: Text('Save'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                            ),
                          ),
                          SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: widget.onCancel,
                            child: Text('Cancel'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
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
        ),
      ),
    );
  }

  Widget _buildImageUploadSection(String label, File? imageFile, Uint8List? imageBytes, int imageNumber) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              width: 120.0,
              child: Text(
                label,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () => _pickImage(imageNumber),
                    child: Icon(Icons.add_a_photo),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: CircleBorder(),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Stack(
                      children: [
                        // Display the selected image if available
                        if (imageFile != null)
                          Image.file(
                            imageFile,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          )
                        else if (imageBytes != null)
                          Image.memory(
                            imageBytes,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          )
                        else if (imageNumber == 1 && currentImageUrl != null)
                          Image.network(
                            currentImageUrl!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          )
                        else if (imageNumber == 2 && currentImageUrl2 != null)
                          Image.network(
                            currentImageUrl2!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          )
                        else if (imageNumber == 3 && currentImageUrl3 != null)
                          Image.network(
                            currentImageUrl3!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          )
                          else if (currentImageUrl != null)
                          Image.network(
                            currentImageUrl!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          )
                        else
                          Image.network(
                            defaultImageUrl, // Use default image if nothing is selected
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),

                        // Close button to clear the image
                        Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(
                            icon: Icon(Icons.close, color: Colors.red),
                            onPressed: () {
                              setState(() {
                               if (imageNumber == 1) {
                                if (currentImageUrl != null && currentImageUrl != defaultImageUrl) {
                                    _buildingService.deleteImages(currentImageUrl!); // Call to delete the image
                                  }
                                  _image1 = null;
                                  _imageBytes = null;
                                  currentImageUrl = defaultImageUrl; 
                                } else if (imageNumber == 2) {
                                  if (currentImageUrl2 != null && currentImageUrl2 != defaultImageUrl) {
                                    _buildingService.deleteImages(currentImageUrl2!); // Call to delete the image
                                  }
                                  _image2 = null;
                                  _imageBytes2 = null;
                                  currentImageUrl2 = defaultImageUrl;
                                } else if (imageNumber == 3) {
                                  if (currentImageUrl3 != null && currentImageUrl3 != defaultImageUrl) {
                                    _buildingService.deleteImages(currentImageUrl3!); // Call to delete the image
                                  }
                                  _image3 = null;
                                  _imageBytes3 = null;
                                  currentImageUrl3 = defaultImageUrl;
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Text(
          '*Max: 500 KB',
          style: TextStyle(
            fontSize: 12.0,
            color: Colors.red[600],
          ),
        ),
      ],
    );
  }


  Widget _buildFormField(
    String label,
    TextEditingController controller,
    String? Function(String?)? validator,
    {
    bool readOnly = false,
  }
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 100.0,
          child: Text(
            label,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
            ),
            readOnly: readOnly,
            validator: validator,
          ),
        ),
      ],
    );
  }
}
