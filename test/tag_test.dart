import 'dart:async';
import 'dart:io';

import 'package:app/base/app/global.dart';
import 'package:app/http/http_request.dart';
import 'package:app/http/request_api.dart';
import 'package:app/http/request_old.dart';
import 'package:app/http/request_repository.dart';
import 'package:app/model/Tags_model.dart';
import 'package:app/model/User.dart';
import 'package:app/model/tag_simple_model.dart';
import 'package:app/util/injection_init.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:lpinyin/lpinyin.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  test('标签列表接口显示', () async {
    await Injection.testingInit();
    final request = Get.find<RequestRepository>();
    request.getAllTags(success: (TagsModel allTags) {
      print("echo");
      expect(true, isFalse);
      // expect(allTags.tagsList.isNotEmpty, true);
    });

    sleep(const Duration(microseconds: 2000));
  });
}
