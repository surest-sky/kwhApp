import 'package:app/base/get/getx_controller_inject.dart';
import 'package:app/ui/page/home_page/home_page.dart';
import 'package:app/ui/page/profile_page/profile_page.dart';
import 'package:app/ui/page/share_page/share_page.dart';
import 'package:app/ui/page/tag_page/tag_page.dart';
import 'package:flutter/material.dart';

class AppController extends BaseGetController{
  int currentIndex = 0;

  final List<Widget> pages = [
    const HomePage(),
    const SharePage(),
    const TagPage(),
    const ProfilePage(),
  ];

  void setCurrentIndex(int index) {
    currentIndex = index;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }
}