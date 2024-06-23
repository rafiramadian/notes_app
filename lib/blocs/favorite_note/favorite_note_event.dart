part of 'favorite_note_bloc.dart';

abstract class FavoriteNoteEvent extends Equatable {
  const FavoriteNoteEvent();

  @override
  List<Object> get props => [];
}

class GetFavoriteNotes extends FavoriteNoteEvent {}

class AddFavoriteNote extends FavoriteNoteEvent {
  final FavoriteNote favoriteNote;

  const AddFavoriteNote(this.favoriteNote);

  @override
  List<Object> get props => [favoriteNote];
}

class EditFavoriteNote extends FavoriteNoteEvent {
  final String noteId;
  final FavoriteNote updatedFavoriteNote;

  const EditFavoriteNote(this.noteId, this.updatedFavoriteNote);

  @override
  List<Object> get props => [noteId, updatedFavoriteNote];
}

class DeleteFavoriteNote extends FavoriteNoteEvent {
  final String id;

  const DeleteFavoriteNote(this.id);

  @override
  List<Object> get props => [id];
}
