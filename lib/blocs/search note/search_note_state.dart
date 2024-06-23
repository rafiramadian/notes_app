part of 'search_note_bloc.dart';

abstract class SearchNoteState extends Equatable {
  const SearchNoteState();

  @override
  List<Object> get props => [];
}

class SearchNoteInitial extends SearchNoteState {}

class SearchNoteLoaded extends SearchNoteState {
  final List<Note> newNotes;

  const SearchNoteLoaded(this.newNotes);

  @override
  List<Object> get props => [newNotes];
}
