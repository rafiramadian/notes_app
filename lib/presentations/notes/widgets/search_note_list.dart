import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/blocs/search%20note/search_note_bloc.dart';
import 'package:notes_app/presentations/notes/widgets/search_note_item.dart';

class SearchNoteList extends StatelessWidget {
  const SearchNoteList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchNoteBloc, SearchNoteState>(
      builder: (context, searchNoteState) {
        if (searchNoteState is SearchNoteLoaded) {
          if (searchNoteState.newNotes.isEmpty) {
            return const Expanded(
                child: Center(
              child: Text('No notes found'),
            ));
          }

          return Expanded(
            child: ListView.builder(
              itemCount: searchNoteState.newNotes.length,
              itemBuilder: (BuildContext context, int index) {
                return SearchNoteItem(
                  note: searchNoteState.newNotes[index],
                );
              },
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
