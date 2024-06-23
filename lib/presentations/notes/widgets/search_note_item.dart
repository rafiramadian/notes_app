import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:notes_app/blocs/note/note_bloc.dart';
import 'package:notes_app/data/models/note/note.dart';
import 'package:notes_app/data/services/navigation_service.dart';
import 'package:notes_app/di/injector.dart';
import 'package:notes_app/presentations/notes/widgets/note_form_dialog.dart';
import 'package:notes_app/utils/app_routes.dart';

class SearchNoteItem extends StatelessWidget {
  final Note note;
  const SearchNoteItem({
    super.key,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              showDialog<Note>(
                context: context,
                builder: (context) => NoteFormDialog(note: note),
              ).then((result) {
                if (result != null) {
                  getIt.get<NoteBloc>().add(EditNote(note.id ?? '', result));
                  NavigationService.pushAndRemoveUntil(AppRoutes.home);
                }
              });
            },
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            icon: Icons.edit,
          ),
          SlidableAction(
            onPressed: (context) {
              getIt.get<NoteBloc>().add(DeleteNote(note.id ?? ''));
              NavigationService.pushAndRemoveUntil(AppRoutes.home);
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          note.title,
          style: Theme.of(context).textTheme.titleLarge,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          note.description,
          style: Theme.of(context).textTheme.titleMedium,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
