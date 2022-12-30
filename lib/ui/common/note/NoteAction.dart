import 'package:app/model/action_model.dart';
import 'package:app/model/note_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../FloatModal.dart';
import 'NoteDeleteConfirm.dart';

class NoteAction extends StatelessWidget {
  late NoteItem item;
  late ActionModel action;

  NoteAction({Key? key, required this.item, required this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: const Text('编辑'),
              leading: Icon(Icons.edit),
              onTap: () => Navigator.of(context).pop(),
            ),
            ListTile(
              title: const Text('移除'),
              leading: const Icon(Icons.delete),
              onTap: () => {
                Get.back(),
                showFloatingModalBottomSheet(
                  context: context,
                  builder: (context) => NoteDeleteConfirm(item: item, action: action,),
                ),
              },
            )
          ],
        ),
      ),
    );
  }
}
