import 'package:app/res/r.dart';
import 'package:app/ui/page/splash_page/widget/splash_anim_widget.dart';
import 'package:app/util/screen_util.dart';
import 'package:flutter/material.dart';

/// @class : SplashPage
/// @date : 2021/08/15
/// @name : jhf
/// @description :启动页 View层
class SplashPage extends StatelessWidget {

  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.removeSystemTransparent(context);
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SplashAnimWidget()
    );
  }
}