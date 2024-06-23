import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/blocs/bottom%20navigation/bottom_navigation_cubit.dart';
import 'package:notes_app/presentations/favorite/pages/favorite_page.dart';
import 'package:notes_app/presentations/home/widgets/bottom_navigation_bar.dart';
import 'package:notes_app/presentations/notes/pages/notes_page.dart';
import 'package:notes_app/utils/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      const NotesPage(),
      const FavoritePage(),
    ];

    return Scaffold(
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryColor,
              blurRadius: 10,
            ),
          ],
        ),
        child: const BottomNavigationSection(),
      ),
      body: BlocBuilder<BottomNavigationCubit, int>(
        builder: (context, state) {
          return pages.elementAt(state);
        },
      ),
    );
  }
}
