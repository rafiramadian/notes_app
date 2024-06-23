import 'package:json_annotation/json_annotation.dart';

part 'favorite_note.g.dart';

@JsonSerializable(createToJson: true, explicitToJson: true)
class FavoriteNotes {
  final List<FavoriteNote> favoriteNotes;

  FavoriteNotes(this.favoriteNotes);

  factory FavoriteNotes.fromJson(Map<String, dynamic> json) =>
      _$FavoriteNotesFromJson(json);
  Map<String, dynamic> toJson() => _$FavoriteNotesToJson(this);
}

@JsonSerializable(createToJson: true)
class FavoriteNote {
  final String id;
  final String title;
  final String description;

  FavoriteNote(this.id, this.title, this.description);

  factory FavoriteNote.fromJson(Map<String, dynamic> json) =>
      _$FavoriteNoteFromJson(json);
  Map<String, dynamic> toJson() => _$FavoriteNoteToJson(this);
}
