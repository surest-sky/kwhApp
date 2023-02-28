
import 'package:app/http/request_api.dart';
import 'package:app/http/response.dart';
import 'package:dio/dio.dart';

import '../base/app/global.dart';
import '../util/toast_util.dart';
import 'dio_util.dart';

/// 连接超时时间
const int _connectTimeout = 2000;

/// 接收超时时间
const int _receiveTimeout = 2000;

/// 发送超时时间
const int _sendTimeout = 2000;


/// 请求时添加cookie
Map<String, dynamic>? _headerToken() {
  Map<String, dynamic> httpHeaders = {
    'token': GlobalUtil.token,
  };
  return httpHeaders;
}

class ApiService {
  static Dio? _dio;

  static Dio getInstance(String? contentType) {
    if (_dio == null) {
      final options = BaseOptions(
        // contentType: contentType,
            // contentType == null ? contentType : Headers.jsonContentType,
        baseUrl: RequestApi.baseurl,
        sendTimeout: _sendTimeout,
        connectTimeout: _connectTimeout,
        receiveTimeout: _receiveTimeout,
      );
      _dio = Dio(options);
      _dio = loadDioProxy(_dio!);
    }
    return _dio!;
  }

  static Future<Response> get(
    String url, {
    required Map<String, dynamic> params,
    String? contentType,
  }) async {
    final dio = getInstance(contentType);
    try {
      Response response = await dio.get(
        url,
        queryParameters: params,
        options: Options(
          headers: _headerToken(),
        ),
      );
      return response;
    } catch (e) {
      ToastUtil.toast("服务错误");
      rethrow;
    }
  }

  static Future<ResponseMap> post(
    String url, {
    required dynamic data,
    String? contentType,
  }) async {
    var dio = getInstance(contentType);
    try {
      Response response = await dio.post(
        url,
        data: data,
        options: Options(
          headers: _headerToken(),
          contentType: contentType,
        ),
      );
      return _response(response.data);
    } catch (e) {
      ToastUtil.toast("服务错误");
      rethrow;
    }
  }

  static ResponseMap _response(Map<String, dynamic> json) {
    try {
      var responseMap = ResponseMap.formJson(json);
      return responseMap;
    } catch (e) {
      ToastUtil.toast("App异常");
      return ResponseMap(403, "Server", {});
    }
  }
}
