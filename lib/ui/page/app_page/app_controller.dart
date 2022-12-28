import 'package:app/base/get/getx_controller_inject.dart';
import 'package:app/model/User.dart';
import 'package:app/ui/page/home_page/home_page.dart';
import 'package:app/ui/page/profile_page/profile_page.dart';
import 'package:app/ui/page/share_page/share_page.dart';
import 'package:app/ui/page/tag_page/tag_page.dart';
import 'package:app/util/save/sp_util.dart';
import 'package:flutter/material.dart';

class AppController extends BaseGetController{
  int currentIndex = 0;
  late UserEntity user;
  bool isLogin = true;

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

  void initUser() {
    final _user = SpUtil.getUserInfo();
    if(_user != null) {
      user = _user;
      isLogin = true;
    }else{
      isLogin = false;
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    initUser();
  }
}