import 'package:app/base/get/get_common_view.dart';
import 'package:app/routes/routes.dart';
import 'package:app/ui/page/home_page/home_controller.dart';
import 'package:app/ui/page/home_page/widget/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends GetCommonView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

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

