import 'dart:io';

import 'package:app/http/dio_util.dart';
import 'package:dio/dio.dart';

class OssRequest {
  // Oss 上传
  static Future<Response> uploadOssFile(
    String url,
    File file,
    String mimeType,
  ) async {
    var dio = Dio(BaseOptions(contentType: mimeType));
    var data = Stream.fromIterable([file.readAsBytesSync().toList()]);
    dio = loadDioProxy(dio);
    return await dio.put(
      url,
      data: data,
      options: Options(
        contentType: mimeType,
      )
    );
  }
}
