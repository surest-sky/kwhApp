import 'package:app/ui/page/test_page/search_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class TestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TestController());
  }
}
