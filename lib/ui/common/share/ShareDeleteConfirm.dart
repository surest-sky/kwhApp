import 'package:app/model/action_model.dart';
import 'package:app/model/share_data_model.dart';
import 'package:app/ui/page/share_page/share_controller.dart';
import 'package:app/util/toast_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShareDeleteConfirm extends StatelessWidget {
  late ShareDataModel item;
  late ActionModel action;
  ShareDeleteConfirm({Key? key, required this.item, required this.action}) : super(key: key);

  // 删除
  submitDelete(context) {
    ToastUtil.showLoading();
    Get.find<ShareController>().deleteShare(item.shareId);
  }

  refreshList() {
    action.deleted(item.shareId);
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
              onTap: () => Get.back(),
            ),
          ],
        ),
      ),
    );
  }
}
