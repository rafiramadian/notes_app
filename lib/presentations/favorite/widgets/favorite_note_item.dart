import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable_panel/flutter_slidable_panel.dart';
import 'package:notes_app/blocs/favorite_note/favorite_note_bloc.dart';
import 'package:notes_app/di/injector.dart';
import 'package:notes_app/models/favorite_note/favorite_note.dart';

class FavoriteNoteItem extends StatefulWidget {
  final FavoriteNote favoriteNote;
  final bool isFirstItem;
  final bool isLastItem;
  const FavoriteNoteItem({
    super.key,
    required this.favoriteNote,
    required this.isFirstItem,
    required this.isLastItem,
  });

  @override
  State<FavoriteNoteItem> createState() => _FavoriteNoteItemState();
}

class _FavoriteNoteItemState extends State<FavoriteNoteItem> {
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
            child: SlidablePanel(
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
                BlocBuilder<FavoriteNoteBloc, FavoriteNoteState>(
                  builder: (context, state) {
                    final bool isLoaded = state is FavoriteNoteLoaded;

                    return GestureDetector(
                      onTap: () async {
                        if (isLoaded) {
                          if (state.favoriteNotes.favoriteNotes.any(
                            (element) => element.id == widget.favoriteNote.id,
                          )) {
                            getIt.get<FavoriteNoteBloc>().add(
                                  DeleteFavoriteNote(widget.favoriteNote.id),
                                );
                          } else {
                            getIt
                                .get<FavoriteNoteBloc>()
                                .add(AddFavoriteNote(widget.favoriteNote));
                          }
                        }
                      },
                      child: Container(
                        color: Colors.blue,
                        child: Center(
                          child: Text(
                            'Hapus dari\nFavorite',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  },
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
                      widget.favoriteNote.title,
                      style: Theme.of(context).textTheme.titleLarge,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      widget.favoriteNote.description,
                      style: Theme.of(context).textTheme.titleMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
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
