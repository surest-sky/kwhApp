import 'package:app/base/app/global.dart';
import 'package:app/http/request_repository.dart';
import 'package:app/model/User.dart';
import 'package:get/get.dart';

/// @class : BaseGetController
/// @date : 2021/08/26
/// @name : jhf
/// @description :基类 Controller
class BaseGetController extends GetxController {
  UserEntity get user => GlobalUtil.user;

  bool get isLogin => GlobalUtil.isLogin;
  late RequestRepository request;

  @override
  void onInit() {
    Get.lazyPut(() => RequestRepository());
    super.onInit();
    GlobalUtil.initUser();
    request = Get.find<RequestRepository>();
  }
}
