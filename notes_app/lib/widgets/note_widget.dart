import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/models/note_model.dart';

class NoteWidget extends StatelessWidget {
  final NoteModel note;

  const NoteWidget({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Color(0xff91F48F),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 36),
            child: Text(note.title,
                style: GoogleFonts.nunito(
                    fontSize: 25, fontWeight: FontWeight.normal)),
          ),
        );
  }
}
