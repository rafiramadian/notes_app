import 'package:flutter/material.dart';
import 'package:notes_app/models/note/note.dart';
import 'package:notes_app/presentations/notes/widgets/note_item.dart';

class NoteList extends StatelessWidget {
  final List<Note> notes;
  const NoteList({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        children: notes.map((note) {
          final index = notes.indexOf(note);
          return NoteItem(
            note: note,
            isFirstItem: notes[index] == notes.first,
            isLastItem: notes[index] == notes.last,
          );
        }).toList(),
      ),
    );
  }
}
