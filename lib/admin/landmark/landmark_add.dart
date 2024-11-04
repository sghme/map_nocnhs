

// class LandmarkAddForm extends StatefulWidget {
//   final GlobalKey<FormState> formKey;
//   final void Function(Map<String, String>) onAddLandmark;
//   final VoidCallback onCancel;

//   const LandmarkAddForm({
//     Key? key,
//     required this.formKey,
//     required this.onAddLandmark,
//     required this.onCancel,
//   }) : super(key: key);

//   @override
//   _LandmarkAddFormState createState() => _LandmarkAddFormState();
// }

// class _LandmarkAddFormState extends State<LandmarkAddForm> {
//   final ImagePicker _picker = ImagePicker();
//   File? _image2; // For mobile image
//   Uint8List? _imageBytes; // For web image bytes

//   String? _landmarkName;

//   Future<void> _pickImage() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       if (kIsWeb) {
//         // Web-specific handling
//         final bytes = await pickedFile.readAsBytes();
//         setState(() {
//           _imageBytes = bytes;
//         });
//       } else {
//         // Mobile-specific handling
//         setState(() {
//           _image2 = File(pickedFile.path);
//         });
//       }
//     }
//   }

//   Future<String?> _uploadImage() async {
//     try {
//       final fileName = 'landmark_img/${DateTime.now().millisecondsSinceEpoch}.jpg';

//       if (kIsWeb && _imageBytes != null) {
//         // Uploading for web using Uint8List
//         await Supabase.instance.client.storage
//             .from('imagesnocnhs')
//             .uploadBinary(fileName, _imageBytes!);
//       } else if (_image2 != null) {
//         // Uploading for mobile using File
//         await Supabase.instance.client.storage
//             .from('imagesnocnhs')
//             .upload(fileName, _image2!);
//       }

//       // Generate the public URL for the uploaded image
//       final String imageUrl = Supabase.instance.client.storage
//           .from('imagesnocnhs')
//           .getPublicUrl(fileName);

//       return imageUrl;
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to upload image: $e')),
//       );
//       return null;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         width: 400.0,
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Text(
//                 'Add New Landmark',
//                 style: TextStyle(
//                   fontSize: 24.0,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black87,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: 10),
//               Form(
//                 key: widget.formKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     _buildFormField('Landmark Name:', (value) {
//                       _landmarkName = value;
//                     }, (value) {
//                       return value!.isEmpty ? 'Please enter a landmark name' : null;
//                     }),
//                     SizedBox(height: 20),
//                     _buildImageUploadSection('Landmark Image:'),
//                     SizedBox(height: 20),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         ElevatedButton(
//                           onPressed: () async {
//                             if (widget.formKey.currentState!.validate()) {
//                               widget.formKey.currentState!.save();
//                               final imageUrl = await _uploadImage();
//                               widget.onAddLandmark({
//                                 'landmark_name': _landmarkName!,
//                                 'landmark_img': imageUrl ?? '',
//                               });
//                               widget.onCancel();
//                             }
//                           },
//                           child: Text('Add'),
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.green,
//                             foregroundColor: Colors.white,
//                           ),
//                         ),
//                         SizedBox(width: 10),
//                         ElevatedButton(
//                           onPressed: widget.onCancel,
//                           child: Text('Cancel'),
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.red,
//                             foregroundColor: Colors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildImageUploadSection(String label) {
//     return Row(
//       children: [
//         SizedBox(
//           width: 120.0,
//           child: Text(
//             label,
//             style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
//           ),
//         ),
//         SizedBox(width: 12),
//         ElevatedButton(
//           onPressed: _pickImage,
//           child: Icon(Icons.add_a_photo),
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.blue,
//             foregroundColor: Colors.white,
//             shape: CircleBorder(),
//           ),
//         ),
//         SizedBox(width: 12),
//         if (kIsWeb && _imageBytes != null) ...[
//           Image.memory(
//             _imageBytes!,
//             height: 100,
//             width: 100,
//             fit: BoxFit.cover,
//           ),
//         ] else if (_image2 != null) ...[
//           Image.file(
//             _image2!,
//             height: 100,
//             width: 100,
//             fit: BoxFit.cover,
//           ),
//         ],
//       ],
//     );
//   }

//   Widget _buildFormField(
//     String labelText,
//     void Function(String?)? onSaved,
//     String? Function(String?)? validator, {
//     bool obscureText = false,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0),
//       child: TextFormField(
//         decoration: InputDecoration(
//           labelText: labelText,
//           border: OutlineInputBorder(),
//         ),
//         onSaved: onSaved,
//         validator: validator,
//       ),
//     );
//   }
// }
