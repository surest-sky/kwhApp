import 'package:app/res/style.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../note/NoteBlock.dart';
import '../controller/NoteListController.dart';

class NoteBlockList extends StatelessWidget {
  NoteListController get noteListController => Get.find();

  final String? tagName;

  NoteBlockList({super.key, this.tagName}){
    if(tagName != null) {
      noteListController.tagName = tagName!;
    }
    noteListController.reset();
    noteListController.dispatchList();
  }

  Widget buildHeader() {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.only(top: 20, bottom: 30, left: 10),
      child: Text(
        "# $tagName",
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Styles.styleBackgroundGray,
        child: Column(
          children: [
            if (tagName != null) buildHeader(),
            Expanded(
              child: Obx(
                () => EasyRefresh(
                  controller: noteListController.refreshController,
                  onRefresh: () async => noteListController.onLoadRefresh(),
                  onLoad: () async => noteListController.onloadMore(),
                  child: ListView.builder(
                    controller: noteListController.scrollController,
                    itemCount: noteListController.notes.length,
                    itemBuilder: (BuildContext context, int index) => Padding(
                      padding: const EdgeInsets.all(10),
                      child: NoteBlock(item: noteListController.notes[index]),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
