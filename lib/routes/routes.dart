import 'package:app/ui/page/app_page/app_binding.dart';
import 'package:app/ui/page/app_page/app_page.dart';
import 'package:app/ui/page/login_page/login_binding.dart';
import 'package:app/ui/page/login_page/login_page.dart';
import 'package:app/ui/page/setting_page/password_binding.dart';
import 'package:app/ui/page/setting_page/password_page.dart';
import 'package:app/ui/page/setting_page/setting_binding.dart';
import 'package:app/ui/page/setting_page/setting_page.dart';
import 'package:app/ui/page/setting_page/setting_page.dart';
import 'package:app/ui/page/setting_page/setting_page.dart';
import 'package:app/ui/page/splash_page/splash_binding.dart';
import 'package:app/ui/page/splash_page/splash_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

abstract class Routes {
  // 主页
  static const String appPage = '/app';

  // 登录页
  static const String loginPage = '/login';

  // 个人设置页
  static const String settingPage = '/setting';

  // 密码设置页
  static const String passwordPage = '/password';

  // 密码设置页
  static const String splashPage = '/splash';


  // 页面集合
  static final routePage = [
    GetPage(
      name: appPage,
      page: () => const AppPage(),
      binding: AppBinding(),
    ),
    GetPage(
      name: loginPage,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: settingPage,
      page: () => const SettingPage(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: passwordPage,
      page: () => const PasswordPage(),
      binding: PasswordBinding(),
    ),
    GetPage(
      name: splashPage,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
  ];
}