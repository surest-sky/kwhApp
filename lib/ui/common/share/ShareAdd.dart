import 'package:app/model/action_model.dart';
import 'package:app/model/note_item.dart';
import 'package:app/model/share_data_model.dart';
import 'package:app/res/style.dart';
import 'package:app/routes/routes.dart';
import 'package:app/ui/common/note/NoteTitle.dart';
import 'package:app/ui/page/search_page/search_controller.dart';
import 'package:app/ui/page/search_page/search_page.dart';
import 'package:app/ui/page/share_page/share_controller.dart';
import 'package:app/util/widget/CustomWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../FloatModal.dart';
import 'ShareDeleteConfirm.dart';

class ShareAdd extends StatelessWidget {
  late ShareDataModel? item;

  ShareController get controller => Get.find();

  ShareAdd({Key? key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        top: false,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          constraints: const BoxConstraints(
            minHeight: 400,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: const Text(
                      "取消",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const Text(
                    "创建分享",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  CustomWidget.AppButton(
                    child: const Text(
                      "确认",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextField(
                // autofocus: true,
                controller: controller.formTitleController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10),
                  hintText: "请输入分享名称",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              CustomWidget.AppButton(
                child: Row(
                  children: const [
                    Icon(Icons.add, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      "选择分享笔记",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                onTap: () {
                  final SearchController searchController = Get.put(
                    SearchController(),
                  );
                  searchController.isSelectAble = true;
                  searchController.initSelectItems(controller.selectItems);
                  searchController.onSelectComplete = (List<NoteItem> notes) {
                    Get.back();
                    // controller.selectItems.value = notes;
                    // controller.selectItems.refresh();
                  };
                  showBarModalBottomSheet(
                    expand: true,
                    context: context,
                    backgroundColor: Styles.styleBackgroundGray,
                    builder: (context) => Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: const SearchPage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 250,
                child: Obx(
                  () => ListView.builder(
                    itemCount: controller.selectItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          Expanded(
                            child: NoteTitle(
                              item: controller.selectItems[index],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              controller.selectItems.removeAt(index);
                              controller.update();
                            },
                            icon: const Icon(Icons.delete_outline,
                                color: Colors.red,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
