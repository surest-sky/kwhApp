import 'package:app/base/get/get_common_view.dart';
import 'package:app/ui/common/controller/NoteController.dart';
import 'package:app/ui/common/note/NoteBlock.dart';
import 'package:app/ui/common/note/NoteDetail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotePage extends GetCommonView<NoteController> {
  NotePage({super.key}) {
    controller.dataId = Get.arguments as String;
    controller.initNote(controller.dataId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("详情"),
      ),
      body: SafeArea(
        top: true,
        child: controller.isLoaded
            ? NoteDetail(item: controller.note)
            : const Center(child: Text("Loading")),
      ),
    );
  }
}
