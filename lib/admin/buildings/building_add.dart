
// class BuildingAddForm extends StatefulWidget {
//   final GlobalKey<FormState> formKey;
//   final void Function(Map<String, String>) onAddBuilding;
//   final VoidCallback onCancel;

//   const BuildingAddForm({
//     Key? key,
//     required this.formKey,
//     required this.onAddBuilding,
//     required this.onCancel,
//   }) : super(key: key);

//   @override
//   _BuildingAddFormState createState() => _BuildingAddFormState();
// }

//

//   Future<void> _uploadImages() async {
//     if (!kIsWeb) {
//       // Upload each image and get URLs
//       final fileNames = [
//         'building_img1/${DateTime.now().toString()}.png',
//         // 'building_img2/${DateTime.now().toString()}.png',
//       ];

//       final files = [_image1];
//       for (int i = 0; i < files.length; i++) {
//         if (files[i] != null) {
//           final response = await Supabase.instance.client.storage.from('imagesnocnhs').upload(fileNames[i], files[i]!);
//           if (response == null) {
//             if (i == 0) {
//               _imageUrl1 = Supabase.instance.client.storage.from('imagesnocnhs').getPublicUrl(fileNames[i]);
//             } 
//             // else if (i == 1) {
//             //   _imageUrl2 = Supabase.instance.client.storage.from('imagesnocnhs').getPublicUrl(fileNames[i]);
//             // }
//           } else {
//             print('Error uploading image: ${response}');
//           }
//         }
//       }
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
//                 'Add New Building Info',
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
//                     _buildFormField('Building Name:', (value) {
//                       _buildName = value;
//                     }, (value) {
//                       return value!.isEmpty ? 'Please enter a building name' : null;
//                     }),
//                     SizedBox(height: 10),
//                     _buildFormField('No. of Floors:', (value) {
//                       _floorNo = int.tryParse(value ?? '');
//                     }, (value) {
//                       return value!.isEmpty ? 'Please enter number of floors' : null;
//                     }),
//                     SizedBox(height: 10),
//                     _buildFormField('No. of Rooms:', (value) {
//                       _roomNo = int.tryParse(value ?? '');
//                     }, (value) {
//                       return value!.isEmpty ? 'Please enter number of rooms' : null;
//                     }),
//                     SizedBox(height: 20),
//                     _buildImageUploadSection('Image 1:', 1, _image1, _imageUrl1),
//                     // SizedBox(height: 20),
//                     // _buildImageUploadSection('Image 2:', 2, _image2, _imageUrl2),
//                     SizedBox(height: 20),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         ElevatedButton(
//                           onPressed: () async {
//                             if (widget.formKey.currentState!.validate()) {
//                               widget.formKey.currentState!.save();
//                               if (!kIsWeb) await _uploadImages();
//                               widget.onAddBuilding({
//                                 'building_name': _buildName!,
//                                 'no_of_floors': _floorNo.toString(),
//                                 'no_of_rooms': _roomNo.toString(),
//                                 'building_img1': _imageUrl1 ?? '',
//                                 // 'building_img2': _imageUrl2 ?? '',
//                               });
//                               widget.onCancel();
//                             }
//                           },
//                           child: Text('Add Building'),
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.blue,
//                             foregroundColor: Colors.white,
//                           ),
//                         ),
//                         SizedBox(width: 8),
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

//   Widget _buildImageUploadSection(String label, int imageNumber, File? imageFile, String? imageUrl) {
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
//         Expanded(
//           child: Row(
//             children: [
//               ElevatedButton(
//                 onPressed: () => _pickImage(imageNumber),
//                 child: Icon(Icons.add_a_photo),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue,
//                   foregroundColor: Colors.white,
//                   shape: CircleBorder(),
//                 ),
//               ),
//               SizedBox(width: 12),
//               if (kIsWeb) ...[
//                 if (imageUrl != null)
//                   Image.network(
//                     imageUrl,
//                     height: 100,
//                     width: 100,
//                     fit: BoxFit.cover,
//                   ),
//               ] else ...[
//                 if (imageFile != null)
//                   Image.file(
//                     imageFile,
//                     height: 100,
//                     width: 100,
//                     fit: BoxFit.cover,
//                   ),
//               ],
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildFormField(
//     String labelText,
//     void Function(String?)? onSaved,
//     String? Function(String?)? validator, {
//     bool obscureText = false,
//   }) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         SizedBox(
//           width: 100.0,
//           child: Text(
//             labelText,
//             style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
//           ),
//         ),
//         SizedBox(width: 12),
//         Expanded(
//           child: TextFormField(
//             decoration: InputDecoration(
//               border: OutlineInputBorder(),
//               contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
//             ),
//             obscureText: obscureText,
//             onSaved: onSaved,
//             validator: validator,
//           ),
//         ),
//       ],
//     );
//   }
// }
