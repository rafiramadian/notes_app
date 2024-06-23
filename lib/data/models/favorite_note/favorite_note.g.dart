// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteNotes _$FavoriteNotesFromJson(Map<String, dynamic> json) =>
    FavoriteNotes(
      (json['favoriteNotes'] as List<dynamic>)
          .map((e) => FavoriteNote.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FavoriteNotesToJson(FavoriteNotes instance) =>
    <String, dynamic>{
      'favoriteNotes': instance.favoriteNotes.map((e) => e.toJson()).toList(),
    };

FavoriteNote _$FavoriteNoteFromJson(Map<String, dynamic> json) => FavoriteNote(
      json['id'] as String,
      json['title'] as String,
      json['description'] as String,
    );

Map<String, dynamic> _$FavoriteNoteToJson(FavoriteNote instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
    };
