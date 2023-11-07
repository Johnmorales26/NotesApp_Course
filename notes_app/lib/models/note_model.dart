class NoteModel {

  final int id = DateTime.now().microsecondsSinceEpoch;
  final String title;
  final String content;

  NoteModel({required this.title, required this.content});

}