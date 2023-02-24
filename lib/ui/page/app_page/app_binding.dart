import 'package:app/ui/page/home_page/home_controller.dart';
import 'package:app/ui/page/profile_page/profile_controller.dart';
import 'package:app/ui/page/share_page/share_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import 'app_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShareController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => AppController());
  }
}
