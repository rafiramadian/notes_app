import 'package:flutter/material.dart';
import 'package:notes_app/blocs/favorite_note/favorite_note_bloc.dart';
import 'package:notes_app/data/models/favorite_note/favorite_note.dart';
import 'package:notes_app/di/injector.dart';
import 'package:notes_app/presentations/favorite/widgets/favorite_note_header.dart';
import 'package:notes_app/presentations/favorite/widgets/favorite_note_list.dart';

class FavoriteNoteLoadingBody extends StatelessWidget {
  const FavoriteNoteLoadingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 16),
        FavoriteNoteHeader(),
        Expanded(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }
}

class FavoriteNoteErrorBody extends StatelessWidget {
  const FavoriteNoteErrorBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async =>
          getIt.get<FavoriteNoteBloc>().add(GetFavoriteNotes()),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.8,
          child: const Column(
            children: [
              SizedBox(height: 16),
              FavoriteNoteHeader(),
              Expanded(
                child: Center(
                  child: Text('An error occured. Please drag down to refresh'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FavoriteNoteLoadedBody extends StatelessWidget {
  final FavoriteNotes favoriteNotes;
  const FavoriteNoteLoadedBody({super.key, required this.favoriteNotes});

  @override
  Widget build(BuildContext context) {
    if (favoriteNotes.favoriteNotes.isEmpty) {
      return RefreshIndicator(
        onRefresh: () async =>
            getIt.get<FavoriteNoteBloc>().add(GetFavoriteNotes()),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.8,
            child: const Column(
              children: [
                SizedBox(height: 16),
                FavoriteNoteHeader(),
                Expanded(
                  child: Center(
                    child: Text('No notes found'),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async =>
          getIt.get<FavoriteNoteBloc>().add(GetFavoriteNotes()),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const FavoriteNoteHeader(),
              const SizedBox(height: 16),
              FavoriteNoteList(favoriteNotes: favoriteNotes),
            ],
          ),
        ),
      ),
    );
  }
}
