import 'package:app/ui/page/login_page/login_controller.dart';
import 'package:get/get.dart';
import 'setting_controller.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingController());
  }
}
