import 'package:app/ui/page/app_page/app_binding.dart';
import 'package:app/ui/page/app_page/app_page.dart';
import 'package:app/ui/page/edit_page/edit_binding.dart';
import 'package:app/ui/page/edit_page/edit_page.dart';
import 'package:app/ui/page/login_page/login_binding.dart';
import 'package:app/ui/page/login_page/login_page.dart';
import 'package:app/ui/page/note_page/note_binding.dart';
import 'package:app/ui/page/note_page/note_page.dart';
import 'package:app/ui/page/search_page/search_binding.dart';
import 'package:app/ui/page/search_page/search_page.dart';
import 'package:app/ui/page/setting_page/password_binding.dart';
import 'package:app/ui/page/setting_page/password_page.dart';
import 'package:app/ui/page/setting_page/setting_binding.dart';
import 'package:app/ui/page/setting_page/setting_page.dart';
import 'package:app/ui/page/splash_page/splash_binding.dart';
import 'package:app/ui/page/splash_page/splash_page.dart';
import 'package:app/ui/page/tag_page/tag_binding.dart';
import 'package:app/ui/page/webview_page/webview_binding.dart';
import 'package:app/ui/page/webview_page/webview_page.dart';
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

  // 内容详情页
  static const String detailPage = '/detail';

  // 搜索页
  static const String searchPage = '/search';

  // webview
  static const String webviewPage = '/webview';

  // editPage
  static const String editPage = '/editor';


  // 页面集合
  static final routePage = [
    GetPage(
      name: appPage,
      page: () => const AppPage(),
      bindings: [AppBinding(), TagBinding()],
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
      name: detailPage,
      page: () => NotePage(),
      binding: NoteBinding(),
    ),
    GetPage(
      name: splashPage,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: searchPage,
      page: () => SearchPage(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: webviewPage,
      page: () => const WebViewPage(),
      binding: WebViewBinding(),
    ),
    GetPage(
      name: editPage,
      page: () => EditPage(),
      binding: EditBinding(),
    ),
  ];
}