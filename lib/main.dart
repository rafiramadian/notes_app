import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/blocs/bottom%20navigation/bottom_navigation_cubit.dart';
import 'package:notes_app/blocs/favorite_note/favorite_note_bloc.dart';
import 'package:notes_app/blocs/note/note_bloc.dart';
import 'package:notes_app/blocs/search%20note/search_note_bloc.dart';
import 'package:notes_app/utils/app_routes.dart';
import 'package:notes_app/data/services/navigation_service.dart';
import 'package:notes_app/di/injector.dart';
import 'package:notes_app/utils/app_theme.dart';
import 'package:notes_app/utils/logger.dart';

void main() {
  initializeLogger();
  setupDI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final double textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<NoteBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<SearchNoteBloc>(),
        ),
        BlocProvider(
          create: (context) =>
              getIt<FavoriteNoteBloc>()..add(GetFavoriteNotes()),
        ),
        BlocProvider(
          create: (context) => getIt<BottomNavigationCubit>(),
        ),
      ],
      child: MaterialApp(
        title: 'Notes App',
        theme: AppTheme.getTheme(textScaleFactor),
        navigatorKey: NavigationService.navigatorKey,
        onGenerateRoute: AppRoutes.generateRoute,
        initialRoute: AppRoutes.splash,
      ),
    );
  }
}
