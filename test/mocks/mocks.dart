import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mockito/annotations.dart';
import 'package:notes_app/data/repository/note_repository.dart';
import 'package:notes_app/data/services/dio_service.dart';

@GenerateMocks(
  [Dio, Connectivity, DioService, FlutterSecureStorage, NoteRepository],
)
void main() {}
