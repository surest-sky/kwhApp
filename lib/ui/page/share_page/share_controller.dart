import 'package:app/base/get/getx_controller_inject.dart';
import 'package:app/model/Params_share_model.dart';
import 'package:app/model/note_item.dart';
import 'package:app/model/share_data_model.dart';
import 'package:app/model/web_model.dart';
import 'package:app/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:app/util/toast_util.dart';

class ShareController extends BaseGetController {
  final EasyRefreshController refreshController = EasyRefreshController(
    controlFinishRefresh: true,
    controlFinishLoad: true,
  );

  var selectItems = <NoteItem>[].obs;
  var shares = <ShareDataModel>[].obs;
  final pageSize = 10;
  var page = 1;
  String shareId = "";

  final TextEditingController formTitleController = TextEditingController(text: "");
  final List<NoteItem> formItems = [];

  String getShareUrl(ShareDataModel item) {
    return "https://kwh-h5.surest.cn/share/${item.shareId}";
  }

  resetForm() {
    shareId = "";
    formTitleController.text = "";
    selectItems.assignAll([]);
  }

  toSharePage(ShareDataModel item) {
    Get.toNamed(
      Routes.webviewPage,
      arguments: WebEntity(title: item.title, link: getShareUrl(item)),
    );
  }

  ParamsShareModel getParams() {
    final List<String> idList = [];
    selectItems.forEach((element) {
      idList.add(element.dataid);
    });
    final ParamsShareModel params = ParamsShareModel.fromJson({
      "title": formTitleController.text,
      "idList": idList.join('|'),
      "view": "public",
      "share_id": shareId,
    });

    return params;
  }

  // 创建分享
  createShare() {
    if(formTitleController.text.isEmpty) {
      ToastUtil.toast("请输入分享名称");
      return;
    }

    final params = getParams();
    request.createShare(params, success: (bool _is) {
      ToastUtil.toast("创建成功");
      Get.back();
      onLoadRefresh();
    });
  }

  // 删除分享
  deleteShare(String shareId) {
    request.deleteShare(shareId, success: (bool _is) {
      ToastUtil.toast("删除成功");
      Get.back();
      onLoadRefresh();
    });
  }

  // 创建分享
  updateShare() {
    if(formTitleController.text.isEmpty) {
      ToastUtil.toast("请输入分享名称");
      return;
    }

    final params = getParams();
    request.updateShare(params, success: (bool _is) {
      ToastUtil.toast("更新成功");
      Get.back();
      onLoadRefresh();
    });
  }

  // 判定加载更多
  onloadMore() {
    page++;
    initList();
  }

  deleted(String dataid) {
    final List<ShareDataModel> _shares = [];
    shares.value.forEach((element) {
      if (element.shareId != dataid) {
        _shares.add(element);
      }
    });

    shares.value = _shares;
    shares.refresh();
  }

  onLoadRefresh() async {
    page = 1;
    initList();
    refreshController.finishRefresh();
  }

  // 初始化列表数据
  initList() {
    request.getShareData({
      "page": page,
      "page_size": pageSize,
    }, success: (List<ShareDataModel> lists) {
      if(page == 1) {
        shares.value = lists;
      }else{
        // 执行渲染逻辑
        shares.value = [...shares.value, ...lists];
      }
      shares.refresh();
      ToastUtil.dismiss();

      if (lists.length < pageSize) {
        refreshController.finishLoad(IndicatorResult.noMore);
      } else {
        refreshController.finishLoad(IndicatorResult.success);
      }

      refreshController.finishRefresh();
    }, fail: (int code, String msg) {
      ToastUtil.toast(msg);
      refreshController.finishRefresh();
    });
  }

  @override
  void onInit() {
    super.onInit();

    initList();
  }
}
