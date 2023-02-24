import 'package:app/ui/page/setting_page/password_controller.dart';
import 'package:get/get.dart';

class PasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PasswordController());
  }
}
