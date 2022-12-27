import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Injection {
  static Future<void> init() async {
    await Get.putAsync(() => SharedPreferences.getInstance());
  }
}