import 'package:app/base/get/get_common_view.dart';
import 'package:app/model/action_model.dart';
import 'package:app/routes/routes.dart';
import 'package:app/ui/common/FloatModal.dart';
import 'package:app/ui/common/empty/HomeEmpty.dart';
import 'package:app/ui/common/note/NoteBlock.dart';
import 'package:app/ui/page/home_page/home_action.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'home_controller.dart';

class HomePage extends GetCommonView<HomeController> {
  HomePage({super.key}) {
    controller.onLoadRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("首页"),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Get.toNamed(Routes.searchPage);
            },
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              showFloatingModalBottomSheet(
                context: context,
                builder: (context) => HomeAction(),
              );
            },
          ),
        ],
      ),
      body: Obx(
        () => EasyRefresh(
          header: const ClassicHeader(
            dragText: '下拉刷新',
            armedText: '释放刷新',
            readyText: '刷新中',
            processingText: '刷新中',
            processedText: '刷新完成',
            noMoreText: '没有更多了',
            failedText: '网络异常',
            messageText: '上一次更新时间 %T',
          ),
          controller: controller.refreshController,
          onRefresh: () async => controller.onLoadRefresh(),
          onLoad: () async => controller.onloadMore(),
          child: ListView.builder(
            itemCount: controller.notes.isEmpty ? 1 : controller.notes.length,
            itemBuilder: (BuildContext context, int index) {
              if (controller.notes.isEmpty) {
                return const HomeEmpty();
              }
              return Padding(
                padding: const EdgeInsets.all(10),
                child: NoteBlock(
                  item: controller.notes[index],
                  action: ActionModel(
                    deleted: (dataid) => controller.deleted(dataid),
                    onLoadRefresh: () => controller.onLoadRefresh(),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
