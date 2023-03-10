import 'package:app/res/style.dart';
import 'package:app/ui/page/setting_page/setting_controller.dart';
import 'package:app/util/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../base/get/get_common_view.dart';

class KeyPage  extends GetCommonView<SettingController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.styleBackgroundGray,
      appBar: AppBar(
        title: const Text("Key设置"),
        actions: [
          IconButton(onPressed: (){
            controller.updateIdKey();
          }, icon: const Icon(Icons.refresh))
        ],
      ),
      body: AppContainer(
        child: Column(
          children: [
            const SizedBox(height: 20),

            const Text(
              "请注意，请不要泄露您的key到其他地方，当被泄露后，可以从此位置, 点击右上角进行重置",
              style: TextStyle(fontSize: 15, color: Colors.black54),
            ),
            const SizedBox(height: 10),

            Row(
              children:  [
                Text(
                  "key: ${controller.idKey}",
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
            const SizedBox(height: 20),

            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("复制"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
