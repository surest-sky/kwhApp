import 'package:app/base/get/get_common_view.dart';
import 'package:app/res/style.dart';
import 'package:app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'profile_controller.dart';

class ProfilePage extends GetCommonView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.styleBackgroundGray,
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Color(0xffFDCF09),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(controller.app.user.avatar),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    controller.app.user.name,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      const Icon(Icons.smartphone, size: 12,),
                      Text(
                        controller.app.user.phone,
                        style: const TextStyle(fontSize: 13),
                      )
                    ],
                  ),
                ],
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width - 20,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                children:  [
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text("????????????"),
                    trailing: const Icon(
                      Icons.navigate_next,
                    ),
                    onTap: () {
                      Get.toNamed(Routes.settingPage);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.sync),
                    title: const Text("????????????"),
                    onTap: () {
                      Get.toNamed(Routes.syncPage);
                    },
                    trailing: const Icon(
                      Icons.navigate_next,
                    ),
                  ),
                  // ListTile(
                  //   leading: const Icon(Icons.sync),
                  //   title: const Text("Test ??????"),
                  //   onTap: () {
                  //     Get.toNamed(Routes.testPage);
                  //   },
                  //   trailing: const Icon(
                  //     Icons.telegram,
                  //   ),
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
