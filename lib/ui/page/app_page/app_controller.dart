import 'dart:async';

import 'package:app/base/get/getx_controller_inject.dart';
import 'package:app/model/User.dart';
import 'package:app/model/note_item.dart';
import 'package:app/routes/routes.dart';
import 'package:app/ui/page/home_page/home_page.dart';
import 'package:app/ui/page/profile_page/profile_page.dart';
import 'package:app/ui/page/share_page/share_page.dart';
import 'package:app/ui/page/tag_page/tag_page.dart';
import 'package:app/util/save/sp_util.dart';
import 'package:app/util/time_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

class AppController extends BaseGetController {
  int currentIndex = 0;
  late UserEntity user;
  bool isLogin = true;

  late StreamSubscription _intentDataStreamSubscription;
  late List<SharedMediaFile> _sharedFiles;
  late String _sharedText;

  final List<Widget> pages = [
    HomePage(),
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
    if (_user != null) {
      user = _user;
      isLogin = true;
    } else {
      isLogin = false;
    }
    update();
  }


  nowAdd(String? value) {
    if(value == null) {
      return;
    }

    if(value.isEmpty) {
      return;
    }

    TimeUtil.setTimeout(() {
      _intentDataStreamSubscription.cancel();
      final NoteItem item = NoteItem.fromJson({
        "full_text": value
      });
      Get.toNamed(Routes.editPage, arguments: item);
    }, 1000);
  }

  @override
  void onInit() {
    super.onInit();
    initUser();

    _intentDataStreamSubscription =
        ReceiveSharingIntent.getMediaStream().listen(
      (List<SharedMediaFile> value) {
        print("接收到文件");
        print(value);
      },
      onError: (err) {
        print("getIntentDataStream error: $err");
      },
    );

    ReceiveSharingIntent.getInitialMedia().then((List<SharedMediaFile> value) {
      print("接收到文件");
      print(value);
      // nowAdd(value);
    });

    _intentDataStreamSubscription = ReceiveSharingIntent.getTextStream().listen(
      (String value) {
        print("接收到内容");
        print(value);
        nowAdd(value);
      },
      onError: (err) {
        print("getLinkStream error: $err");
      },
    );

    ReceiveSharingIntent.getInitialText().then((String? value) {
      print("接收到内容");
      print(value);
      nowAdd(value);
    });
  }

  @override
  void onClose() {
    super.onClose();
    _intentDataStreamSubscription.cancel();
  }
}
