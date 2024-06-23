import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/blocs/favorite_note/favorite_note_bloc.dart';
import 'package:notes_app/presentations/favorite/widgets/favorite_note_body.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: BlocBuilder<FavoriteNoteBloc, FavoriteNoteState>(
            builder: (context, state) {
              if (state is FavoriteNoteLoaded) {
                return FavoriteNoteLoadedBody(
                    favoriteNotes: state.favoriteNotes);
              } else if (state is FavoriteNoteError) {
                return const FavoriteNoteErrorBody();
              } else {
                return const FavoriteNoteLoadingBody();
              }
            },
          ),
        ),
      ),
    );
  }
}
