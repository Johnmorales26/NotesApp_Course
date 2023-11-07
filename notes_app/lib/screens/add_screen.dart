import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/common/responsive_layout.dart';
import 'package:notes_app/widgets/alert_dialog.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<StatefulWidget> createState() => AddScreenState();
}

class AddScreenState extends State<AddScreen> {
  final TextEditingController titleController = TextEditingController();
  final FocusNode titleFocusNode = FocusNode();
  final TextEditingController contentController = TextEditingController();
  final FocusNode contentFocusNode = FocusNode();
  bool hiddenEditableMode = true;
  bool isEditableMode = true;

  void _enableEditText() {
    setState(() {
      isEditableMode = !isEditableMode;
    });
  }

  Widget _expandedContent(double padding) {
    return Row(
      children: [
        Expanded(
            child: _EditableWidget(
                titleController: titleController,
                contentController: contentController,
                padding: padding)),
        Expanded(
            child: _NotEditableWidget(
                titleController: titleController,
                contentController: contentController,
                padding: padding))
      ],
    );
  }

  Widget buildResponsiveBody() {
    if (ResponsiveLayout.isLarge(context)) {
      //	Padding 32

      return _expandedContent(32.0);
    } else if (ResponsiveLayout.isDesktop(context)) {
      //	Padding 24
      return _expandedContent(24.0);
    } else if (ResponsiveLayout.isTablet(context)) {
      //	Padding 16
      return _expandedContent(16.0);
    } else {
      hiddenEditableMode = false;
      return isEditableMode
          ? _EditableWidget(
              titleController: titleController,
              contentController: contentController,
              padding: 8.0)
          : _NotEditableWidget(
              titleController: titleController,
              contentController: contentController,
              padding: 8.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              showMyDialog(context, titleController, contentController);
            }),
        actions: [
          hiddenEditableMode
              ? Container()
              : FloatingActionButton.small(
                  child: isEditableMode
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                  onPressed: () {
                    _enableEditText();
                  }),
          FloatingActionButton.small(
              child: const Icon(Icons.save),
              onPressed: () {
                showMyDialog(context, titleController, contentController);
              })
        ],
      ),
      body: SingleChildScrollView(
        child: buildResponsiveBody(),
      ),
    );
  }
}

class _EditableWidget extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController contentController;
  final double padding;

  const _EditableWidget(
      {required this.titleController,
      required this.contentController,
      required this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: titleController,
            style:
                GoogleFonts.nunito(fontSize: 48, fontWeight: FontWeight.normal),
            decoration: const InputDecoration(
                fillColor: Colors.transparent,
                border: OutlineInputBorder(),
                labelText: 'Title'),
          ),
          const SizedBox(height: 40),
          TextField(
            controller: contentController,
            style:
                GoogleFonts.nunito(fontSize: 23, fontWeight: FontWeight.normal),
            decoration: const InputDecoration(
                fillColor: Colors.transparent,
                border: OutlineInputBorder(),
                labelText: 'Type something...'),
          )
        ],
      ),
    );
  }
}

class _NotEditableWidget extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController contentController;
  final double padding;

  const _NotEditableWidget(
      {required this.titleController,
      required this.contentController,
      required this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titleController.text,
              style: GoogleFonts.nunito(
                  fontSize: 48, fontWeight: FontWeight.normal)),
          const SizedBox(height: 40),
          Text(contentController.text,
              style: GoogleFonts.nunito(
                  fontSize: 23, fontWeight: FontWeight.normal))
        ],
      ),
    );
  }
}
