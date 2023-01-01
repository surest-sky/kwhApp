import 'package:app/ui/common/controller/editor_action_controller.dart';
import 'package:app/ui/core/editor/editor_controller.dart';
import 'package:app/util/toast_util.dart';
import 'package:app/util/widget/CustomWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditorTitleAction extends StatelessWidget {
  const EditorTitleAction({Key? key}) : super(key: key);
  EditorController get editorController => Get.find();
  EditorActionController get controller => Get.put(EditorActionController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CustomWidget.bottomSheetBar(centerTitle: "标题设置", actions: [
              CustomWidget.AppButton(
                height: 30,
                width: 50,
                child: const Text(
                  "确认",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  final title = controller.titleController.text;

                  editorController.setTitle(title);
                  Get.back();
                },
              ),
            ]),
            const SizedBox(height: 10,),
            Expanded(child: CustomWidget.iTextField(
              controller: controller.titleController,
              maxLines: 1,
              hintText: "请输入标题[可选]",
              autofocus: true,
              keyboardType: TextInputType.multiline,
            ),),
          ],
        ),
      ),
    );
  }
}
