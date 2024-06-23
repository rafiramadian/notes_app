import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/blocs/bottom%20navigation/bottom_navigation_cubit.dart';
import 'package:notes_app/di/injector.dart';
import 'package:notes_app/utils/app_colors.dart';

class BottomNavigationSection extends StatelessWidget {
  const BottomNavigationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationCubit, int>(
      builder: (context, state) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: getIt.get<BottomNavigationCubit>().state,
          selectedItemColor: AppColors.onPrimaryColor,
          unselectedItemColor: AppColors.primaryColor,
          onTap: (v) =>
              getIt.get<BottomNavigationCubit>().changeSelectedNavBar(v),
          items: const [
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.notes,
                size: 24,
              ),
              icon: Icon(
                Icons.notes_outlined,
                size: 24,
              ),
              label: 'Notes',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.favorite,
                size: 24,
              ),
              icon: Icon(
                Icons.favorite_outline,
                size: 24,
              ),
              label: 'Favorite',
            ),
          ],
        );
      },
    );
  }
}
