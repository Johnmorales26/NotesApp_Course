import 'package:flutter/material.dart';
import 'package:notes_app/common/responsive_layout.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/note_widget.dart';

class NotesWidget extends StatefulWidget {
  const NotesWidget({Key? key, required this.notes}) : super(key: key);

  final List<NoteModel> notes;

  @override
  State<StatefulWidget> createState() => _NotesState(notes: notes);
}

class _NotesState extends State<NotesWidget> {
  final List<NoteModel> notes;

  _NotesState({required this.notes});

  Widget buildGridForDevice(BuildContext context, int crossAxisCount, double paddingAmount) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: paddingAmount, horizontal: paddingAmount * 2),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
        ),
        padding: EdgeInsets.all(paddingAmount),
        itemCount: notes.length,
        itemBuilder: (BuildContext context, int index) {
          return NoteWidget(note: notes[index]);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (ResponsiveLayout.isLarge(context)) {
      return buildGridForDevice(context, 6, 32.0);
    } else if (ResponsiveLayout.isDesktop(context)) {
      return buildGridForDevice(context, 4, 24.0);
    } else if (ResponsiveLayout.isTablet(context)) {
      return buildGridForDevice(context, 2, 16.0);
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: ListView.builder(
          itemCount: notes.length,
          padding: const EdgeInsets.all(8),
          itemBuilder: (BuildContext context, int index) {
            return NoteWidget(note: notes[index]);
          },
        ),
      );
    }
  }
}
