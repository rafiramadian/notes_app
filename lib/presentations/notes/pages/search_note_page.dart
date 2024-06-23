import 'package:flutter/material.dart';
import 'package:notes_app/data/models/note/note.dart';
import 'package:notes_app/presentations/notes/widgets/search_note_form.dart';
import 'package:notes_app/presentations/notes/widgets/search_note_list.dart';

class SearchNotePage extends StatelessWidget {
  final List<Note> notes;
  const SearchNotePage({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SearchNoteForm(notes: notes),
            const SearchNoteList(),
          ],
        ),
      ),
    );
  }
}
