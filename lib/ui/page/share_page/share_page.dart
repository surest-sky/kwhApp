import 'package:app/base/get/get_common_view.dart';
import 'package:app/model/action_model.dart';
import 'package:app/model/share_data_model.dart';
import 'package:app/ui/common/FloatModal.dart';
import 'package:app/ui/common/share/ShareAdd.dart';
import 'package:app/ui/common/share/ShareBlock.dart';
import 'package:app/ui/page/share_page/share_controller.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class SharePage extends GetCommonView<ShareController> {
  const SharePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("我的分享"),
        actions: [
          IconButton(
            onPressed: () {
              controller.resetForm();
              showFloatingModalBottomSheet(
                context: context,
                builder: (context) => ShareAdd(),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Obx(
        () => EasyRefresh(
          controller: controller.refreshController,
          onRefresh: () async => controller.onLoadRefresh(),
          onLoad: () async => controller.onloadMore(),
          child: ListView.builder(
            itemCount: controller.shares.length,
            itemBuilder: (BuildContext context, int index) => Padding(
              padding: const EdgeInsets.all(10),
              child: ShareBlock(
                item: controller.shares[index],
                action: ActionModel(
                  deleted: (dataid) => controller.deleted(dataid),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
