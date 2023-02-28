import 'dart:convert';
import 'dart:io';

import 'package:app/util/toast_util.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../http/request_oss.dart';
import '../http/request_repository.dart';
import '../model/ResponseOssModel.dart';
import 'common_util.dart';
import 'enum_util.dart';

import 'package:dio/dio.dart' as httpDio;

class ImageUtil {
  static Future<String> imageSelect() async {
    String imagePath = "";
    // final ImagePicker _picker = ImagePicker();
    // final XFile? tempImage =
    //     await _picker.pickImage(source: ImageSource.gallery);
    // if (tempImage != null) {
    //   imagePath = tempImage.path;
    //   var imageFile = File(imagePath);
    //   var imageBytes = await imageFile.readAsBytes();
    //   return base64Encode(imageBytes);
    // }
    return "";
  }

  static Future<File?> imageSelectFile() async {
    String imagePath = "";
    final ImagePicker _picker = ImagePicker();
    final XFile? tempImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (tempImage != null) {
      imagePath = tempImage.path;
      return File(imagePath);
    }
    return null;
  }

  // Oss 上传文件
 static Future<String> uploadImageFile(File imgFile) async {
    final filename = imgFile.path;
    final ext = getFileExtension(filename);
    final type = EnumUtil.contentTypeMap[ext] ?? ext;

    // ToastUtil.showLoading();
    final controller = Get.find<RequestRepository>();
    ResponseOssModel? responseOssModel = await controller.getOssToken(filename, type);
    if(responseOssModel == null) {
      ToastUtil.toast("服务器异常");
      return "";
    }

    final httpDio.Response response = await OssRequest.uploadOssFile(responseOssModel.signUrl, imgFile, type);
    if(response.statusCode != 200) {
      ToastUtil.toast("上传异常");
      return "";
    }

    return responseOssModel.ossUrl;
  }
}
