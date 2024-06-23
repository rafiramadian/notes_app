import 'package:notes_app/data/services/dio_service.dart';
import 'package:notes_app/models/note/note.dart';

class NoteRepository {
  final DioService _dioService;
  NoteRepository({required DioService dioService}) : _dioService = dioService;

  Future<List<Note>> getNotes() async {
    try {
      final result = await _dioService.get('/notes');

      return (result as List<dynamic>)
          .map((json) => Note.fromJson(json))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addNote(Note note) async {
    try {
      await _dioService.post('/notes', note.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> editNote(String id, Note newNote) async {
    try {
      await _dioService.put('/notes/$id', newNote.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteNote(String id) async {
    try {
      await _dioService.delete('/notes/$id');
    } catch (e) {
      rethrow;
    }
  }
}
