import 'package:app/routes/routes.dart';
import 'package:app/ui/page/splash_page/splash_binding.dart';
import 'package:app/ui/page/splash_page/splash_page.dart';
import 'package:app/util/injection_init.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injection.init();
  EasyLoading.instance.indicatorType = EasyLoadingIndicatorType.ring;
  runApp(
    GetMaterialApp(
      getPages: Routes.routePage,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.homePage,
      builder: EasyLoading.init(),
      defaultTransition: Transition.fade,
      initialBinding: SplashBinding(),
      home: const SplashPage(),
    ),
  );
}
