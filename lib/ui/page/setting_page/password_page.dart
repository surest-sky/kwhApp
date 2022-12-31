import 'package:app/base/get/get_common_view.dart';
import 'package:app/res/style.dart';
import 'package:app/ui/page/setting_page/password_controller.dart';
import 'package:app/util/theme/app_theme.dart';
import 'package:app/util/widget/CustomWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class PasswordPage extends GetCommonView<PasswordController> {
  const PasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.styleBackgroundGray,
      appBar: AppBar(
        title: const Text("密码设置"),
      ),
      body: AppContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              "密码规则: 8-16位, 不要包含特殊字符",
              style: TextStyle(fontSize: 15, color: Colors.black54),
            ),
            const Divider(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(controller.user.phone),
                ElevatedButton(
                  onPressed:
                      controller.isGetVerify ? controller.getVerifyCode : null,
                  child: Text(controller.verifyCodeText),
                  style: controller.isGetVerify ? ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green)) : null,
                )
              ],
            ),
            const SizedBox(height: 10),
            TextField(
              obscureText: controller.showPassword,
              controller: controller.passwordController,
              decoration: InputDecoration(
                hintText: "请输入密码",
                border: const OutlineInputBorder(),
                contentPadding: const EdgeInsets.only(right: 10, left: 10),
                suffix: GestureDetector(
                  onTap: controller.toogleShowPassword,
                  child: Icon(
                    Icons.remove_red_eye,
                    size: 20,
                    color: controller.showPassword ? Colors.red : Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              obscureText: controller.showPassword,
              controller: controller.confirmPasswordController,
              decoration: InputDecoration(
                hintText: "请再次输入密码",
                border: const OutlineInputBorder(),
                contentPadding: const EdgeInsets.only(right: 10, left: 10),
                suffix: GestureDetector(
                  onTap: controller.toogleShowPassword,
                  child: Icon(
                    Icons.remove_red_eye,
                    size: 20,
                    color: controller.showPassword ? Colors.red : Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            CustomWidget.AppButton(
              onTap: () => controller.submit(),
              child: const Text("确认修改", style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}
