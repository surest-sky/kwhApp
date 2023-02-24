import 'package:app/model/action_model.dart';
import 'package:app/model/share_data_model.dart';
import 'package:app/ui/page/share_page/share_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../FloatModal.dart';
import 'ShareAction.dart';

class ShareBlock extends StatelessWidget {
  final ShareDataModel item;
  late ActionModel action;
  ShareController get controller => Get.find();

  ShareBlock({
    Key? key,
    required this.item,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 操作更多
    void actionSheet(ShareDataModel item) {
      showFloatingModalBottomSheet(
        context: context,
        builder: (context) => ShareAction(
          item: item,
          action: action,
        ),
      );
    }

    String wellTitle(ShareDataModel item) {
      return item.title;
    }

    Widget wellSecondary(String text) {
      return Text(
        text,
        textAlign: TextAlign.left,
        style: const TextStyle(color: Colors.black45),
      );
    }

    return InkWell(
      onTap: () {
        controller.toSharePage(item);
      },
      child: Container(
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
            wellSecondary("创建时间: ${item.uat}"),
            const Padding(padding: EdgeInsets.only(bottom: 5)),
            wellSecondary("分享数: ${item.selectItems.length}"),
            const Padding(padding: EdgeInsets.only(bottom: 5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    wellSecondary("分享链接:"),
                    const InkWell(
                      child: Text(
                        "查看更多...",
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                    )
                  ],
                ),
                if(action.isShow)
                  IconButton(
                    onPressed: () => actionSheet(item),
                    icon: const Icon(Icons.more_horiz),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}
