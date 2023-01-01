import 'package:app/base/get/getx_controller_inject.dart';
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

  // 确定提交
  submit() async {
   final content =  await webviewController.runJavaScriptReturningResult("getContent()");
   print(content);
   ToastUtil.toast("内容: $content");
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
            update();
          },
        ),
      )
      ..loadRequest(Uri.parse(editUrl));
  }

  @override
  void onInit() {
    super.onInit();

    initEditor();
  }
}
