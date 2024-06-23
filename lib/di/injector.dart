// import 'package:connectivity/connectivity.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:notes_app/blocs/bottom%20navigation/bottom_navigation_cubit.dart';
import 'package:notes_app/blocs/favorite_note/favorite_note_bloc.dart';
import 'package:notes_app/blocs/note/note_bloc.dart';
import 'package:notes_app/blocs/search%20note/search_note_bloc.dart';
import 'package:notes_app/data/repository/favorite_note_repository.dart';
import 'package:notes_app/data/repository/note_repository.dart';
import 'package:notes_app/data/services/dio_service.dart';
import 'package:notes_app/data/services/secure_storage_service.dart';

final getIt = GetIt.instance;

void setupDI() {
  // Register External
  getIt.registerSingleton<Connectivity>(Connectivity());
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage());

  // Register Service
  getIt.registerSingleton<DioService>(DioService(
    dio: getIt<Dio>(),
    connectivity: getIt<Connectivity>(),
  ));
  getIt.registerSingleton<SecureStorageService>(SecureStorageService(
    secureStorageService: getIt<FlutterSecureStorage>(),
  ));

  // Register Repository
  getIt.registerSingleton<FavoriteNoteRepository>(FavoriteNoteRepository(
    secureStorageService: getIt<SecureStorageService>(),
  ));
  getIt.registerSingleton<NoteRepository>(NoteRepository(
    dioService: getIt<DioService>(),
  ));

  // Register State Management
  getIt.registerSingleton(BottomNavigationCubit());
  getIt.registerSingleton(FavoriteNoteBloc(
    favoriteNoteRepository: getIt<FavoriteNoteRepository>(),
  ));
  getIt.registerSingleton(NoteBloc(
    noteRepository: getIt<NoteRepository>(),
  ));
  getIt.registerSingleton(SearchNoteBloc());
}
