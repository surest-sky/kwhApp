import 'package:app/model/action_model.dart';
import 'package:app/model/share_data_model.dart';
import 'package:app/ui/page/share_page/share_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../FloatModal.dart';
import 'ShareAdd.dart';
import 'ShareDeleteConfirm.dart';

class ShareAction extends StatelessWidget {
  late ShareDataModel item;
  late ActionModel action;
  ShareController get controller => Get.find();

  ShareAction({Key? key, required this.item, required this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: const Text('查看更多'),
              leading: const Icon(Icons.send),
              onTap: (){
                Get.back();
                controller.toSharePage(item);
              },
            ),
            ListTile(
              title: const Text('编辑'),
              leading: const Icon(Icons.edit),
              onTap: () {
                Get.back();
                controller.selectItems.assignAll(item.selectItems);
                controller.formTitleController.text = item.title;
                controller.shareId = item.shareId;
                showFloatingModalBottomSheet(
                  context: context,
                  builder: (context) => ShareAdd(item: item),
                );
              }
            ),
            ListTile(
              title: const Text('移除'),
              leading: const Icon(Icons.delete),
              onTap: () => {
                Get.back(),
                showFloatingModalBottomSheet(
                  context: context,
                  builder: (context) => ShareDeleteConfirm(item: item, action: action,),
                ),
              },
            )
          ],
        ),
      ),
    );
  }
}
