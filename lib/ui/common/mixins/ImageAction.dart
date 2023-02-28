import 'dart:convert';
import 'dart:io';

import 'package:app/http/request_oss.dart';
import 'package:app/http/request_repository.dart';
import 'package:app/model/ResponseOssModel.dart';
import 'package:app/util/common_util.dart';
import 'package:app/util/enum_util.dart';
import 'package:app/util/toast_util.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


mixin ImageAction {
  late final String _imagePath;
  late final String _imgBase64;

  imageSelect({
    required Function(String _path, String _base64) complete,
  }) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? _tempImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (_tempImage != null) {
      _imagePath = _tempImage.path;
      var _imageFile = File(_imagePath);
      var imageBytes = await _imageFile.readAsBytes();
      _imgBase64 = base64Encode(imageBytes);
      complete(_imgBase64, _imagePath);
    }
  }

  Future<String> uploadImage(imgBase64) async {
    ToastUtil.showLoading();
    final controller = Get.find<RequestRepository>();
    final map = await controller.uploadOss(imgBase64);
    if (map.code != 200) {
      ToastUtil.toast("服务器响应超时");
      return "";
    }

    return map.data['oss_url'];
  }

  getImagePath() {
    return _imagePath;
  }

  getImgBase64() {
    return _imgBase64;
  }
}
