import 'package:app/base/get/get_common_view.dart';
import 'package:app/model/action_model.dart';
import 'package:app/model/note_item.dart';
import 'package:app/ui/common/note/NoteBlock.dart';
import 'package:app/util/widget/CustomWidget.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'search_controller.dart';

class SearchPage extends GetCommonView<SearchController> {
  const SearchPage({super.key});

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
              autofocus: true,
              textInputAction: TextInputAction.search,
              controller: controller.searchController,
              onEditingComplete: controller.search,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(right: 10, top: 5),
                prefixIcon: const Icon(Icons.search),
                suffixIcon: AnimatedOpacity(
                  curve: Curves.ease,
                  opacity: 1.0,
                  duration: const Duration(milliseconds: 500),
                  child: CustomWidget.AppButton(
                    child: const Text(
                      "确认",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    onTap: () {
                      controller.onSelectComplete(controller.selectItems);
                    },
                  ),
                ),
                hintText: 'Search...',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        automaticallyImplyLeading: !controller.isSelectAble,
      ),
      body: Obx(
        () => controller.notes.isEmpty
            ? Center(
                child: Text(controller.isLoading ? "loading..." : "暂无搜索结果"))
            : EasyRefresh(
                controller: controller.refreshController,
                onRefresh: () async => controller.search(),
                onLoad: () async => controller.onloadMore(),
                child: ListView.builder(
                  itemCount: controller.notes.length,
                  itemBuilder: (BuildContext context, int index) {
                    final NoteItem item = controller.notes[index];
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: NoteBlock(
                        item: item,
                        action: ActionModel(
                          deleted: (dataid) => controller.deleted(dataid),
                          isShow: !controller.isSelectAble,
                          selectWidget: Checkbox(
                            fillColor:
                                MaterialStateProperty.all(Colors.blueAccent),
                            value: controller.selectIds.contains(item.dataid),
                            onChanged: (bool? isChecked) =>
                                controller.onToggleChecked(
                              item,
                            ),
                          ),
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
