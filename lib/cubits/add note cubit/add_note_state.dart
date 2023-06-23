part of 'add_note_cubit.dart';

@immutable
abstract class AddNoteState {}

class AddNoteInitial extends AddNoteState {}

class AddNoteLoading extends AddNoteState {}

class AddNoteLoadded extends AddNoteState {}

class AddNoteFaliuer extends AddNoteState {
  final String errMasage;

  AddNoteFaliuer(this.errMasage);
}
