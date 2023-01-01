import 'package:app/base/get/get_common_view.dart';
import 'package:app/ui/common/FloatModal.dart';
import 'package:app/ui/common/editor/editor_remark_action.dart';
import 'package:app/ui/common/editor/editor_tag_action.dart';
import 'package:app/ui/common/editor/editor_title_action.dart';
import 'package:app/ui/common/editor/editr_loading.dart';
import 'package:app/util/widget/CustomWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'editor_controller.dart';

class EditorWebview extends GetCommonView<EditorController> {
  const EditorWebview({Key? key}) : super(key: key);

  Widget buildOperateItem(String title,
      {required Widget leading, Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            leading,
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(color: Colors.black38, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOperateItems(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            buildOperateItem(
              controller.title.isEmpty ? "添加标题" : controller.title,
              leading: const Icon(
                Icons.type_specimen,
                size: 15,
                color: Colors.black38,
              ),
              onTap: () {
                showFloatingModalBottomSheet(
                  context: context,
                  builder: (context) => const EditorTitleAction(),
                );
              },
            ),
            const Divider(),
            buildOperateItem(
              controller.remark.isEmpty ? "添加备注" : controller.remark,
              leading: const Icon(
                Icons.assignment,
                size: 15,
                color: Colors.black38,
              ),
              onTap: () {
                showFloatingModalBottomSheet(
                  context: context,
                  builder: (context) => const EditorRemarkAction(),
                );
              },
            ),
            const Divider(),
            buildOperateItem(
              controller.tags.isEmpty ? "添加标签" : controller.tags.join(","),
              leading: const Text(
                "#",
                style: TextStyle(fontSize: 20, color: Colors.black38),
              ),
              onTap: () {
                showFloatingModalBottomSheet(
                  context: context,
                  builder: (context) => const EditorTagAction(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      constraints: const BoxConstraints(
        maxHeight: 500,
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomWidget.bottomSheetBar(centerTitle: "添加", actions: [
            CustomWidget.AppButton(
              height: 30,
              width: 50,
              child: const Text(
                "确认",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                controller.submit();
              },
            ),
          ]),
          const SizedBox(height: 10),
          Expanded(
            child: controller.loading
                ? const EditLoading()
                : Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: WebViewWidget(
                      controller: controller.webviewController,
                    ),
                  ),
          ),
          const SizedBox(height: 10),
          buildOperateItems(context),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
