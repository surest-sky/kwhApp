import 'package:app/base/get/getx_controller_inject.dart';
import 'package:app/model/note_item.dart';
import 'package:app/model/search_params_model.dart';
import 'package:app/util/toast_util.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchController extends BaseGetController{
  final TextEditingController searchController =
  TextEditingController(text: "");
  final EasyRefreshController refreshController = EasyRefreshController(
    controlFinishRefresh: true,
    controlFinishLoad: true,
  );
  bool isLoading = false;
  var notes = <NoteItem>[].obs;
  final pageSize = 10;
  var page = 1;

  search() async {
    if(searchController.text.isEmpty) {
      ToastUtil.toast("请输入搜索关键词");
      return;
    }
    notes.value = [];
    page = 1;
    initList();
  }

  // 判定加载更多
  onloadMore() {
    page ++;
    initList();
  }

  deleted(String dataid) {
    final List<NoteItem> _notes = [];
    notes.value.forEach((element) {
      if(element.dataid != dataid) {
        _notes.add(element);
      }
    });

    notes.value = _notes;
    notes.refresh();
  }

  // 初始化列表数据
  initList() {
    isLoading = true;
    ToastUtil.showLoading();
    final params = SearchParams(keyword: searchController.text, highlight: false, page: page, pageSize: pageSize);
    request.searchData(params, success: (List<NoteItem> lists) {
      // 执行渲染逻辑
      notes.value = [...notes.value, ...lists];
      notes.refresh();
      ToastUtil.dismiss();

      if (lists.length < pageSize) {
        refreshController.finishLoad(IndicatorResult.noMore);
      }else{
        refreshController.finishLoad(IndicatorResult.success);
      }

      refreshController.finishRefresh();
      isLoading = false;
    });
  }
}