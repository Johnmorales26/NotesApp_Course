import 'package:notes_app/models/note_model.dart';

class NotesDatabase {
  static List<NoteModel> notesList = <NoteModel>[];

  static void addNote(NoteModel note) {
    notesList.add(note);
  }

  // Filtra las notas cuyos títulos contienen el searchQuery
  static List<NoteModel> searchNotes(String searchQuery) {
    List<NoteModel> matchingNotes = NotesDatabase.notesList
        .where((note) =>
            note.title.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
    return matchingNotes;
  }
}
