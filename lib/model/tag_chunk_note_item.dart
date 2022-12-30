
import 'dart:convert';

import 'note_item.dart';

class TagChunkNoteItem {
  TagChunkNoteItem({required this.chunkDate, required this.notes});

  TagChunkNoteItem.fromJson(String chunkDate, List<NoteItem> notes) {
    chunkDate = chunkDate;
    notes = notes;
  }

  @override
  String toString() {
    final map = <String, dynamic>{};
    map["chunkDate"] = chunkDate;
    map["notes"] = jsonEncode(notes);
    return jsonEncode(map);
  }

  late String chunkDate;
  late List<NoteItem> notes;
}
