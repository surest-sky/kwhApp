import 'package:app/base/get/getx_controller_inject.dart';
import 'package:app/model/web_model.dart';
import 'package:app/util/toast_util.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../base/app/global.dart';

/// @class : WebViewController
/// @date : 2021/08/24
/// @name : jhf
/// @description : WebView 控制器层
class WebController extends BaseGetController {
  final WebViewController webviewController =
      WebViewController.fromPlatformCreationParams(
          const PlatformWebViewControllerCreationParams());

  ///加载URL
  WebEntity detail = Get.arguments;

  ///进度条
  var progress = 0.0.obs;

  ///是否点赞
  var isCollect = false.obs;

  ///控制收藏的取消与结束
  var collectAtState = false.obs;

  initWebViewController() {
    webviewController
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..enableZoom(false)
      ..setUserAgent(GlobalUtil.getAppAgent())
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            ToastUtil.showLoading();
          },
          onPageFinished: (String url) {
            ToastUtil.dismiss();
          },
          onProgress: (pro) {
            progress.value = (pro / 100).toDouble();
          }
        ),
      )
      ..loadRequest(Uri.parse(detail.link));
  }

  @override
  void onInit() {
    super.onInit();
    initWebViewController();
  }
}
