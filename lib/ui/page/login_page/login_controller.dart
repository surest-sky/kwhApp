import 'dart:ui';
import 'package:app/base/get/getx_controller_inject.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LoginController extends BaseGetController{
  final WebViewController webviewController = WebViewController.fromPlatformCreationParams(const PlatformWebViewControllerCreationParams());
  final String url = "https://kwh-h5.surest.cn/auth/login";

  void initController() {
    webviewController
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..enableZoom(false)
      ..loadRequest(Uri.parse(url));

    update();
  }

  @override
  void onInit() {
    super.onInit();
    initController();
  }
}