import 'package:app/base/get/get_common_view.dart';
import 'package:app/http/request_repository.dart';
import 'package:app/res/r.dart';
import 'package:app/routes/routes.dart';
import 'package:app/ui/page/splash_page/splash_controller.dart';
import 'package:app/util/save/sp_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../model/User.dart';

/// @class : SplashAnimWidget
/// @date : 2021/08/17
/// @name : jhf
/// @description :动画Widget
class SplashAnimWidget extends GetCommonView<SplashController> {
  const SplashAnimWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      onEnd: () {
        if(!controller.isLogin) {
          Get.offNamed(Routes.loginPage);
          return;
        }
        Get.find<RequestRepository>().getAccountInfo(controller.user.phone, success: (UserEntity user) {
          SpUtil.updateUserInfo(user);
          precacheImage(NetworkImage(user.avatar), context);
          Get.offNamed(Routes.appPage);
        });
      },
      opacity: controller.opacityLevel,
      duration: const Duration(milliseconds: 1000),
      child: Container(
        margin: const EdgeInsets.only(top: 120),
        alignment: Alignment.center,
        child: Column(
          children: [
            Image.asset(
              R.assetsImagesApplication,
              fit: BoxFit.fitWidth,
              width: 110,
              height: 110,
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: const Text("斑点熊"),
            ),
          ],
        ),
      ),
    );
  }
}
