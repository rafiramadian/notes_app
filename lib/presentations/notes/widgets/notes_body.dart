import 'package:flutter/material.dart';
import 'package:notes_app/blocs/note/note_bloc.dart';
import 'package:notes_app/data/models/note/note.dart';
import 'package:notes_app/di/injector.dart';
import 'package:notes_app/presentations/notes/widgets/note_list.dart';
import 'package:notes_app/presentations/notes/widgets/notes_header.dart';

class NotesLoadingBody extends StatelessWidget {
  const NotesLoadingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 16),
        NotesHeader(),
        Expanded(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }
}

class NotesErrorBody extends StatelessWidget {
  const NotesErrorBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => getIt.get<NoteBloc>().add(GetNotes()),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.8,
          child: const Column(
            children: [
              SizedBox(height: 16),
              NotesHeader(),
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

class NotesLoadedBody extends StatelessWidget {
  final List<Note> notes;
  const NotesLoadedBody({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    if (notes.isEmpty) {
      return RefreshIndicator(
        onRefresh: () async => getIt.get<NoteBloc>().add(GetNotes()),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.8,
            child: const Column(
              children: [
                SizedBox(height: 16),
                NotesHeader(),
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
      onRefresh: () async => getIt.get<NoteBloc>().add(GetNotes()),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const NotesHeader(),
              const SizedBox(height: 16),
              NoteList(notes: notes),
            ],
          ),
        ),
      ),
    );
  }
}
