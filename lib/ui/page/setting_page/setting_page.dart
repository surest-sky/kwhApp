import 'dart:ffi';

import 'package:app/base/get/get_common_view.dart';
import 'package:app/res/style.dart';
import 'package:app/routes/routes.dart';
import 'package:app/ui/page/setting_page/avatar_page.dart';
import 'package:app/ui/page/setting_page/key_page.dart';
import 'package:app/util/image_util.dart';
import 'package:app/util/widget/ICard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'setting_controller.dart';

class SettingPage extends GetCommonView<SettingController> {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.styleBackgroundGray,
      appBar: AppBar(
        title: const Text("个人设置"),
      ),
      body: SafeArea(
          top: true,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                ICard.Card(
                  context,
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text("头像"),
                        trailing: const Icon(
                          Icons.navigate_next,
                        ),
                        onTap: () async {
                          final base64 = await ImageUtil.imageSelect();
                          print(base64);
                        },
                      ),
                      ListTile(
                        title: const Text("手机号码"),
                        trailing: const Icon(
                          Icons.navigate_next,
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ICard.Card(
                  context,
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text("Key"),
                        trailing: const Icon(
                          Icons.navigate_next,
                        ),
                        onTap: () {
                          Get.to(const KeyPage());
                        },
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                 SizedBox(
                  width: MediaQuery.of(context).size.width - 20,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.offAllNamed(Routes.loginPage);
                    },
                    child: const Text("退出登录"),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
