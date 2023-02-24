import 'package:app/base/app/global.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ToastUtil {
  static void toast(String message) {
    if(GlobalUtil.isTest) {
      print("toast: $message");
    }else{
      EasyLoading.showToast(message);
    }
  }

  static void dismiss() {
    if(GlobalUtil.isTest) {
      print("dismiss");
    }else{
      EasyLoading.dismiss();
    }
  }

  static void showLoading({String? message}) {
    if(GlobalUtil.isTest) {
      print("showLoading :$message");
    }else{
      EasyLoading.show(status: message);
    }
  }
}