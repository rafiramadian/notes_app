import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/data/models/note/note.dart';

part 'search_note_event.dart';
part 'search_note_state.dart';

class SearchNoteBloc extends Bloc<SearchNoteEvent, SearchNoteState> {
  SearchNoteBloc() : super(SearchNoteInitial()) {
    on<SearchNote>(_onSearchNote);
  }

  void _onSearchNote(SearchNote event, emit) {
    if (event.searchWord.isEmpty) {
      emit(const SearchNoteLoaded([]));
    } else {
      final result = event.notes
          .where((note) =>
              note.title.contains(event.searchWord) ||
              note.description.contains(event.searchWord))
          .toList();

      emit(SearchNoteLoaded(result));
    }
  }
}
