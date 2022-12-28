import 'package:app/model/User.dart';
import 'package:app/util/save/sp_util.dart';
import 'package:get/get.dart';

/// @class : BaseGetController
/// @date : 2021/08/26
/// @name : jhf
/// @description :基类 Controller
class BaseGetController extends GetxController{
  late UserEntity user;
  bool isLogin = false;

  void initUser() {
    final _user = SpUtil.getUserInfo();
    if(_user != null) {
      user = _user;
      isLogin = true;
    }else{
      isLogin = false;
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    initUser();
  }
}

