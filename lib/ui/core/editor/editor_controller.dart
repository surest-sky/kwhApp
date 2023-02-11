import 'dart:async';
import 'dart:io';
import 'package:app/base/app/global.dart';
import 'package:app/base/get/getx_controller_inject.dart';
import 'package:app/model/note_item.dart';
import 'package:app/model/params_create_noe_model.dart';
import 'package:app/util/time_util.dart';
import 'package:app/util/toast_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class EditorController extends BaseGetController with WidgetsBindingObserver {
  final GlobalKey webViewKey = GlobalKey();

  final TextEditingController inputController = TextEditingController(text: "");
  late InAppWebViewController webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
    android: AndroidInAppWebViewOptions(
      useHybridComposition: true,
    ),
    crossPlatform: InAppWebViewOptions(
      supportZoom: false,
    ),
  );

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
    if (loading == false) {
      webViewController.evaluateJavascript(
          source: "setContent('${noteItem.fullText}')");
    }
  }

  // 确定提交
  submit({Function()? refreshList}) async {
    var content =
        (await webViewController.evaluateJavascript(source: "getContent()"))
            .toString();
    content = content.substring(1);
    content = content.substring(0, content.length - 1);
    print(content);
    print("contentcontentcontentcontent");

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

  // 初始化编辑器
  initEditor() async {
    // TimeUtil.setInterval ((periodicTime) {
    //   interval = periodicTime;
    //   BuildContext? context = GlobalUtil.navigatorKey.currentContext;
    //   if(context != null) {
    //     if (MediaQuery.of(context).viewInsets.bottom == 0) {
    //       if( isOpenKeyboard ) {
    //         isOpenKeyboard  = false;
    //         update();
    //       }
    //
    //
    //     } else {
    //       if(!isOpenKeyboard ) {
    //         isOpenKeyboard  = true;
    //         update();
    //       }
    //     }
    //   }
    // }, 500);
  }

  @override
  void onInit() {
    super.onInit();
    initEditor();
  }

  @override
  void onClose() {
    super.onClose();
    // try{
    //   interval.cancel();
    // } catch(_) {}
  }
}
