part of 'note_bloc.dart';

abstract class NoteEvent extends Equatable {
  const NoteEvent();

  @override
  List<Object> get props => [];
}

class GetNotes extends NoteEvent {}

class AddNote extends NoteEvent {
  final Note note;

  const AddNote(this.note);

  @override
  List<Object> get props => [note];
}

class EditNote extends NoteEvent {
  final String idPreviousNote;
  final Note newNote;

  const EditNote(this.idPreviousNote, this.newNote);

  @override
  List<Object> get props => [idPreviousNote, newNote];
}

class DeleteNote extends NoteEvent {
  final String id;

  const DeleteNote(this.id);

  @override
  List<Object> get props => [id];
}
