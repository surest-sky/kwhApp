import 'dart:async';

import 'package:app/base/get/getx_controller_inject.dart';
import 'package:app/model/note_item.dart';
import 'package:app/model/params_create_noe_model.dart';
import 'package:app/util/time_util.dart';
import 'package:app/util/toast_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditorController extends BaseGetController with WidgetsBindingObserver {
  final TextEditingController inputController = TextEditingController(text: "");
  bool loading = true;
  List<String> tags = [];
  String remark = "";
  String title = "";
  String dataid = "";
  String editorValue = "";
  NoteItem noteItem = NoteItem.fromJson({});
  bool isOpenKeyboard = false;
  late Timer interval;

  // 设置当前选中的标签
  setTags(List<String> _tags) {
    tags = _tags;
    update();
  }

  // 设置当前的备注
  setRemark(String value) {
    remark = value;
    update();
  }

  // 设置当前的标题
  setTitle(String value) {
    title = value;
    update();
  }

  initEditorValue(NoteItem item) {
    title = item.title;
    remark = item.remark;
    tags = item.tags;
    noteItem = item;
    dataid = item.dataid;
    inputController.text = item.fullText;
  }

  submitOssFile(String ossFile) {
    final params = ParamsCreateNoteModel.fromJson({
      "content": ossFile,
      "remark": "",
      "title": "",
    });

    ToastUtil.showLoading(message: "上传中...");
    request.createNote(params, success: (_) {
      ToastUtil.dismiss();
      ToastUtil.toast("创建成功");
      Get.back();
    });
  }

  // 确定提交
  submit({Function()? refreshList}) async {
    var content = inputController.text;

    if (content.isEmpty) {
      ToastUtil.toast("请输入内容");
      return;
    }
    final params = ParamsCreateNoteModel.fromJson({
      "content": content,
      "tags": tags,
      "remark": remark,
      "title": title,
    });
    ToastUtil.showLoading();
    request.createNote(params, success: (_) {
      if (refreshList != null) {
        TimeUtil.setTimeout(() {
          refreshList();
          ToastUtil.dismiss();
          ToastUtil.toast("创建成功");
          Get.back();
        }, 1500);
      } else if (noteItem.dataid.isEmpty) {
        ToastUtil.toast("创建成功");
        Get.back();
      } else {
        ToastUtil.dismiss();
        ToastUtil.toast("修改成功");
      }
    }, fail: (_, String msg) {
      ToastUtil.dismiss();
      ToastUtil.toast(msg);
    });
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
