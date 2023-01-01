import 'package:app/ui/common/controller/editor_action_controller.dart';
import 'package:app/ui/core/editor/editor_controller.dart';
import 'package:app/util/toast_util.dart';
import 'package:app/util/widget/CustomWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditorRemarkAction extends StatelessWidget {
  const EditorRemarkAction({Key? key}) : super(key: key);
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
            CustomWidget.bottomSheetBar(centerTitle: "备注", actions: [
              CustomWidget.AppButton(
                height: 30,
                width: 50,
                child: const Text(
                  "确认",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  final remark = controller.remarkController.text;
                  if(remark.isEmpty) {
                    ToastUtil.toast("请输入备注内容");
                    return;
                  }

                  editorController.setRemark(remark);
                  Get.back();
                },
              ),
            ]),
            const SizedBox(height: 10,),
            Expanded(child: CustomWidget.iTextField(
              controller: controller.remarkController,
              maxLines: 13,
              hintText: "请输入备注内容",
              autofocus: true,
              keyboardType: TextInputType.multiline,
            ),),
          ],
        ),
      ),
    );
  }
}
