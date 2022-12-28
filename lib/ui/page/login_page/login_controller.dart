import 'dart:convert';
import 'dart:ui';
import 'package:app/base/get/getx_controller_inject.dart';
import 'package:app/util/save/sp_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../model/User.dart';
import '../../../routes/routes.dart';
import '../app_page/app_controller.dart';

class LoginController extends BaseGetController {
  final WebViewController webviewController =
      WebViewController.fromPlatformCreationParams(
          const PlatformWebViewControllerCreationParams());
  final String url = "http://192.168.31.219:3000/auth/login";

  void setLogin(String user) {
    EasyLoading.showToast("登录成功");
    SpUtil.putUserInfo(UserEntity.fromJson(jsonDecode(user)));
    initUser();
    Get.toNamed(Routes.appPage);
  }

  void initController() {
    webviewController
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..enableZoom(false)
      ..addJavaScriptChannel(
        "AppLogin",
        onMessageReceived: (JavaScriptMessage message) {
          setLogin(message.message);
        },
      )
      ..setUserAgent("kwh-app")
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
