import 'package:app/routes/routes.dart';
import 'package:app/ui/common/FloatModal.dart';
import 'package:app/ui/common/mixins/ImageAction.dart';
import 'package:app/ui/core/editor/editor_controller.dart';
import 'package:app/ui/core/editor/editor_webview.dart';
import 'package:app/util/enum_util.dart';
import 'package:app/util/image_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/common_util.dart';
import '../../../util/toast_util.dart';
import 'home_controller.dart';


class HomeAction extends StatelessWidget with ImageAction{
  HomeAction({Key? key}) : super(key: key);
  get controller => Get.find<HomeController>();

  // 验证码文件名称是否合法
  bool validateFile(filename) {
    final ext = getFileExtension(filename);
    if(ext.isEmpty) {
      ToastUtil.toast("文件异常");
      return false;
    }

    final type = EnumUtil.contentTypeMap[ext] ?? ext;
    if(type.isEmpty) {
      ToastUtil.toast("暂时不支持上传 ${ext} 后缀名的文件哦");
      return false;
    }

    return true;
  }

  // 添加一个图片或者文件
  addSelectImg() async {
    final file = await ImageUtil.imageSelectFile();
    if(file == null) {
      return;
    }

    // 检查文件名称是否合法
    if(!validateFile(file.path)) {
      return;
    }

    ToastUtil.showLoading(message: "上传中...");
    final ossUrl = await ImageUtil.uploadImageFile(file);
    if(ossUrl.isEmpty) {
      return;
    }
    final controller = Get.put(EditorController());
    controller.submitOssFile(ossUrl);
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
