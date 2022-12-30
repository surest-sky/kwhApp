import 'package:app/base/get/get_common_view.dart';
import 'package:app/model/action_model.dart';
import 'package:app/res/style.dart';
import 'package:app/ui/common/note/NoteBlock.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'home_controller.dart';

class HomePage extends GetCommonView<HomeController> {
  HomePage({super.key}) {
    controller.onLoadRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Styles.styleBackgroundGray,
            padding: EdgeInsets.only(top: Styles.styleMediaPTop + 20, left: 20),
            alignment: Alignment.topLeft,
            height: 60 + Styles.styleMediaPTop,
            child: const Text(
              "首页",
              style: TextStyle(fontSize: 30),
            ),
          ),
          Expanded(
            child: Container(
              color: Styles.styleBackgroundGray,
              child: Obx(
                () => EasyRefresh(
                  controller: controller.refreshController,
                  onRefresh: () async => controller.onLoadRefresh(),
                  onLoad: () async => controller.onloadMore(),
                  child: ListView.builder(
                    itemCount: controller.notes.length,
                    itemBuilder: (BuildContext context, int index) => Padding(
                      padding: const EdgeInsets.all(10),
                      child: NoteBlock(item: controller.notes[index], action: ActionModel((dataid) => controller.deleted(dataid)),),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
