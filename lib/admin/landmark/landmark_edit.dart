import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:typed_data';
import 'service.dart';
import 'dart:io'; 

class LandmarkEditForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Map<String, dynamic> info;
  final Future<void> Function(Map<String, String>) onEditLandmark;
  final VoidCallback onCancel;

  const LandmarkEditForm({
    Key? key,
    required this.formKey,
    required this.info,
    required this.onEditLandmark,
    required this.onCancel,
  }) : super(key: key);

  @override
  _LandmarkEditFormState createState() => _LandmarkEditFormState();
}

class _LandmarkEditFormState extends State<LandmarkEditForm> {
  final LandmarkService _landmarkService = LandmarkService();
  late TextEditingController landmarkNameController;
  String? currentImageUrl, currentImageUrl2, currentImageUrl3;
  Uint8List? _imageBytes, _imageBytes2, _imageBytes3;
  File? _image2, _image3, _image4;
  
  final String defaultImageUrl = Supabase.instance.client.storage
  .from('imagesnocnhs').getPublicUrl('noimage.jpg');

  @override
  void initState() {
    super.initState();
    landmarkNameController = TextEditingController(text: widget.info['landmark_name']);
    currentImageUrl = widget.info['landmark_img'] ?? defaultImageUrl;
    currentImageUrl2 = widget.info['landmark_img2'] ?? defaultImageUrl;
    currentImageUrl3 = widget.info['landmark_img3'] ?? defaultImageUrl;
  }

  @override
  void dispose() {
    landmarkNameController.dispose();
    super.dispose();
  }

  Future<void> _pickImage(int imageNumber) async {
    await _landmarkService.pickImage(context, (image) {
      setState(() {
        if (imageNumber == 1) {
          if (image is File) {
            _image2 = image;
            _imageBytes = null;
          } else if (image is Uint8List) {
            _imageBytes = image;
            _image2 = null;
          }
        } else if (imageNumber == 2) {
          if (image is File) {
            _image3 = image;
            _imageBytes2 = null;
          } else if (image is Uint8List) {
            _imageBytes2 = image;
            _image3 = null;
          }
        } else if (imageNumber == 3) {
          if (image is File) {
            _image4 = image;
            _imageBytes3 = null;
          } else if (image is Uint8List) {
            _imageBytes3 = image;
            _image4 = null;
          }
        }
      });
    }, defaultImageUrl);
  }
  

  Future<String?> _uploadImage(File? imageFile, Uint8List? imageBytes) async {
    return await _landmarkService.uploadImage(imageFile, imageBytes);
  }
  
  @override
  Widget build(BuildContext context) {
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
                  'Edit Facility Info',
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
                        'Facility Name:',
                        landmarkNameController,
                        (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a facility name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      _buildImageUploadSection('Image 1:', _image2, _imageBytes, 1),
                      SizedBox(height: 20),
                      _buildImageUploadSection('Image 2:', _image3, _imageBytes2, 2),
                      SizedBox(height: 20),
                      _buildImageUploadSection('Image 3:', _image4, _imageBytes3, 3),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              if (widget.formKey.currentState!.validate()) {
                                widget.formKey.currentState!.save();

                                // Upload the image if a new one is picked
                                String? imageUrl1 = await _uploadImage(_image2, _imageBytes);
                                String? imageUrl2 = await _uploadImage(_image3, _imageBytes2);
                                String? imageUrl3 = await _uploadImage(_image4, _imageBytes3);


                                DateFormat dateFormat = DateFormat('MM/dd/yy h:mm a');
                                String formattedDate = dateFormat.format(DateTime.now());

                                widget.onEditLandmark({
                                  'id': widget.info['id'].toString(),
                                  'landmark_name': landmarkNameController.text,
                                  'landmark_img': imageUrl1 ?? currentImageUrl ?? defaultImageUrl,
                                  'landmark_img2': imageUrl2 ?? currentImageUrl2 ?? defaultImageUrl,
                                  'landmark_img3': imageUrl3 ?? currentImageUrl3 ?? defaultImageUrl,
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
                                  // Check if the current image exists before deletion
                                  if (currentImageUrl != null && currentImageUrl != defaultImageUrl) {
                                    _landmarkService.deleteImage(currentImageUrl!); // Call to delete the image
                                  }
                                  _image2 = null;
                                  _imageBytes = null;
                                  currentImageUrl = defaultImageUrl;
                                } else if (imageNumber == 2) {
                                  if (currentImageUrl2 != null && currentImageUrl2 != defaultImageUrl) {
                                    _landmarkService.deleteImage(currentImageUrl2!); // Call to delete the image
                                  }
                                  _image3 = null;
                                  _imageBytes2 = null;
                                  currentImageUrl2 = defaultImageUrl;
                                } else if (imageNumber == 3) {
                                  if (currentImageUrl3 != null && currentImageUrl3 != defaultImageUrl) {
                                    _landmarkService.deleteImage(currentImageUrl3!); // Call to delete the image
                                  }
                                  _image4 = null;
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
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 120.0,
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
            validator: validator,
          ),
        ),
      ],
    );
  }

}
