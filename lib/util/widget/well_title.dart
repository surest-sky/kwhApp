import 'package:app/model/note_item.dart';
import 'package:app/util/enum_util.dart';
import 'package:flutter/material.dart';

class WellTitle extends StatelessWidget {
  final NoteItem item;
  const WellTitle({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      wellTitle(item),
      textAlign: TextAlign.left,
      style: const TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: 16,
        color: Colors.blueAccent,
      ),
    );
  }

  String wellTitle(NoteItem item) {
    final title = item.title.replaceAll('\n', '');
    if (item.type == EnumUtil.ocr) {
      return "[图片] " + title;
    }
    return title;
  }
}
