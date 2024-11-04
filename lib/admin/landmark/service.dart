import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'dart:io';


class LandmarkService {
  final SupabaseClient _supabaseClient = Supabase.instance.client;
  final ImagePicker _picker = ImagePicker();

  //queries for landmarks.dart
  Future<List<dynamic>> fetchLandmarks(String searchQuery) async {
    return await _supabaseClient
    .from('landmarks')
    .select()
    .ilike('landmark_name', '%$searchQuery%')
    .order('landmark_name', ascending: true);
  }

  Future<void> addLandmark(Map<String, String> landmarkData) async {
    await _supabaseClient.from('landmarks').insert({
      'landmark_name': landmarkData['landmark_name'],
      'landmark_img': landmarkData['landmark_img'],
      'created_at': DateTime.now().toIso8601String(),
    });
  }

  Future<void> editLandmark(Map<String, dynamic> landmarkData) async {
    await _supabaseClient
        .from('landmarks')
        .update({
          'landmark_name': landmarkData['landmark_name'],
          'landmark_img': landmarkData['landmark_img'],
          'landmark_img2': landmarkData['landmark_img2'],
          'landmark_img3': landmarkData['landmark_img3'],
          'updated_at': DateTime.now().toIso8601String(),
        })
        .eq('id', landmarkData['id']);
  }

  //queries for landmark_edit.dart
  Future<void> pickImage(BuildContext context, Function(dynamic) callback, String defaultImageUrl) async {
    if (kIsWeb) {
      // Web-specific code for file upload
      final result = await FilePicker.platform.pickFiles(type: FileType.image);
      if (result != null) {
        final bytes = result.files.single.bytes;
        callback(bytes);
      } else {
        callback(null);
      }
    } else {
      // Mobile and desktop-specific code for image picking
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        callback(File(pickedFile.path));
      } else {
        callback(null);
      }
    }
  }


  Future<String?> uploadImage(File? imageFile, Uint8List? imageBytes) async {
    if (imageFile != null || imageBytes != null) {
    try {
      final fileName = 'landmark_img/${DateTime.now().millisecondsSinceEpoch}.jpg';

      if (kIsWeb && imageBytes != null) {
        // Uploading for web using Uint8List
        await _supabaseClient.storage.from('imagesnocnhs').uploadBinary(fileName, imageBytes);
      } else if (imageFile != null) {
        // Uploading for mobile using File
        await _supabaseClient.storage.from('imagesnocnhs').upload(fileName, imageFile);
      }
      // Generate and return the public URL for the uploaded image
      final String imageUrl = _supabaseClient.storage.from('imagesnocnhs').getPublicUrl(fileName);
      return imageUrl;
    } catch (e) {
      return null;
    }
  }
  }

  Future<void> deleteImage(String imageUrl) async {
  try {
    // Extract the correct path, ensuring it includes 'landmark_img/'
    final String path = imageUrl.split('imagesnocnhs/').last; 
    await _supabaseClient.storage.from('imagesnocnhs').remove([path]);
    print('Image deleted: $path');
  } catch (e) {
    print('Error deleting image: $e');
  }
}


}
