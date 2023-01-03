import 'package:app/ui/core/editor/editor_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import 'edit_controller.dart';

class EditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditorController());
    Get.lazyPut(() => EditController());
  }
}
