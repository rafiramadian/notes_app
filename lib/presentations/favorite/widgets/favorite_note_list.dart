import 'package:flutter/material.dart';
import 'package:notes_app/data/models/favorite_note/favorite_note.dart';
import 'package:notes_app/presentations/favorite/widgets/favorite_note_item.dart';

class FavoriteNoteList extends StatelessWidget {
  final FavoriteNotes favoriteNotes;
  const FavoriteNoteList({super.key, required this.favoriteNotes});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        children: favoriteNotes.favoriteNotes.map((favoriteNote) {
          final index = favoriteNotes.favoriteNotes.indexOf(favoriteNote);
          return FavoriteNoteItem(
            favoriteNote: favoriteNote,
            isFirstItem: favoriteNotes.favoriteNotes[index] ==
                favoriteNotes.favoriteNotes.first,
            isLastItem: favoriteNotes.favoriteNotes[index] ==
                favoriteNotes.favoriteNotes.last,
          );
        }).toList(),
      ),
    );
  }
}
