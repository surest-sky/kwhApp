import 'package:app/base/get/get_common_view.dart';
import 'package:app/res/r.dart';
import 'package:app/res/style.dart';
import 'package:app/routes/routes.dart';
import 'package:app/ui/page/setting_page/key_page.dart';
import 'package:app/util/image_util.dart';
import 'package:app/util/save/sp_util.dart';
import 'package:app/util/widget/ICard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                        title: Row(
                          children:  [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage:
                              NetworkImage(controller.user.avatar),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text("头像"),
                          ],
                        ),
                        trailing: const Icon(
                          Icons.navigate_next,
                        ),
                        onTap: () async {
                          final base64 = await ImageUtil.imageSelect();
                        },
                      ),
                      ListTile(
                        title: const Text("手机号码"),
                        subtitle: Text(controller.user.phone),
                        trailing: const Icon(
                          Icons.navigate_next,
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        title: const Text("修改密码"),
                        trailing: const Icon(
                          Icons.navigate_next,
                        ),
                        onTap: () {
                          Get.toNamed(Routes.passwordPage);
                        },
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
                InkWell(
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width - 20,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent, width: 1),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: const Text(
                      "退出登录",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  onTap: () {
                    SpUtil.deleteUserInfo();
                    Get.offAllNamed(Routes.loginPage);
                  },
                ),
              ],
            ),
          )),
    );
  }
}
