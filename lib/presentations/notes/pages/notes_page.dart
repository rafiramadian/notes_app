import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/blocs/note/note_bloc.dart';
import 'package:notes_app/di/injector.dart';
import 'package:notes_app/models/note/note.dart';
import 'package:notes_app/presentations/notes/widgets/note_form_dialog.dart';
import 'package:notes_app/presentations/notes/widgets/notes_body.dart';
import 'package:notes_app/utils/enum.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: BlocConsumer<NoteBloc, NoteState>(
            listener: (context, state) {
              if (state is NoteError) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.message),
                ));
              }

              if (state is NoteLoaded) {
                if (state.actionType == ActionType.add) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Add item succeed'),
                    duration: Duration(milliseconds: 1000),
                  ));
                } else if (state.actionType == ActionType.edit) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Edit item succeed'),
                    duration: Duration(milliseconds: 1000),
                  ));
                } else if (state.actionType == ActionType.delete) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Delete item succeed'),
                    duration: Duration(milliseconds: 1000),
                  ));
                }
              }
            },
            builder: (context, state) {
              if (state is NoteLoaded) {
                return NotesLoadedBody(notes: state.notes);
              } else if (state is NoteError) {
                return const NotesErrorBody();
              } else {
                return const NotesLoadingBody();
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          showDialog<Note>(
            context: context,
            builder: (context) => const NoteFormDialog(),
          ).then((result) {
            if (result != null) {
              getIt.get<NoteBloc>().add(AddNote(result));
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
