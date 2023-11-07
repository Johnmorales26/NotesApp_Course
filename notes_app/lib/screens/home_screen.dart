import 'package:notes_app/models/note_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/common/constants.dart';
import 'package:notes_app/db/notes_database.dart';
import 'package:notes_app/widgets/widgets.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  List<NoteModel> listNotes = NotesDatabase.notesList;

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes',
            style:
                GoogleFonts.nunito(fontSize: 43, fontWeight: FontWeight.w600)),
        actions: [
          FloatingActionButton.small(
              child: const Icon(Icons.search),
              onPressed: () {
                Navigator.pushNamed(context, searchScreen);
              }),
          FloatingActionButton.small(
              child: const Icon(Icons.info), onPressed: () {})
        ],
      ),
      body: Center(
          child: listNotes.isEmpty
              ? const EmptyNotesWidget()
              : NotesWidget(notes: listNotes)),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, addScreen);
        },
      ),
    );
  }
}
