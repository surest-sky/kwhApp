import 'package:app/base/get/get_common_view.dart';
import 'package:app/ui/core/editor/editor_webview.dart';
import 'package:app/ui/page/edit_page/edit_controller.dart';
import 'package:app/util/enum_util.dart';
import 'package:app/util/widget/CustomWidget.dart';
import 'package:flutter/material.dart';

class EditPage extends GetCommonView<EditController> {
  EditPage({super.key}) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomWidget.iAppBar(title: "编辑", actions: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: CustomWidget.AppButton(
            child: const Text("确认"),
            onTap: () => controller.editorController.submit(),
            width: 50,
          ),
        ),
      ]),
      body: EditorWebview(mode: EditorMode.edit),
    );
  }
}
