import 'package:app/ui/page/sync_page/sync_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class SyncBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SyncController());
  }
}
