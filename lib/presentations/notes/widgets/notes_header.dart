import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/blocs/note/note_bloc.dart';
import 'package:notes_app/data/services/navigation_service.dart';
import 'package:notes_app/utils/app_routes.dart';

class NotesHeader extends StatelessWidget {
  const NotesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Notes',
          style: Theme.of(context).textTheme.displaySmall,
        ),
        BlocBuilder<NoteBloc, NoteState>(
          builder: (context, state) {
            if (state is NoteLoaded) {
              if (state.notes.isNotEmpty) {
                return IconButton(
                  onPressed: () {
                    NavigationService.push(
                      AppRoutes.searchNotes,
                      arguments: state.notes,
                    );
                  },
                  icon: const Icon(
                    Icons.search,
                    size: 30,
                  ),
                );
              }
            }

            return const SizedBox();
          },
        ),
      ],
    );
  }
}
