import 'package:app/http/request_repository.dart';
import 'package:app/model/action_model.dart';
import 'package:app/model/note_item.dart';
import 'package:app/ui/page/home_page/home_controller.dart';
import 'package:app/util/toast_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoteDeleteConfirm extends StatelessWidget {
  late NoteItem item;
  late ActionModel action;
  NoteDeleteConfirm({Key? key, required this.item, required this.action}) : super(key: key);

  // 删除
  submitDelete(context) {
    ToastUtil.showLoading();
    Get.find<RequestRepository>().deleteNote(item.dataid, success: (bool _is) {
      ToastUtil.toast("删除成功");
      Navigator.of(context).pop();
      refreshList();
    });
  }

  refreshList() {
    action.deleted(item.dataid);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: const Text('确认删除'),
              leading: const Icon(Icons.delete),
              onTap: () => submitDelete(context),
            ),
            ListTile(
              title: const Text('取消'),
              leading: const Icon(Icons.reply),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}
