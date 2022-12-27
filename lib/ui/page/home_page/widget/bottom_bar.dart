import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomBar {
  static SalomonBottomBar getSalomonBottomBar(int index,
      Function(int) callback) {
    return SalomonBottomBar(
      currentIndex: index,
      onTap: (i) => callback(i),
      items: [
        /// 首页
        SalomonBottomBarItem(
          icon: const Icon(Icons.home),
          title: const Text("首页"),
          selectedColor: Colors.purple,
        ),

        /// 分享页面
        SalomonBottomBarItem(
          icon: const Icon(Icons.share),
          title: const Text("我的分享"),
          selectedColor: Colors.orange,
        ),

        /// 标签页面
        SalomonBottomBarItem(
          icon: Icon(Icons.sell),
          title: const Text("我的标签"),
          selectedColor: Colors.orange,
        ),

        /// 个人中心
        SalomonBottomBarItem(
          icon: const Icon(Icons.person),
          title: const Text("我的"),
          selectedColor: Colors.teal,
        ),
      ],
    );
  }
}