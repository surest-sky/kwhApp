import 'package:app/model/note_item.dart';
import 'package:app/res/style.dart';
import 'package:flutter/material.dart';
import 'NoteBlock.dart';

class NoteBlockList extends StatefulWidget {
  final List<NoteItem> notes;
  final String? tagName;

  const NoteBlockList({Key? key, required this.notes, String? this.tagName})
      : super(key: key);

  @override
  State<NoteBlockList> createState() => _NoteBlockListState();
}

class _NoteBlockListState extends State<NoteBlockList> {
  Widget buildHeader() {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.only(top: 20, bottom: 30),
      child: Text(
        "# ${widget.tagName}",
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Styles.styleBackgroundGray,
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          if (widget.tagName != null) buildHeader(),
          ...widget.notes
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: NoteBlock(item: e),
                ),
              )
              .toList()
        ]),
      ),
    );
  }
}
