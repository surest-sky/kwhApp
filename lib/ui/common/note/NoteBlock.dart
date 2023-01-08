import 'package:app/base/app/global.dart';
import 'package:app/model/action_model.dart';
import 'package:app/model/note_item.dart';
import 'package:app/model/web_model.dart';
import 'package:app/routes/routes.dart';
import 'package:app/util/enum_util.dart';
import 'package:app/util/widget/url_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../FloatModal.dart';
import 'NoteAction.dart';

class NoteBlock extends StatelessWidget {
  final NoteItem item;
  late ActionModel action;

  NoteBlock({
    Key? key,
    required this.item,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 操作更多
    void actionSheet(NoteItem item) {
      showFloatingModalBottomSheet(
        context: context,
        builder: (context) => NoteAction(
          item: item,
          action: action,
        ),
      );
    }

    String wellTitle(NoteItem item) {
      final title = item.title.replaceAll('\n', '');
      if (item.type == EnumUtil.ocr) {
        return "[图片] " + title;
      }
      return title;
    }

    return InkWell(
      onTap: () {
        // Get.toNamed(Routes.detailPage, arguments: item.dataid);
        Get.toNamed(
          Routes.webviewPage,
          arguments: WebEntity(title: item.title, link: '${GlobalUtil.rootUrl}/dotdot/${GlobalUtil.user.uId}/${item.dataid}'),
        );
      },
      child: Container(
        height: 150,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        padding: const EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              wellTitle(item),
              textAlign: TextAlign.left,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 10)),
            Text(
              item.uat,
              textAlign: TextAlign.left,
              style: const TextStyle(color: Colors.black45),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 5)),
            if (item.type == EnumUtil.text || item.remark.isEmpty)
              Text(
                item.fullText.replaceAll('\n', ''),
                textAlign: TextAlign.left,
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            if (item.type == EnumUtil.url && item.remark.isNotEmpty)
              Text(
                "备注: " + item.remark.replaceAll('\n', ''),
                textAlign: TextAlign.left,
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 100,
                    child: UrlButton(item: item),
                  ),
                  if (action.isShow)
                    SizedBox(
                      width: 40,
                      child: IconButton(
                        onPressed: () => actionSheet(item),
                        icon: const Icon(Icons.more_horiz),
                      ),
                    ),
                  if (action.selectWidget != null) action.selectWidget!
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
