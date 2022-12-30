import 'package:app/base/get/getx_controller_inject.dart';
import 'package:app/model/note_item.dart';
import 'package:app/util/time_util.dart';
import 'package:app/util/toast_util.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

enum mode {
  tag,
  list,
}

class NoteTagListController extends BaseGetController {
  final EasyRefreshController refreshController = EasyRefreshController(
    controlFinishRefresh: true,
    controlFinishLoad: true,
  );
  String tagName = "";
  var notes = <NoteItem>[].obs;
  final pageSize = 10;
  var page = 1;

  reset() {
    notes.value = [];
    page = 1;
  }

  deleted(String dataid) {
    final List<NoteItem> _notes = [];
    notes.value.forEach((element) {
      if (element.dataid != dataid) {
        _notes.add(element);
      }
    });

    notes.value = _notes;
    notes.refresh();
  }

  // 判定加载更多
  onloadMore() {
    page++;
    initTagList();
  }

  onLoadRefresh() {
    page = 1;
    initTagList();
  }

  // 获取标签对应的列表数据
  initTagList() {
    ToastUtil.showLoading();
    request.getTagslist({
      "tag": tagName,
      "page": page,
      "page_size": pageSize,
    }, success: (List<NoteItem> lists) {
      // 执行渲染逻辑
      notes.value = [...notes.value, ...lists];
      notes.refresh();
      ToastUtil.dismiss();

      if (lists.length < pageSize) {
        refreshController.finishLoad(IndicatorResult.noMore);
      } else {
        refreshController.finishLoad(IndicatorResult.success);
      }

      refreshController.finishRefresh();
    });
  }
}
