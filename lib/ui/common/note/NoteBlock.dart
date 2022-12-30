import 'package:app/model/action_model.dart';
import 'package:app/model/note_item.dart';
import 'package:app/routes/routes.dart';
import 'package:app/ui/common/note/NoteDetail.dart';
import 'package:app/util/enum_util.dart';
import 'package:app/util/widget/url_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../FloatModal.dart';
import 'NoteAction.dart';
import 'NoteDeleteConfirm.dart';

class NoteBlock extends StatelessWidget {
  final NoteItem item;
  late ActionModel action;

  NoteBlock({
    Key? key,
    required this.item,
    required this.action,
  }) : super(key: key);

  Widget _itemAction(String text, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text(text)],
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget buildItem(String title, {Function()? onTap, bool isCancel = false}) {
      return InkWell(
        onTap: () {
          Navigator.of(context).pop();
          if (onTap != null) {
            onTap();
          }
        },
        child: Container(
          constraints: const BoxConstraints(minHeight: 50),
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: Colors.grey.shade100, width: isCancel ? 0 : 1)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 16),
              )
            ],
          ),
        ),
      );
    }

    void showButtonSheet() {
      showBarModalBottomSheet(
        expand: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => NoteDetail(
          item: item,
        ),
      );
    }

    // 操作更多
    void actionSheet(NoteItem item) {
      showFloatingModalBottomSheet(
        context: context,
        builder: (context) =>  NoteAction(item: item, action: action,),
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
        Get.toNamed(Routes.detailPage, arguments: item.dataid);
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
                  SizedBox(
                    width: 40,
                    child: IconButton(
                      onPressed: () => actionSheet(item),
                      icon: const Icon(Icons.more_horiz),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
