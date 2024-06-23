import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/data/repository/favorite_note_repository.dart';
import 'package:notes_app/models/favorite_note/favorite_note.dart';

part 'favorite_note_event.dart';
part 'favorite_note_state.dart';

class FavoriteNoteBloc extends Bloc<FavoriteNoteEvent, FavoriteNoteState> {
  final FavoriteNoteRepository _favoriteNoteRepository;
  FavoriteNoteBloc({required FavoriteNoteRepository favoriteNoteRepository})
      : _favoriteNoteRepository = favoriteNoteRepository,
        super(FavoriteNoteInitial()) {
    on<GetFavoriteNotes>(_onGetFavoriteNotes);
    on<AddFavoriteNote>(_onAddFavoriteNote);
    on<EditFavoriteNote>(_onEditFavoriteNote);
    on<DeleteFavoriteNote>(_onDeleteFavoriteNote);
  }

  Future<void> _onGetFavoriteNotes(GetFavoriteNotes event, emit) async {
    emit(FavoriteNoteLoading());
    try {
      final FavoriteNotes favoriteNotes =
          await _favoriteNoteRepository.fetchFavoriteNotes();
      emit(FavoriteNoteLoaded(favoriteNotes));
    } catch (e) {
      emit(FavoriteNoteError(e.toString()));
    }
  }

  Future<void> _onAddFavoriteNote(AddFavoriteNote event, emit) async {
    emit(FavoriteNoteLoading());
    try {
      final FavoriteNotes favoriteNotes =
          await _favoriteNoteRepository.addFavoriteNote(
        favoriteNote: event.favoriteNote,
      );
      emit(FavoriteNoteLoaded(favoriteNotes));
    } catch (e) {
      emit(FavoriteNoteError(e.toString()));
    }
  }

  Future<void> _onEditFavoriteNote(EditFavoriteNote event, emit) async {
    emit(FavoriteNoteLoading());
    try {
      final FavoriteNotes favoriteNotes =
          await _favoriteNoteRepository.editFavoriteNote(
        noteId: event.noteId,
        updatedFavoriteNote: event.updatedFavoriteNote,
      );
      emit(FavoriteNoteLoaded(favoriteNotes));
    } catch (e) {
      emit(FavoriteNoteError(e.toString()));
    }
  }

  Future<void> _onDeleteFavoriteNote(DeleteFavoriteNote event, emit) async {
    emit(FavoriteNoteLoading());
    try {
      final FavoriteNotes favoriteNotes =
          await _favoriteNoteRepository.deleteFavoriteNote(
        id: event.id,
      );
      emit(FavoriteNoteLoaded(favoriteNotes));
    } catch (e) {
      emit(FavoriteNoteError(e.toString()));
    }
  }
}
