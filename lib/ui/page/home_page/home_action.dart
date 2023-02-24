import 'package:app/routes/routes.dart';
import 'package:app/ui/common/FloatModal.dart';
import 'package:app/ui/common/mixins/ImageAction.dart';
import 'package:app/ui/core/editor/editor_controller.dart';
import 'package:app/ui/core/editor/editor_webview.dart';
import 'package:app/util/image_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';


class HomeAction extends StatelessWidget with ImageAction{
  HomeAction({Key? key}) : super(key: key);
  get controller => Get.find<HomeController>();

  addSelectImg() async {
    final _file = await ImageUtil.imageSelectFile();
    if(_file == null) {
      return;
    }
    await uploadImageFile(_file);
    Get.back();
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
              title: const Text('快速添加'),
              leading: const Icon(Icons.add_circle),
              onTap: () {
                Get.back();
                Get.put(EditorController());
                showFloatingModalBottomSheet(
                  context: context,
                  builder: (context) => EditorWebview(
                    refresh: () => controller.onLoadRefresh(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('添加图片'),
              leading: const Icon(Icons.photo_library),
              onTap: () {
                addSelectImg();
              },
            ),
            ListTile(
              title: const Text('添加长文'),
              leading: const Icon(Icons.add_box),
              onTap: () {
                Get.back();
                Get.toNamed(Routes.editPage);
              },
            ),
          ],
        ),
      ),
    );
  }
}
