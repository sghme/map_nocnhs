import 'package:supabase_flutter/supabase_flutter.dart';

class UserService {
  Future<List<dynamic>> fetchUsers([String searchQuery = '']) {
    return Supabase.instance.client
        .from('user')
        .select()
        .ilike('name', '%$searchQuery%') // Filter by search query
        .order('name', ascending: true);
  }

  Future<void> addUser(Map<String, String> userData) async {
    final response = await Supabase.instance.client.from('user').insert({
      'role': userData['role'],
      'name': userData['name'],
      'username': userData['username'],
      'email': userData['email'],
    });

    if (response.error != null) {
      print('Error adding user: ${response.error?.message}');
    }
  }

  Future<void> editUser(Map<String, dynamic> userData) async {
    final response = await Supabase.instance.client
        .from('user')
        .update(userData)
        .eq('id', userData['id']);

    if (response.error != null) {
      print('Error editing user: ${response.error?.message}');
    }
  }
}
