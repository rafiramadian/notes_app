import 'package:flutter/material.dart';
import 'package:notes_app/models/note/note.dart';
import 'package:notes_app/presentations/home/pages/home_page.dart';
import 'package:notes_app/presentations/notes/pages/notes_page.dart';
import 'package:notes_app/presentations/notes/pages/search_note_page.dart';
import 'package:notes_app/presentations/splash/pages/splash_page.dart';

class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String notes = '/notes';
  static const String searchNotes = '/searchNotes';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case notes:
        return MaterialPageRoute(builder: (_) => const NotesPage());
      case searchNotes:
        return MaterialPageRoute(
            builder: (_) => SearchNotePage(
                  notes: settings.arguments as List<Note>,
                ));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
