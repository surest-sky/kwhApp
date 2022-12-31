import 'package:app/base/get/get_common_view.dart';
import 'package:app/model/action_model.dart';
import 'package:app/res/style.dart';
import 'package:app/routes/routes.dart';
import 'package:app/ui/common/note/NoteBlock.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'search_controller.dart';

class SearchPage extends GetCommonView<SearchController> {
  SearchPage({super.key}) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: TextField(
              textInputAction: TextInputAction.search,
              controller: controller.searchController,
              onEditingComplete: controller.search,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    controller.searchController.clear();
                  },
                ),
                hintText: 'Search...',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
      body: Obx(
        () => controller.notes.isEmpty
            ? Center(child: Text(controller.isLoading ? "loading..." : "暂无数据"))
            : EasyRefresh(
                controller: controller.refreshController,
                onRefresh: () async => controller.search(),
                onLoad: () async => controller.onloadMore(),
                child: ListView.builder(
                  itemCount: controller.notes.length,
                  itemBuilder: (BuildContext context, int index) => Padding(
                    padding: const EdgeInsets.all(10),
                    child: NoteBlock(
                      item: controller.notes[index],
                      action:
                          ActionModel((dataid) => controller.deleted(dataid)),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
