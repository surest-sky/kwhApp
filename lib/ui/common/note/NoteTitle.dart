import 'package:app/model/note_item.dart';
import 'package:app/util/widget/well_icon.dart';
import 'package:app/util/widget/well_title.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'NoteDetail.dart';

class NoteTitle extends StatelessWidget {
  late NoteItem item;
  NoteTitle({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showBarModalBottomSheet(
          expand: true,
          context: context,
          backgroundColor: Colors.white,
          builder: (context) => NoteDetail(
            item: item,
          ),
        );
      },
      child: SizedBox(
        height: 30,
        child: Row(
          children: [
            WellIcon(item: item),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: WellTitle(item: item),
            )
          ],
        ),
      ),
    );
  }
}
