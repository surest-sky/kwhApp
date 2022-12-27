import 'package:app/ui/page/login_page/login_controller.dart';
import 'package:get/get.dart';
import 'tag_controller.dart';

class TagBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TagController());
  }
}
