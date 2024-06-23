import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/data/repository/note_repository.dart';
import 'package:notes_app/models/note/note.dart';
import 'package:notes_app/utils/enum.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final NoteRepository _noteRepository;

  NoteBloc({required NoteRepository noteRepository})
      : _noteRepository = noteRepository,
        super(NoteInitial()) {
    on<GetNotes>(_onGetNotes);
    on<AddNote>(_onAddNote);
    on<EditNote>(_onEditNote);
    on<DeleteNote>(_onDeleteNote);
  }

  Future<void> _onGetNotes(GetNotes event, emit) async {
    emit(NoteLoading());
    try {
      final notes = await _noteRepository.getNotes();

      emit(NoteLoaded(notes, ActionType.fetch));
    } catch (e) {
      emit(NoteError(e.toString()));
    }
  }

  Future<void> _onAddNote(AddNote event, Emitter<NoteState> emit) async {
    try {
      await _noteRepository.addNote(event.note);
      final notes = await _noteRepository.getNotes();

      emit(NoteLoaded(notes, ActionType.add));
    } catch (e) {
      emit(NoteError(e.toString()));
    }
  }

  Future<void> _onEditNote(EditNote event, Emitter<NoteState> emit) async {
    try {
      await _noteRepository.editNote(
        event.idPreviousNote,
        event.newNote,
      );

      final notes = await _noteRepository.getNotes();

      emit(NoteLoaded(notes, ActionType.edit));
    } catch (e) {
      emit(NoteError(e.toString()));
    }
  }

  Future<void> _onDeleteNote(DeleteNote event, Emitter<NoteState> emit) async {
    try {
      await _noteRepository.deleteNote(event.id);
      final notes = await _noteRepository.getNotes();

      emit(NoteLoaded(notes, ActionType.delete));
    } catch (e) {
      emit(NoteError(e.toString()));
    }
  }
}
