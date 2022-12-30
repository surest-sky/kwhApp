import 'package:app/base/get/get_common_view.dart';
import 'package:app/ui/page/app_page/widget/bottom_bar.dart';
import 'package:flutter/material.dart';

import '../../../util/screen_util.dart';
import 'app_controller.dart';

class AppPage extends GetCommonView<AppController> {
  const AppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: BottomBar.getSalomonBottomBar(controller.currentIndex, controller.setCurrentIndex),
      body: IndexedStack(
        index: controller.currentIndex,
        children: controller.pages,
      ),
    );
  }
}

