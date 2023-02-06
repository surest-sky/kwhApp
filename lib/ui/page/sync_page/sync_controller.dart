import 'package:app/base/app/global.dart';
import 'package:app/base/get/getx_controller_inject.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SyncController extends BaseGetController {
  bool loading = true;
  final WebViewController webviewController =
      WebViewController.fromPlatformCreationParams(
          const PlatformWebViewControllerCreationParams());

  initSync() {
    webviewController
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..enableZoom(false)
      ..setUserAgent(GlobalUtil.getAppAgent())
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            loading = false;
            update();
          },
        ),
      )
      ..loadRequest(Uri.parse(GlobalUtil.syncUrl));
  }

  addSync() {
    webviewController.runJavaScript("AppAddSync()");
  }

  @override
  void onInit() {
    super.onInit();
    initSync();
  }
}
