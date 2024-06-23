part of 'search_note_bloc.dart';

abstract class SearchNoteEvent extends Equatable {
  const SearchNoteEvent();

  @override
  List<Object> get props => [];
}

class SearchNote extends SearchNoteEvent {
  final List<Note> notes;
  final String searchWord;

  const SearchNote(this.notes, this.searchWord);

  @override
  List<Object> get props => [notes, searchWord];
}
