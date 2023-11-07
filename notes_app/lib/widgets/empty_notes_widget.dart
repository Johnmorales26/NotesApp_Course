import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyNotesWidget extends StatelessWidget {
  const EmptyNotesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/img_empty_notes.png',
          width: 350,
          height: 285,
        ),
        Text('Create your first note !', style: GoogleFonts.nunito(
          fontSize: 20,
          fontWeight: FontWeight.w300
        ))
      ],
    );
  }

}