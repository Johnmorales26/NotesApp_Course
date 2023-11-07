import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/db/notes_database.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/screens/home_screen.dart';

Future<void> showMyDialog(
    BuildContext context,
    TextEditingController titleController,
    TextEditingController contentController) async {
  return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: Text('Save changes ?', style: GoogleFonts.nunito()),
            content: Text(
                'Do you want to save the changes you made to the note?',
                style: GoogleFonts.nunito()),
            actions: [
              TextButton(
                onPressed: () {
                  // Acción para guardar los cambios
                  NoteModel note = NoteModel(
                      title: titleController.text,
                      content: contentController.text);
                  NotesDatabase.addNote(note);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
                child: Text('Save', style: GoogleFonts.nunito()),
              ),
              TextButton(
                onPressed: () {
                  // Acción para descartar los cambios
                  Navigator.of(context).pop(); // Cierra el AlertDialog
                },
                child: Text('Dismiss', style: GoogleFonts.nunito()),
              ),
            ],
          ));
}
