import 'package:app/base/get/getx_controller_inject.dart';
import 'package:get/get.dart';

import '../app_page/app_controller.dart';

class ProfileController extends BaseGetController{
  final app = Get.find<AppController>();

  @override
  void onInit() {
    super.onInit();
    print("初始化 profile");
  }
}