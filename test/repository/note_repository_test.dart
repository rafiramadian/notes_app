import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:notes_app/data/models/note/note.dart';
import 'package:notes_app/data/repository/note_repository.dart';

import '../mocks/mocks.mocks.dart';

void main() {
  late NoteRepository noteRepository;
  late MockDioService mockDioService;

  setUp(() {
    mockDioService = MockDioService();
    noteRepository = NoteRepository(dioService: mockDioService);
  });

  group('NoteRepository', () {
    final note1 = Note(id: '1', title: 'Note 1', description: 'Content 1');
    final note2 = Note(id: '2', title: 'Note 2', description: 'Content 2');
    final notesJson = [
      {'id': '1', 'title': 'Note 1', 'description': 'Content 1'},
      {'id': '2', 'title': 'Note 2', 'description': 'Content 2'},
    ];
    final notes = [note1, note2];

    test('getNotes returns list of notes if the request is successful',
        () async {
      when(mockDioService.get('/notes')).thenAnswer((_) async => notesJson);

      final result = await noteRepository.getNotes();

      expect(result, equals(notes));
      verify(mockDioService.get('/notes')).called(1);
    });

    test('getNotes throws an exception if the request fails', () async {
      when(mockDioService.get('/notes'))
          .thenThrow(Exception('Failed to fetch notes'));

      expect(() => noteRepository.getNotes(), throwsException);
    });

    test('addNote makes a post request with the correct data', () async {
      when(mockDioService.post('/notes', note1.toJson()))
          .thenAnswer((_) async => {});

      await noteRepository.addNote(note1);

      verify(mockDioService.post('/notes', note1.toJson())).called(1);
    });

    test('addNote throws an exception if the request fails', () async {
      when(mockDioService.post('/notes', note1.toJson()))
          .thenThrow(Exception('Failed to add note'));

      expect(() => noteRepository.addNote(note1), throwsException);
    });

    test('editNote makes a put request with the correct data', () async {
      when(mockDioService.put('/notes/1', note2.toJson()))
          .thenAnswer((_) async => {});

      await noteRepository.editNote('1', note2);

      verify(mockDioService.put('/notes/1', note2.toJson())).called(1);
    });

    test('editNote throws an exception if the request fails', () async {
      when(mockDioService.put('/notes/1', note2.toJson()))
          .thenThrow(Exception('Failed to edit note'));

      expect(() => noteRepository.editNote('1', note2), throwsException);
    });

    test('deleteNote makes a delete request with the correct id', () async {
      when(mockDioService.delete('/notes/1')).thenAnswer((_) async => {});

      await noteRepository.deleteNote('1');

      verify(mockDioService.delete('/notes/1')).called(1);
    });

    test('deleteNote throws an exception if the request fails', () async {
      when(mockDioService.delete('/notes/1'))
          .thenThrow(Exception('Failed to delete note'));

      expect(() => noteRepository.deleteNote('1'), throwsException);
    });
  });
}
