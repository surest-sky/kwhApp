import 'package:app/base/app/global.dart';
import 'package:app/routes/routes.dart';
import 'package:app/util/injection_init.dart';
import 'package:app/util/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injection.init();
  EasyLoading.instance.indicatorType = EasyLoadingIndicatorType.ring;
  runApp(
    GetMaterialApp(
      navigatorKey: GlobalUtil.navigatorKey,
      getPages: Routes.routePage,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashPage,
      builder: EasyLoading.init(),
      theme: appThemeData,
      defaultTransition: Transition.fade,
      // home: const SplashPage(),
    ),
  );
}
