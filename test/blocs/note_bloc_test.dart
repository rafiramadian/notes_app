import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:notes_app/blocs/note/note_bloc.dart';
import 'package:notes_app/data/models/note/note.dart';
import 'package:notes_app/utils/enum.dart';

import '../mocks/mocks.mocks.dart';

// class MockNoteRepository extends Mock implements NoteRepository {}

void main() {
  late NoteBloc noteBloc;
  late MockNoteRepository mockNoteRepository;

  setUp(() {
    mockNoteRepository = MockNoteRepository();
    noteBloc = NoteBloc(noteRepository: mockNoteRepository);
  });

  group('NoteBloc', () {
    final List<Note> mockNotes = [
      Note(
        id: '1',
        title: 'Test Note 1',
        description: 'Content of Test Note 1',
      ),
      Note(
        id: '2',
        title: 'Test Note 2',
        description: 'Content of Test Note 2',
      ),
    ];

    blocTest<NoteBloc, NoteState>(
      'emits [NoteLoading, NoteLoaded] when GetNotes is added',
      build: () {
        when(mockNoteRepository.getNotes()).thenAnswer((_) async => mockNotes);
        return noteBloc;
      },
      act: (bloc) => bloc.add(GetNotes()),
      expect: () => [
        NoteLoading(),
        NoteLoaded(mockNotes, ActionType.fetch),
      ],
    );

    blocTest<NoteBloc, NoteState>(
      'emits [NoteLoaded] when AddNote is added',
      build: () {
        when(mockNoteRepository.addNote(any))
            .thenAnswer((_) async => Future.value());
        when(mockNoteRepository.getNotes()).thenAnswer((_) async => mockNotes);
        return noteBloc;
      },
      act: (bloc) => bloc.add(AddNote(
        Note(
          id: '3',
          title: 'Test Note 3',
          description: 'Content of Test Note 3',
        ),
      )),
      expect: () => [
        NoteLoaded(mockNotes, ActionType.add),
      ],
    );

    blocTest<NoteBloc, NoteState>(
      'emits [NoteLoaded] when EditNote is added',
      build: () {
        when(mockNoteRepository.editNote(
          any,
          any,
        )).thenAnswer((_) async => Future.value());
        when(mockNoteRepository.getNotes()).thenAnswer((_) async => mockNotes);
        return noteBloc;
      },
      act: (bloc) => bloc.add(EditNote(
        '1',
        Note(
          id: '1',
          title: 'Updated Note',
          description: 'Updated Content',
        ),
      )),
      expect: () => [
        NoteLoaded(mockNotes, ActionType.edit),
      ],
    );

    blocTest<NoteBloc, NoteState>(
      'emits [NoteLoaded] when DeleteNote is added',
      build: () {
        when(mockNoteRepository.deleteNote(
          any,
        )).thenAnswer((_) async => Future.value());
        when(mockNoteRepository.getNotes()).thenAnswer((_) async => mockNotes);
        return noteBloc;
      },
      act: (bloc) => bloc.add(const DeleteNote(
        '1',
      )),
      expect: () => [
        NoteLoaded(mockNotes, ActionType.delete),
      ],
    );

    blocTest<NoteBloc, NoteState>(
      'emits [NoteError] when GetNotes fails',
      build: () {
        when(mockNoteRepository.getNotes())
            .thenThrow(Exception('Failed to fetch notes'));
        return noteBloc;
      },
      act: (bloc) => bloc.add(GetNotes()),
      expect: () => [
        NoteLoading(),
        const NoteError('Exception: Failed to fetch notes'),
      ],
    );

    // Negative case for GetNotes
    blocTest<NoteBloc, NoteState>(
      'emits [NoteLoading, NoteError] when GetNotes fails',
      build: () {
        when(mockNoteRepository.getNotes())
            .thenThrow(Exception('Failed to fetch notes'));
        return noteBloc;
      },
      act: (bloc) => bloc.add(GetNotes()),
      expect: () => [
        NoteLoading(),
        const NoteError('Exception: Failed to fetch notes'),
      ],
    );

    // Negative case for AddNote
    blocTest<NoteBloc, NoteState>(
      'emits [NoteError] when AddNote fails',
      build: () {
        when(mockNoteRepository.addNote(any))
            .thenThrow(Exception('Failed to add note'));
        when(mockNoteRepository.getNotes()).thenAnswer((_) async => mockNotes);
        return noteBloc;
      },
      act: (bloc) => bloc.add(AddNote(
        Note(
          id: '3',
          title: 'Test Note 3',
          description: 'Content of Test Note 3',
        ),
      )),
      expect: () => [
        const NoteError('Exception: Failed to add note'),
      ],
    );

    // Negative case for EditNote
    blocTest<NoteBloc, NoteState>(
      'emits [NoteError] when EditNote fails',
      build: () {
        when(mockNoteRepository.editNote(any, any))
            .thenThrow(Exception('Failed to edit note'));
        when(mockNoteRepository.getNotes()).thenAnswer((_) async => mockNotes);
        return noteBloc;
      },
      act: (bloc) => bloc.add(EditNote(
        '1',
        Note(
          id: '1',
          title: 'Updated Note',
          description: 'Updated Content',
        ),
      )),
      expect: () => [
        const NoteError('Exception: Failed to edit note'),
      ],
    );

    // Negative case for DeleteNote
    blocTest<NoteBloc, NoteState>(
      'emits [NoteError] when DeleteNote fails',
      build: () {
        when(mockNoteRepository.deleteNote(any))
            .thenThrow(Exception('Failed to delete note'));
        when(mockNoteRepository.getNotes()).thenAnswer((_) async => mockNotes);
        return noteBloc;
      },
      act: (bloc) => bloc.add(const DeleteNote(
        '1',
      )),
      expect: () => [
        const NoteError('Exception: Failed to delete note'),
      ],
    );
  });
}
