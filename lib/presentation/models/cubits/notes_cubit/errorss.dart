import 'package:meta/meta.dart';

@immutable
abstract class NotesState {}

class NotesInitial extends NotesState {}

class NotesSuccess extends NotesState {}

class NotesError extends NotesState {
  final String errorMessage;

  NotesError({required this.errorMessage});
}
