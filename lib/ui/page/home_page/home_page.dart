import 'package:app/base/get/get_common_view.dart';
import 'package:app/res/style.dart';
import 'package:app/ui/common/note/NoteBlockList.dart';
import 'package:flutter/material.dart';

import 'home_controller.dart';

class HomePage extends GetCommonView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Styles.styleBackgroundGray,
            padding: EdgeInsets.only(top: Styles.styleMediaPTop + 20, left: 20),
            alignment: Alignment.topLeft,
            height: 60 + Styles.styleMediaPTop,
            child: const Text(
              "首页",
              style: TextStyle(fontSize: 30),
            ),
          ),
          Expanded(child: NoteBlockList())
        ],
      ),
    );
  }
}

