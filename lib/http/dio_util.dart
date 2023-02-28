import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

Dio loadDioProxy(Dio _dio) {
  (_dio?.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      (client) {
    client.findProxy = (uri) {
      // 配置代理服务器地址和端口号
      return 'PROXY 192.168.50.101:8899';
    };
    // 忽略证书验证，避免HTTPS证书验证失败的问题
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
  };
  return _dio;
}
