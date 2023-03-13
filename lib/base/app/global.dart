import 'dart:convert';

import 'package:app/model/User.dart';
import 'package:app/util/save/sp_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../http/request_repository.dart';

class GlobalUtil {
  // static String rootUrl = "https://kwh-h5.surest.cn/#";
  static String rootUrl = "https://kwh.dotdotbear.com/#";
  // static String rootUrl = "http://192.168.50.101:3000/#";
  static String editUrl = "$rootUrl/webview/editor";
  static String syncUrl = "$rootUrl/app/sync";
  static bool isLogin = false;
  static UserEntity user = UserEntity.fromJson({});
  static String token = "";
  static String idKey = "";
  static bool isProxy = true;
  static bool isTest = false;
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static WebViewController webviewController =
  WebViewController.fromPlatformCreationParams(
      const PlatformWebViewControllerCreationParams());

  static String getAppAgent () {
    return "kwh-app;$idKey";
  }

  static void initUser() {
    final _user = SpUtil.getUserInfo();
    if(_user != null) {
      user = _user;
      isLogin = true;///
      token = _user.token;
      idKey = _user.idkey;
    }else{
      isLogin = false;
    }
  }

  // 更新本地用户文件
  static void updateUser() {
    Get.find<RequestRepository>().getAccountInfo(GlobalUtil.user.phone, success: (UserEntity user) {
      SpUtil.updateUserInfo(user);
    });
  }

  static void initMockUser() {
   const test_user = '{"avatar":"https://kwh-user-file-dev.oss-cn-shanghai.aliyuncs.com/user_file/4aaf51b4718351ab582b19938dc72da3.png","created_at":"2022-08-07 16:38:46","data_url":"https://kwh-dev.leolan.top/v1/data/16720ha6DdPWts241258","deleted_at":"","email":"","idkey":"16720ha6DdPWts241258","name":"测试峰233","phone":"18270952773","u_id":"mZ1UO61526","vip_data":{"level":"L1","score":100,"vip_expire":-1},"vip_expire":-1,"wxopenid":"","salt":"dpAGYEhN","token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2NzI5MDE5NjUsInN1YiI6IntcInVfaWRcIjogXCJtWjFVTzYxNTI2XCJ9In0.D3ouDOHLvvfhmRT29QZcTAq--yShwcwSkaz-95N48Uo","token_expire":"2023-01-05 06:59:25"}';
   user = UserEntity.fromJson(jsonDecode(test_user));
   token = user.token;
   isLogin = true;
   isTest = true;
  }

  // 初始化编辑器
  static initEditor() {
    webviewController
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..enableZoom(false)
      ..setUserAgent(GlobalUtil.getAppAgent())
      ..setNavigationDelegate(
        NavigationDelegate(),
      )
      ..loadRequest(Uri.parse("${GlobalUtil.rootUrl}/webview/editor"));
  }
}