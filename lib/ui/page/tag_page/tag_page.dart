import 'package:app/base/app/global.dart';
import 'package:app/base/get/get_common_view.dart';
import 'package:app/model/note_item.dart';
import 'package:app/model/tag_chunk_note_item.dart';
import 'package:app/model/tag_simple_model.dart';
import 'package:app/model/web_model.dart';
import 'package:app/routes/routes.dart';
import 'package:app/ui/common/empty/TagEmpty.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:app/ui/common/note/NoteTagBlockList.dart';
import 'package:app/util/widget/well_icon.dart';
import 'package:app/util/widget/well_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          // showBarModalBottomSheet(
          //   expand: true,
          //   context: context,
          //   backgroundColor: Colors.white,
          //   builder: (context) => NoteDetail(
          //     item: item,
          //   ),
          // );

          Get.toNamed(
            Routes.webviewPage,
            arguments: WebEntity(
                title: item.title,
                link:
                    '${GlobalUtil.rootUrl}/dotdot/${GlobalUtil.user.uId}/${item.dataid}'),
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
              showBarModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) => NoteTagBlockList(tagName: model.name),
              );
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

    Widget buildTitle(String title) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.black45, fontSize: 18),
          ),
          const SizedBox(height: 10),
        ],
      );
    }

    Widget buildFav() {
      if (controller.lists.isEmpty) {
        return const SizedBox();
      }
      return Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(),
            const SizedBox(height: 20),
            buildTitle("????????????"),
            ...controller.lists.map((e) => noteTagItem(e)).toList(),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("????????????"),
      ),
      body: EasyRefresh(
        header: const ClassicHeader(
          dragText: '????????????',
          armedText: '????????????',
          readyText: '?????????',
          processingText: '?????????',
          processedText: '????????????',
          noMoreText: '???????????????',
          failedText: '????????????',
          messageText: '????????????????????? %T',
        ),
        footer: const ClassicFooter(
          dragText: '??????????????????',
          armedText: '????????????',
          readyText: '?????????',
          processingText: '?????????',
          processedText: '????????????',
          noMoreText: '???????????????',
          failedText: '????????????',
          messageText: '????????????????????? %T',
        ),
        controller: controller.refreshController,
        onRefresh: () async => controller.refreshData(),
        onLoad: () async => controller.onloadMore(),
        child: ListView.builder(
          itemBuilder: (context, int index) {
            if(controller.tags.isEmpty && controller.lists.isEmpty) {
              return const TagEmpty();
            }

            if(index == controller.tags.length) {
              if(controller.lists.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: buildTitle("??????????????????"),
                );
              }else{
                return buildFav();
              }
            }

            return buildListItem(controller.tags[index]);
          },
          itemCount: controller.tags.length + 1,
        ),
      ),
    );
  }
}
