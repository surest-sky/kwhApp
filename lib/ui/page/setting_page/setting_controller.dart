import 'package:app/base/app/global.dart';
import 'package:app/base/get/getx_controller_inject.dart';
import 'package:app/ui/page/app_page/app_controller.dart';
import 'package:app/util/time_util.dart';
import 'package:app/util/image_util.dart';
import 'package:get/get.dart';
import '../../../http/request_repository.dart';
import '../../../model/User.dart';
import '../../../util/toast_util.dart';

class SettingController extends BaseGetController{
  final controller = Get.find<RequestRepository>();
  String userAvatar = "";
  String idKey = "";

  void updateAvatar() async {
    final file = await ImageUtil.imageSelectFile();
    if(file == null) {
      ToastUtil.toast("取消选择文件");
      return;
    }

    ToastUtil.showLoading(message: "上传中...");
    var ossUrl = await ImageUtil.uploadImageFile(file);
    if(ossUrl.isEmpty) {
      return;
    }

    ossUrl = "https:$ossUrl";
     UserEntity? _user = await controller.updateAccount({
      "avatar": ossUrl,
      "update_idkey": "no",
    });
    if(_user == null) {
      ToastUtil.toast("异常");
      return;
    }

    ToastUtil.toast("更新成功");
    userAvatar = ossUrl;

    updateUserInfo();
  }

  void updateUserInfo() {
    update();
    GlobalUtil.updateUser();

    TimeUtil.setTimeout(() => Get.find<AppController>().initUser(), 2000);
  }

  void updateIdKey() async {
    UserEntity? _user = await controller.updateAccount({
      "update_idkey": "yes",
    });

    if(_user == null) {
      ToastUtil.toast("异常");
      return;
    }

    ToastUtil.toast("更新成功");
    idKey = _user.idkey;

    update();
    updateUserInfo();
  }

  @override
  void onInit() {
    super.onInit();
    userAvatar = user.avatar;
    idKey = user.idkey;
    update();
  }
}