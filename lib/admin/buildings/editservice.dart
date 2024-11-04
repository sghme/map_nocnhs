// service.dart
import 'package:supabase_flutter/supabase_flutter.dart';

class BuildingService {
  final SupabaseClient client;

  BuildingService(this.client);

  Future<List<Map<String, dynamic>>> fetchPrograms() async {
    final programsResponse = await client.from('programs').select();
    return (programsResponse as List)
        .map((item) => {'id': item['id'], 'name': item['program']})
        .toList();
  }

  Future<int?> fetchRoomProgram(int roomId) async {
    final response = await client
        .from('rooms')
        .select('program_id')
        .eq('id', roomId)
        .single();

    return response != null ? response['program_id'] as int? : null;
  }

  Future<int?> fetchRoomTypeId(int roomId) async {
    final response = await client
        .from('rooms')
        .select('roomtype_id')
        .eq('id', roomId)
        .single();

    return response != null ? response['roomtype_id'] as int? : null;
  }

  Future<List<Map<String, dynamic>>> fetchRoomTypes() async {
    final roomtypesResponse = await client.from('roomtypes').select();
    return (roomtypesResponse as List)
        .map((item) => {'id': item['id'], 'name': item['roomtype']})
        .toList();
  }

  Future<List<Map<String, dynamic>>> fetchTeachersData() async {
    final teachersResponse = await client.from('teacherlist').select();
    return (teachersResponse as List)
        .map((item) => {'id': item['id'], 'name': item['teachers']})
        .toList();
  }

  Future<List<int>> fetchRoomTeachers(int roomId) async {
    final response = await client
        .from('room_teacher')
        .select('teacher_id')
        .eq('room_id', roomId);

    return (response as List)
        .map<int>((item) => item['teacher_id'] as int)
        .toList();
  }

  Future<void> updateRoomTeachers(int roomId, List<int> selectedTeachers) async {
    await client.from('room_teacher').delete().eq('room_id', roomId);
    for (var teacherId in selectedTeachers) {
      await client.from('room_teacher').insert({
        'room_id': roomId,
        'teacher_id': teacherId,
      });
    }
  }

  Future<void> updateRoom(int roomId, Map<String, dynamic> updatedRoom) async {
    await client.from('rooms').update(updatedRoom).eq('id', roomId);
  }
}
