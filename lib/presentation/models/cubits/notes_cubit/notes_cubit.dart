import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/presentation/models/cubits/notes_cubit/errorss.dart';
import 'package:notes_app/presentation/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel> notes = [];

  void fetchAllNotes() {
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      notes = notesBox.values.toList();
      emit(NotesSuccess());
    } catch (e) {
      emit(NotesError(errorMessage: 'Failed to fetch notes: $e') as NotesState);
    }
  }
}
