import 'package:app/ui/page/home_page/home_controller.dart';
import 'package:app/ui/page/profile_page/profile_controller.dart';
import 'package:app/ui/page/tag_page/tag_controller.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => TagController());
  }
}
