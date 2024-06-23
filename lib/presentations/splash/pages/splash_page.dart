import 'package:flutter/material.dart';
import 'package:notes_app/blocs/note/note_bloc.dart';
import 'package:notes_app/di/injector.dart';
import 'package:notes_app/utils/app_colors.dart';
import 'package:notes_app/utils/app_routes.dart';
import 'package:notes_app/data/services/navigation_service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    Future.delayed(const Duration(seconds: 3), () {
      getIt.get<NoteBloc>().add(GetNotes());
      NavigationService.pushAndRemoveUntil(AppRoutes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primaryColor,
              AppColors.secondaryColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Text(
            'Notes App',
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: AppColors.backgroundColor,
                ),
          ),
        ),
      ),
    );
  }
}
