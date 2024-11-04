// service.dart
import 'package:supabase_flutter/supabase_flutter.dart';

class DataService {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<List<dynamic>> fetchRoomTypes() async {
    final response = await supabase.from('roomtypes').select();
    return response;
  }

  Future<List<dynamic>> fetchPrograms() async {
    final response = await supabase.from('programs').select();
    return response;
  }

  Future<List<dynamic>> fetchTeachers() async {
    final response = await supabase.from('teacherlist').select();
    return response;
  }

  //program add
   Future<void> addProgram(String? programName, String? curriculumName) async {
    await supabase.from('programs').insert({
      'program': programName,
      'curriculum': curriculumName,
    });
  }
  //program edit
  Future<void> editProgram(int programId, String? updatedProgramName, String? updatedCurriculum) async {
    await supabase.from('programs').update({
      'program': updatedProgramName,
      'curriculum': updatedCurriculum 
      })
      .eq('id', programId);
  }
  //roomtype add
  Future<void> addRoomType(String? roomTypeName) async {
    await supabase.from('roomtypes').insert({
      'roomtype': roomTypeName,
    });
  }
  //roomtype edit
  Future<void> editRoomType(int roomTypeId, String? updatedRoomTypeName) async {
    await supabase.from('roomtypes')
      .update({'roomtype': updatedRoomTypeName})
      .eq('id', roomTypeId);
  }

  //teacher add
  Future<void> addTeacher(String? teacherName) async {
    await supabase.from('teacherlist').insert({
      'teachers': teacherName,
    });
  }
  //teacher edit
  Future<void> editTeacher(int teacherId, String? updatedTeacherName) async {
    await supabase.from('teacherlist')
      .update({'teachers': updatedTeacherName})
      .eq('id', teacherId);
  }

  Future<void> deleteTeacher(int teacherId) async {
  await supabase.from('teacherlist').delete().eq('id', teacherId);
}

 Future<void> deleteRoomType(int roomTypeId) async {
    await supabase.from('roomtypes').delete().eq('id', roomTypeId);
  }

  Future<void> deleteProgram(int programId) async {
    await supabase.from('programs').delete().eq('id', programId);
  }


}
