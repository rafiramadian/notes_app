import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable_panel/flutter_slidable_panel.dart';
import 'package:notes_app/blocs/favorite_note/favorite_note_bloc.dart';
import 'package:notes_app/blocs/note/note_bloc.dart';
import 'package:notes_app/di/injector.dart';
import 'package:notes_app/models/favorite_note/favorite_note.dart';
import 'package:notes_app/models/note/note.dart';
import 'package:notes_app/presentations/notes/widgets/note_form_dialog.dart';

class NoteItem extends StatefulWidget {
  final Note note;
  final bool isFirstItem;
  final bool isLastItem;
  const NoteItem({
    super.key,
    required this.note,
    required this.isFirstItem,
    required this.isLastItem,
  });

  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {
  final SlideController slideController = SlideController(
    usePreActionController: false,
    usePostActionController: true,
  );

  @override
  void dispose() {
    slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: (widget.isFirstItem)
                  ? const Radius.circular(20)
                  : Radius.zero,
              bottomRight:
                  (widget.isLastItem) ? const Radius.circular(20) : Radius.zero,
            ),
            child: BlocBuilder<FavoriteNoteBloc, FavoriteNoteState>(
              builder: (context, state) {
                final bool isLoaded = state is FavoriteNoteLoaded;

                return SlidablePanel(
                  controller: slideController,
                  maxSlideThreshold: 0.6,
                  axis: Axis.horizontal,
                  postActionLayout: const ActionLayout(
                    motion: ActionMotion.stretch,
                    alignment: ActionAlignment.flex,
                  ),
                  onSlideStart: () {
                    slideController.dismiss();
                  },
                  postActions: [
                    GestureDetector(
                      onTap: () async {
                        if (isLoaded) {
                          if (state.favoriteNotes.favoriteNotes.any(
                            (element) => element.id == widget.note.id,
                          )) {
                            getIt.get<FavoriteNoteBloc>().add(
                                  DeleteFavoriteNote(widget.note.id ?? ''),
                                );
                          } else {
                            getIt.get<FavoriteNoteBloc>().add(AddFavoriteNote(
                                  FavoriteNote(
                                    widget.note.id ?? '',
                                    widget.note.title,
                                    widget.note.description,
                                  ),
                                ));
                          }
                        }
                      },
                      child: Container(
                        color: Colors.blue,
                        child: Icon(
                          (isLoaded)
                              ? (state.favoriteNotes.favoriteNotes.any(
                                  (element) => element.id == widget.note.id,
                                ))
                                  ? Icons.favorite
                                  : Icons.favorite_outline
                              : Icons.favorite_outline,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        slideController.dismiss();
                        showDialog<Note>(
                          context: context,
                          builder: (context) =>
                              NoteFormDialog(note: widget.note),
                        ).then((result) {
                          if (result != null) {
                            getIt
                                .get<NoteBloc>()
                                .add(EditNote(widget.note.id ?? '', result));
                            getIt.get<FavoriteNoteBloc>().add(EditFavoriteNote(
                                  widget.note.id ?? '',
                                  FavoriteNote(
                                    widget.note.id ?? '',
                                    result.title,
                                    result.description,
                                  ),
                                ));
                          }
                        });
                      },
                      child: Container(
                        color: Colors.green,
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        slideController.dismiss();
                        getIt
                            .get<NoteBloc>()
                            .add(DeleteNote(widget.note.id ?? ''));
                        if (state is FavoriteNoteLoaded) {
                          if (state.favoriteNotes.favoriteNotes
                              .any((element) => element.id == widget.note.id)) {
                            getIt
                                .get<FavoriteNoteBloc>()
                                .add(DeleteFavoriteNote(widget.note.id ?? ''));
                          }
                        }
                      },
                      child: Container(
                        color: Colors.red,
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 16),
                        Text(
                          widget.note.title,
                          style: Theme.of(context).textTheme.titleLarge,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          widget.note.description,
                          style: Theme.of(context).textTheme.titleMedium,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          if (!widget.isLastItem) ...[
            const Divider(
              thickness: 1,
              height: 0,
            ),
          ],
        ],
      ),
    );
  }
}
