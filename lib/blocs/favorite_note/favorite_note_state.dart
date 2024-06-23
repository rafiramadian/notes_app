part of 'favorite_note_bloc.dart';

abstract class FavoriteNoteState extends Equatable {
  const FavoriteNoteState();

  @override
  List<Object> get props => [];
}

class FavoriteNoteInitial extends FavoriteNoteState {}

class FavoriteNoteLoading extends FavoriteNoteState {}

class FavoriteNoteLoaded extends FavoriteNoteState {
  final FavoriteNotes favoriteNotes;

  const FavoriteNoteLoaded(this.favoriteNotes);

  @override
  List<Object> get props => [favoriteNotes];
}

class FavoriteNoteError extends FavoriteNoteState {
  final String message;

  const FavoriteNoteError(this.message);

  @override
  List<Object> get props => [message];
}
