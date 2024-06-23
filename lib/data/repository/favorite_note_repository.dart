import 'dart:convert';

import 'package:notes_app/data/services/secure_storage_service.dart';
import 'package:notes_app/models/favorite_note/favorite_note.dart';

class FavoriteNoteRepository {
  final SecureStorageService _secureStorageService;
  FavoriteNoteRepository({required SecureStorageService secureStorageService})
      : _secureStorageService = secureStorageService;

  Future<FavoriteNotes> fetchFavoriteNotes() async {
    late FavoriteNotes favoriteNotes;

    try {
      final String? result = await _secureStorageService.read(
        key: _secureStorageService.keyFavoriteNote,
      );

      if (result != null) {
        favoriteNotes = FavoriteNotes.fromJson(json.decode(result));
      } else {
        favoriteNotes = FavoriteNotes([]);
      }

      return favoriteNotes;
    } catch (e) {
      rethrow;
    }
  }

  Future<FavoriteNotes> addFavoriteNote({
    required FavoriteNote favoriteNote,
  }) async {
    late String encodedData;
    late FavoriteNotes favoriteNotes;

    try {
      final String? result = await _secureStorageService.read(
        key: _secureStorageService.keyFavoriteNote,
      );

      if (result != null) {
        favoriteNotes = FavoriteNotes.fromJson(json.decode(result));
        favoriteNotes.favoriteNotes.add(favoriteNote);
        encodedData = json.encode(favoriteNotes.toJson());
      } else {
        favoriteNotes = FavoriteNotes([favoriteNote]);
        encodedData = json.encode(favoriteNotes.toJson());
      }

      await _secureStorageService.write(
        key: _secureStorageService.keyFavoriteNote,
        data: encodedData,
      );

      return favoriteNotes;
    } catch (e) {
      rethrow;
    }
  }

  Future<FavoriteNotes> editFavoriteNote(
      {required String noteId,
      required FavoriteNote updatedFavoriteNote}) async {
    late String encodedData;
    late FavoriteNotes favoriteNotes;

    try {
      final String? result = await _secureStorageService.read(
        key: _secureStorageService.keyFavoriteNote,
      );

      if (result != null) {
        favoriteNotes = FavoriteNotes.fromJson(json.decode(result));

        // Find the note to update
        int noteIndex =
            favoriteNotes.favoriteNotes.indexWhere((note) => note.id == noteId);

        if (noteIndex != -1) {
          // Update the note
          favoriteNotes.favoriteNotes[noteIndex] = updatedFavoriteNote;
          encodedData = json.encode(favoriteNotes.toJson());

          await _secureStorageService.write(
            key: _secureStorageService.keyFavoriteNote,
            data: encodedData,
          );

          return favoriteNotes;
        } else {
          return favoriteNotes;
        }
      } else {
        return favoriteNotes = FavoriteNotes([]);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<FavoriteNotes> deleteFavoriteNote({required String id}) async {
    late String encodedData;
    late FavoriteNotes favoriteNotes;
    try {
      final String? result = await _secureStorageService.read(
        key: _secureStorageService.keyFavoriteNote,
      );

      favoriteNotes = FavoriteNotes.fromJson(json.decode(result!));
      favoriteNotes.favoriteNotes.removeWhere(
        (element) => element.id == id,
      );
      encodedData = json.encode(favoriteNotes.toJson());

      await _secureStorageService.write(
        key: _secureStorageService.keyFavoriteNote,
        data: encodedData,
      );

      return favoriteNotes;
    } catch (e) {
      rethrow;
    }
  }
}
