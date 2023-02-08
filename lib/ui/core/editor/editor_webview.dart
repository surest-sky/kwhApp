import 'package:app/base/get/get_common_view.dart';
import 'package:app/ui/common/FloatModal.dart';
import 'package:app/ui/common/editor/editor_remark_action.dart';
import 'package:app/ui/common/editor/editor_tag_action.dart';
import 'package:app/ui/common/editor/editor_title_action.dart';
import 'package:app/ui/common/editor/editr_loading.dart';
import 'package:app/util/enum_util.dart';
import 'package:app/util/widget/CustomWidget.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../common/note/NoteEditor.dart';
import 'editor_controller.dart';

class EditorWebview extends GetCommonView<EditorController> {
  late Function()? refresh;
  late EditorMode mode;

  EditorWebview({Key? key, this.refresh, this.mode = EditorMode.create})
      : super(key: key);

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
            Expanded(
                child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.black38, fontSize: 15),
              ),
            )),
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
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 20, color: Colors.black38),
              ),
              onTap: () {
                showFloatingModalBottomSheet(
                  context: context,
                  builder: (context) => const EditorTagAction(),
                );
              },
            ),
            if (controller.dataid.isNotEmpty)
              if (controller.noteItem.type == 'url')
                Column(
                  children: [
                    const Divider(),
                    buildOperateItem(
                      '${controller.noteItem.url}[修改URL]',
                      leading: const Icon(
                        Icons.attachment,
                        size: 15,
                        color: Colors.black38,
                      ),
                      onTap: () {
                        showFloatingModalBottomSheet(
                          context: context,
                          builder: (context) => const EditorTagAction(),
                        );
                      },
                    )
                  ],
                ),
            if (controller.noteItem.type == 'img')
              Column(
                children: [
                  const Divider(),
                  buildOperateItem(
                    '图片..[修改图片]',
                    leading: const Icon(
                      Icons.collections,
                      size: 15,
                      color: Colors.black38,
                    ),
                    onTap: () {
                      showFloatingModalBottomSheet(
                        context: context,
                        builder: (context) => const EditorTagAction(),
                      );
                    },
                  )
                ],
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
      constraints: mode == EditorMode.create ?  const BoxConstraints(
        maxHeight: 500,
      ): null,
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (mode == EditorMode.create)
            Column(
              children: [
                CustomWidget.bottomSheetBar(
                    centerTitle: controller.dataid.isEmpty ? "添加" : "修改",
                    actions: [
                      CustomWidget.AppButton(
                        height: 30,
                        width: 50,
                        child: const Text(
                          "确认",
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          controller.submit(refreshList: refresh);
                        },
                      ),
                    ]),
                const SizedBox(height: 10),
              ],
            ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: controller.loading
                  ? const EditLoading()
                  : WebViewWidget(
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
