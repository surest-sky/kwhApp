import 'package:app/ui/common/controller/NoteController.dart';
import 'package:app/ui/page/home_page/home_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class NoteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NoteController());
  }
}
