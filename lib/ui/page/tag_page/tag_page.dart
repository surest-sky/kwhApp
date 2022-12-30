import 'package:app/base/get/get_common_view.dart';
import 'package:app/model/note_item.dart';
import 'package:app/model/tag_chunk_note_item.dart';
import 'package:app/model/tag_simple_model.dart';
import 'package:app/ui/common/NoteBlock.dart';
import 'package:app/ui/common/NoteBlockList.dart';
import 'package:app/ui/common/NoteDetail.dart';
import 'package:app/util/toast_util.dart';
import 'package:app/util/widget/well_icon.dart';
import 'package:app/util/widget/well_title.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'tag_controller.dart';

class TagPage extends GetCommonView<TagController> {
  const TagPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildSusWidget(String susTag) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        height: 40,
        width: double.infinity,
        alignment: Alignment.centerLeft,
        child: Row(
          children: <Widget>[
            Text(
              '$susTag',
              textScaleFactor: 1.2,
            ),
            const Expanded(
              child: Divider(
                height: .0,
                indent: 10.0,
              ),
            )
          ],
        ),
      );
    }

    Widget noteItem(NoteItem item) {
      return InkWell(
        onTap: () {
          showBarModalBottomSheet(
            expand: true,
            context: context,
            backgroundColor: Colors.white,
            builder: (context) => NoteDetail(
              item: item,
            ),
          );
        },
        child: SizedBox(
          height: 30,
          child: Row(
            children: [
              WellIcon(item: item),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: WellTitle(item: item),
              )
            ],
          ),
        ),
      );
    }

    Widget buildListItem(TagSimple model) {
      String susTag = model.getSuspensionTag();
      return Column(
        children: <Widget>[
          Offstage(
            offstage: model.isShowSuspension != true,
            child: buildSusWidget(susTag),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue[700],
              child: Text(
                model.name[0],
                style: const TextStyle(color: Colors.white),
              ),
            ),
            title: Text(model.name),
            onTap: () {
              ToastUtil.showLoading();
              controller.getTagsList(model.name, (List<NoteItem> lists) {
                ToastUtil.dismiss();
                showBarModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (context) => NoteBlockList(
                    notes: lists,
                    tagName: model.name,
                  ),
                );
              });
            },
          )
        ],
      );
    }

    Widget noteTagItem(TagChunkNoteItem tagItem) {
      return Container(
        margin: const EdgeInsets.only(top: 15),
        // decoration: BoxDecoration(
        //   border: Border(
        //     bottom: BorderSide(
        //       color: Colors.grey.shade300,
        //       width: 1,
        //       style: BorderStyle.solid,
        //     ),
        //   ),
        // ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(tagItem.chunkDate),
            const SizedBox(
              height: 5,
            ),
            Container(
              color: Colors.grey.shade50,
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: tagItem.notes.map((e) => noteItem(e)).toList(),
              ),
            ),
          ],
        ),
      );
    }

    Widget buildHeader() {
      return Container(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("最近收藏",
                style: TextStyle(color: Colors.black45, fontSize: 18)),
            const SizedBox(height: 10),
            ...controller.lists.map((e) => noteTagItem(e)).toList(),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 20),
            const Text("标签列表",
                style: TextStyle(color: Colors.black45, fontSize: 18)),
            const SizedBox(height: 10),
          ],
        ),
      );
    }

    Widget buildSliverAppBar() {
      return SliverAppBar(
        expandedHeight: 190.0,
        title: const Text("我的标签"),
        elevation: 5,
        pinned: true,
        backgroundColor: Colors.white,
      );
    }

    return Scaffold(
      body: SafeArea(
          top: true,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 20, left: 20),
                alignment: Alignment.topLeft,
                height: 90,
                child: const Text(
                  "我的标签",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Expanded(
                child: RefreshIndicator(
                  key: controller.refreshIndicatorKey,
                  onRefresh: () => controller.refreshData(),
                  child: ListView.builder(
                    itemBuilder: (context, int index) {
                      if (index == 0) {
                        return buildHeader();
                      }
                      return buildListItem(controller.tags[index - 1]);
                    },
                    itemCount: controller.tags.length,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
