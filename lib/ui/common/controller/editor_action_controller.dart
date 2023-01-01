import 'package:app/base/get/getx_controller_inject.dart';
import 'package:app/model/Tags_model.dart';
import 'package:app/util/toast_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditorActionController extends BaseGetController {
  final TextEditingController tagController = TextEditingController(text: "");
  final TextEditingController remarkController = TextEditingController(text: "");
  final TextEditingController titleController = TextEditingController(text: "");
  var tags = <String>[].obs;
  var selectTags = <String>[].obs;

  // 获取所有的tag
  initTags() async {
    request.getAllTags(success: (TagsModel allTags) {
      tags.value = [];
      for (var tag in allTags.tagsList) {
        tags.add(tag);
      }
      tags.refresh();
    });
  }

  addTag(String value) {
    if(value.isEmpty) {
      ToastUtil.toast("请输入标签名称");
      return;
    }
    if(tags.value.contains(value)) {
      ToastUtil.toast("这个标签已添加过了");
      return;
    }

    tags.value.add(value);
    tags.refresh();
    ToastUtil.toast("添加成功");
  }

  toggleSelectTag(String tag) {
    if(selectTags.value.contains(tag)) {
      selectTags.value.remove(tag);
    }else{
      selectTags.value.add(tag);
    }
    selectTags.refresh();
  }


  @override
  void onInit() {
    super.onInit();
    initTags();
  }
}