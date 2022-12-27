import 'package:app/ui/page/home_page/home_binding.dart';
import 'package:app/ui/page/login_page/login_binding.dart';
import 'package:app/ui/page/login_page/login_page.dart';
import 'package:app/ui/page/setting_page/setting_binding.dart';
import 'package:app/ui/page/setting_page/setting_page.dart';
import 'package:app/ui/page/setting_page/setting_page.dart';
import 'package:app/ui/page/setting_page/setting_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../ui/page/home_page/home_page.dart';

abstract class Routes {
  // 主页
  static const String homePage = '/home';

  // 登录页
  static const String loginPage = '/login';

  // 个人设置页
  static const String settingPage = '/setting';


  // 页面集合
  static final routePage = [
    GetPage(
      name: homePage,
      page: () => const HomePage(),
      binding: HomeBinding(),
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
    )
  ];
}