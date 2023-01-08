import 'package:app/base/app/global.dart';
import 'package:app/base/get/getx_controller_inject.dart';
import 'package:app/model/note_item.dart';
import 'package:app/model/params_create_noe_model.dart';
import 'package:app/util/time_util.dart';
import 'package:app/util/toast_util.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EditorController extends BaseGetController {
  // final editUrl = "https://kwh-h5.surest.cn/webview/editor";
  final editUrl = "http://192.168.31.219:3000/webview/editor";
  final WebViewController webviewController =
  WebViewController.fromPlatformCreationParams(
      const PlatformWebViewControllerCreationParams());

   bool loading = true;
  List<String> tags = [];
  String remark = "";
  String title = "";
  String dataid = "";
  String editorValue = "";
  NoteItem noteItem = NoteItem.fromJson({});

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
    if(loading == false) {
      print("noteItem.fullText");
      webviewController.runJavaScript("setContent('${noteItem.fullText}')");
    }
  }

  // 确定提交
  submit({Function()? refreshList}) async {
    var content = (await webviewController.runJavaScriptReturningResult(
        "getContent()")).toString();
    content = content.substring(1);
    content = content.substring(0, content.length - 1);
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
      }else{
        ToastUtil.dismiss();
        ToastUtil.toast("修改成功");
      }
    }, fail: (_, String msg) {
      ToastUtil.dismiss();
      ToastUtil.toast(msg);
    });
  }

  // 初始化编辑器
  initEditor() {
    webviewController
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..enableZoom(false)
      ..setUserAgent("kwh-app")
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            loading = false;
            if(dataid.isNotEmpty) {
              print("noteItem.fullTextnoteItem.fullTextnoteItem.fullTextnoteItem.fullText");
              print(noteItem.fullText);
              webviewController.runJavaScript("setContent(`${noteItem.fullText}`)");
            }
            update();
          },
        ),
      )
      ..loadRequest(Uri.parse(GlobalUtil.editUrl));
  }

  @override
  void onInit() {
    super.onInit();

    initEditor();
  }
}
