import 'package:app/base/get/getx_controller_inject.dart';
import 'package:app/model/Tags_model.dart';
import 'package:app/model/note_item.dart';
import 'package:app/model/tag_chunk_note_item.dart';
import 'package:app/model/tag_simple_model.dart';
import 'package:app/util/toast_util.dart';
import 'package:date_format/date_format.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';

class TagController extends BaseGetController {
  List<TagSimple> tags = [];
  List<TagChunkNoteItem> lists = [];
  List<NoteItem> tagLists = [];
  int page = 1;
  final EasyRefreshController refreshController = EasyRefreshController(
    controlFinishRefresh: true,
    controlFinishLoad: true,
  );

  // 获取索引 Bar
  getIndexBar() {
    List<String> _sus = [];
    for (int i = 0, length = tags.length; i < length; i++) {
      String tag = tags[i].getSuspensionTag();
      if (!_sus.contains(tag)) {
        _sus.add(tag);
      }
    }
    return _sus;
  }

  // 获取最近收藏
  getLists() {
    request.getIndexData({"page": page, "page_size": 20},
        success: (List<NoteItem> noteLists) {

      final Map<String, List<NoteItem>> chunkList = {};

      for (var element in noteLists) {
        final date =
            formatDate(DateTime.parse(element.uat), [yyyy, '-', mm, '-', dd]);
        if (chunkList.containsKey(date)) {
          chunkList[date]?.add(element);
        } else {
          chunkList[date] = [element];
        }
      }

      chunkList.forEach(
        (key, value) {
          lists.add(
            TagChunkNoteItem(chunkDate: key, notes: value),
          );
        },
      );
      if(noteLists.isEmpty) {
        refreshController.finishLoad(IndicatorResult.noMore);
      }else{
        refreshController.finishLoad(IndicatorResult.success);
      }
      refreshController.finishRefresh();
      update();
    });
  }

  // 刷新
  refreshData() async {
    page = 1;
    initTags();
    getLists();
    ToastUtil.toast("刷新成功");
    refreshController.finishRefresh();
  }

  // 加载更多
  onloadMore() {
    page++;
    getLists();
  }

  // 后去所有的tag
  initTags() async {
    request.getAllTags(success: (TagsModel allTags) {
      tags = [];
      for (var tag in allTags.tagsList) {
        tags.add(TagSimple.fromJson({
          "name": tag,
        }));
      }
      update();
    });
  }

  @override
  void onInit() {
    super.onInit();
    initTags();
    page = 1;
    getLists();
  }
}
