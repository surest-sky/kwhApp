import 'package:app/base/app/g_controller.dart';
import 'package:app/base/app/global.dart';
import 'package:app/http/request_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Injection {
  static Future<void> init() async {
    await Get.putAsync(() => SharedPreferences.getInstance());
    Get.lazyPut(() => GController());
    Get.lazyPut(() => RequestRepository());
    GlobalUtil.initUser();
  }

  static Future<void> testingInit() async {
    SharedPreferences.setMockInitialValues({});

    await init();

    GlobalUtil.initMockUser();
  }
}