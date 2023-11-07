import 'package:flutter/material.dart';
import 'package:notes_app/db/notes_database.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/note_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<StatefulWidget> createState() => SearchState();
}

class SearchState extends State<SearchScreen> {
  final TextEditingController filterController = TextEditingController();
  List<NoteModel> filterList = <NoteModel>[];

  void _searchNotes(String query) {
    setState(() {
      filterList = NotesDatabase.searchNotes(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
            controller: filterController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Search by the keyword...',
            ),
            onChanged: (value) {
              _searchNotes(value);
            }),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView.builder(
          itemCount: filterList.length, // Número de elementos en la lista
          itemBuilder: (BuildContext context, int index) {
            return NoteWidget(note: filterList[index]);
          },
        ),
      ),
    );
  }
}
