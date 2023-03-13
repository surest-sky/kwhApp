import 'dart:convert';

import 'package:app/base/app/global.dart';
import 'package:app/base/get/getx_controller_inject.dart';
import 'package:app/http/request_repository.dart';
import 'package:app/ui/core/editor/editor_controller.dart';
import 'package:app/util/save/sp_util.dart';
import 'package:app/util/time_util.dart';
import 'package:app/util/toast_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../model/User.dart';
import '../../../res/style.dart';
import '../../../routes/routes.dart';
import '../../../util/enum_util.dart';

class LoginController extends BaseGetController {
  final GlobalKey webViewKey = GlobalKey();
  TextEditingController phoneController = TextEditingController(text: "");
  final WebViewController webviewController =
      WebViewController.fromPlatformCreationParams(
          const PlatformWebViewControllerCreationParams());

  // final String url = "http://192.168.31.219:3000/auth/login";
  final String url = "${GlobalUtil.rootUrl}/auth/login";

  bool getCodeLoading = false;
  String verifyCodeText = "";
  int total = 60;

  void setLogin(String user) {
    EasyLoading.showToast("登录成功");
    SpUtil.putUserInfo(UserEntity.fromJson(jsonDecode(user)));
    GlobalUtil.initUser();
    Get.offNamed(Routes.appPage);
  }

  bool isChinaPhoneNumber(String phoneNumber) {
    final regExp = RegExp(r'^1\d{10}$');
    return regExp.hasMatch(phoneNumber);
  }

  // 开始登录
  Future login(String code) async {
    final user = await request
        .submitLogin(phoneController.text, code);
    if(user == null) {
      return false;
    }
    SpUtil.putUserInfo(user);
    GlobalUtil.initUser();
    Get.offNamed(Routes.appPage);
  }

  // 设置 发送验证码的 按钮问题
  setVerifyCodeDisable() {
    TimeUtil.setInterval((periodicTime) {
      verifyCodeText = "请稍后重试 ${total}s";
      getCodeLoading = true;
      if(total <= 0) {
        periodicTime.cancel();
        verifyCodeText = "获取验证码";
        getCodeLoading = false;
      }
      update();
      total --;
    }, 1000);
  }

  Future<bool> getCode() async {
    final phone = phoneController.text;
    // 验证码号码是否为手机号码
    if(phone.isEmpty) {
      ToastUtil.toast("请输入手机号码");
      return false;
    }

    if(!isChinaPhoneNumber(phone)) {
      ToastUtil.toast("手机号码格式不正确");
      return false;
    }

    getCodeLoading = true;
    update();

    return await request
        .getVerifyCode(EnumUtil.VERIFY_CODE_LOGIN, phoneController.text)
        .whenComplete(() => {getCodeLoading = true, update()});
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
  }
}
