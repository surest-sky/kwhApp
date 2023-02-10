import 'dart:convert';
import 'dart:ui';
import 'package:app/base/app/global.dart';
import 'package:app/base/get/getx_controller_inject.dart';
import 'package:app/util/save/sp_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../model/User.dart';
import '../../../res/style.dart';
import '../../../routes/routes.dart';
import '../app_page/app_controller.dart';

class LoginController extends BaseGetController {
  final GlobalKey webViewKey = GlobalKey();
  final WebViewController webviewController =
      WebViewController.fromPlatformCreationParams(
          const PlatformWebViewControllerCreationParams());
  // final String url = "http://192.168.31.219:3000/auth/login";
  final String url = "${GlobalUtil.rootUrl}/auth/login";
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
    android: AndroidInAppWebViewOptions(
      useHybridComposition: true,
    ),
  );

  void setLogin(String user) {
    EasyLoading.showToast("登录成功");
    SpUtil.putUserInfo(UserEntity.fromJson(jsonDecode(user)));
    GlobalUtil.initUser();
    Get.offNamed(Routes.appPage);
  }

  void initController() {
    webviewController
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Styles.styleBackgroundGray)
      ..enableZoom(false)
      ..addJavaScriptChannel(
        "AppLogin",
        onMessageReceived: (JavaScriptMessage message) {
          setLogin(message.message);
        },
      )
      ..setUserAgent(GlobalUtil.getAppAgent())
      ..setNavigationDelegate(NavigationDelegate(onPageStarted: (String url) {
        EasyLoading.show();
      }, onPageFinished: (String url) {
        EasyLoading.dismiss();
      }))
      ..loadRequest(Uri.parse(url));

    update();
  }

  @override
  void onInit() {
    super.onInit();
    initController();
  }
}
