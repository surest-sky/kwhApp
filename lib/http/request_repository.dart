import 'dart:io';

import 'package:app/http/request.dart';
import 'package:app/http/request_api.dart';
import 'package:app/http/request_old.dart';
import 'package:app/model/Tags_model.dart';
import 'package:app/model/User.dart';
import 'package:app/model/note_item.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../base/app/global.dart';
import 'http_request.dart';

typedef SuccessOver<T> = Function(T data, bool over);

/// @class : RequestRepository
/// @date : 2021/08/25
/// @name : jhf
/// @description : 请求仓库
class RequestRepository {
  /// 获取用户信息
  /// [phone] 手机号码
  /// [success] 请求成功回调
  /// [fail] 请求失败回调
  getAccountInfo(
    String phone, {
    Success<UserEntity>? success,
    Fail? fail,
  }) {
    Request.post<dynamic>(RequestApi.getAccountInfo, {
      "phone": phone,
      "action": "get",
    }, success: (data) {
      if (success != null) {
        success(UserEntity.fromJson(data));
      }
    }, fail: (code, msg) {
      if (fail != null) {
        fail(code, msg);
      }
    });
  }

  getAllTags({
    Success<TagsModel>? success,
    Fail? fail,
  }) {
    Request.post<dynamic>(RequestApi.getAllTags, {}, success: (data) {
      if (success != null) {
        success(TagsModel.fromJson(data));
      }
    }, fail: (code, msg) {
      if (fail != null) {
        fail(code, msg);
      }
    });
  }

  getIndexData({
    Success<List<NoteItem>>? success,
    Fail? fail,
  }) {
    Request.post<dynamic>(RequestApi.getIndexData, {}, success: (data) {
      if (success != null) {
        final List<NoteItem> result = [];
        final listResult = data as List<dynamic>;
        for (var element in listResult) {
          result.add(NoteItem.fromJson(element));
        }
        success(result);
      }
    }, fail: (code, msg) {
      if (fail != null) {
        fail(code, msg);
      }
    });
  }

  getTagslist(
    String tag, {
    Success<List<NoteItem>>? success,
    Fail? fail,
  }) {
    final params = {
      "tag": tag
    };
    Request.post<dynamic>(RequestApi.getTagslist, params,
        success: (data) {
      if (success != null) {
        final List<NoteItem> lists= [];
        final dataList = (data as Map<String, dynamic>)["data_list"] as List<dynamic>;
        for (var element in dataList) {
          final data = NoteItem.fromJson(element["tag_data"]);
          lists.add(data);
        }
        success(lists);
      }
    }, fail: (code, msg) {
      if (fail != null) {
        fail(code, msg);
      }
    });
  }

  getAllTagsOld({
    Success<TagsModel>? success,
    Fail? fail,
  }) {
    RequestOld.post(RequestApi.getAllTags, {});
  }
}
