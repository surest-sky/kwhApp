import 'package:app/base/get/getx_controller_inject.dart';
import 'package:app/util/time_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class PasswordController extends BaseGetController {
  String verifyCodeText = "获取验证码";
  bool isGetVerify = true;
  final TextEditingController passwordController = TextEditingController(text: "");
  final TextEditingController confirmPasswordController = TextEditingController(text: "");

  bool showPassword = false;

  // 获取验证码
  void getVerifyCode () {
    EasyLoading.show();

    Future.delayed(const Duration(milliseconds: 200), () {
      EasyLoading.dismiss();

      int total = 10;
      isGetVerify = false;
      update();
      TimeUtil.setInterval((periodicTime) {
        verifyCodeText = "请稍后重试 ${total}s";
        isGetVerify = false;
        if(total <= 0) {
          periodicTime.cancel();
          verifyCodeText = "获取验证码";
          isGetVerify = true;
        }
        update();
        total --;
      }, 1000);
    });
  }


  // 修改密码
  Future submit() async {
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;
    if(password.isEmpty || confirmPassword.isEmpty) {
      EasyLoading.showToast( "请输入密码");
      return;
    }

    if(password.length < 8 || password.length > 16 || confirmPassword.length < 8 || confirmPassword.length > 16) {
      EasyLoading.showToast("密码格式错误");
      return;
    }

    EasyLoading.show(status: "提交成功");
  }


  void toogleShowPassword() {
    showPassword = !showPassword;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();

    EasyLoading.dismiss();
  }
}
