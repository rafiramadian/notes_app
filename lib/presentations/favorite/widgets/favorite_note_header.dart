import 'package:flutter/material.dart';

class FavoriteNoteHeader extends StatelessWidget {
  const FavoriteNoteHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Favorite',
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ],
    );
  }
}
