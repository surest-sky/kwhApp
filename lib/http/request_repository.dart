import 'dart:io';

import 'package:app/base/app/global.dart';
import 'package:app/http/request.dart';
import 'package:app/http/request_api.dart';
import 'package:app/http/request_core.dart';
import 'package:app/http/request_old.dart';
import 'package:app/model/Params_share_model.dart';
import 'package:app/model/Tags_model.dart';
import 'package:app/model/User.dart';
import 'package:app/model/note_item.dart';
import 'package:app/model/params_create_noe_model.dart';
import 'package:app/model/search_params_model.dart';
import 'package:app/model/share_data_model.dart';
import 'package:app/util/toast_util.dart';
import 'package:dio/dio.dart';

import '../model/ResponseOssModel.dart';
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

  getIndexData(
    params, {
    Success<List<NoteItem>>? success,
    Fail? fail,
  }) {
    Request.post<dynamic>(RequestApi.getIndexData, params, success: (data) {
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
    params, {
    Success<List<NoteItem>>? success,
    Fail? fail,
  }) {
    Request.post<dynamic>(RequestApi.getTagslist, params, success: (data) {
      if (success != null) {
        final List<NoteItem> lists = [];
        final dataList =
            (data as Map<String, dynamic>)["data_list"] as List<dynamic>;
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

  // 获取笔记详情
  getDataDetail(
    String dataId, {
    Success<NoteItem>? success,
    Fail? fail,
  }) {
    final url = RequestApi.getDetail + dataId;
    Request.get<dynamic>(url, {}, success: (data) {
      if (success != null) {
        final NoteItem note = NoteItem.fromJson(data);
        success(note);
      }
    }, fail: (code, msg) {
      if (fail != null) {
        fail(code, msg);
      }
    });
  }

  // 获取笔记详情
  deleteNote(
    String dataId, {
    Success<bool>? success,
    Fail? fail,
  }) {
    Request.post<dynamic>(RequestApi.deleteNote, {"dataid": dataId},
        success: (data) {
      if (success != null) {
        success(true);
      }
    }, fail: (code, msg) {
      if (fail != null) {
        fail(code, msg);
      }
    });
  }

  // 笔记搜索
  searchData(
    SearchParams params, {
    Success<List<NoteItem>>? success,
    Fail? fail,
  }) {
    Request.post<dynamic>(RequestApi.searchData, params.toJson(),
        success: (data) {
      if (success != null) {
        final List<NoteItem> notes = [];
        (data as List<dynamic>).forEach((element) {
          notes.add(NoteItem.fromJson(element));
        });
        success(notes);
      }
    }, fail: (code, msg) {
      if (fail != null) {
        fail(code, msg);
      }
    });
  }

  // 笔记搜索
  getShareData(
    params, {
    Success<List<ShareDataModel>>? success,
    Fail? fail,
  }) {
    Request.post<dynamic>(RequestApi.shareData, params, success: (data) {
      if (success != null) {
        final List<ShareDataModel> shares = [];
        (data as List<dynamic>).forEach((element) {
          shares.add(ShareDataModel.fromJson(element));
        });
        success(shares);
      }
    }, fail: (code, msg) {
      if (fail != null) {
        fail(code, msg);
      }
    });
  }

  // 笔记搜索
  createShare(
    ParamsShareModel params, {
    Success<bool>? success,
    Fail? fail,
  }) {
    Request.post<dynamic>(RequestApi.createShare, params.toCreateJson(),
        success: (data) {
      if (success != null) {
        success(true);
      }
    }, fail: (code, msg) {
      if (fail != null) {
        fail(code, msg);
      }
    });
  }

  // 分享更新
  updateShare(
    ParamsShareModel params, {
    Success<bool>? success,
    Fail? fail,
  }) {
    Request.post<dynamic>(RequestApi.updateShare, params.toUpdateJson(),
        success: (data) {
      if (success != null) {
        success(true);
      }
    }, fail: (code, msg) {
      if (fail != null) {
        fail(code, msg);
      }
    });
  }

  // 分享更新
  deleteShare(
    String shareId, {
    Success<bool>? success,
    Fail? fail,
  }) {
    Request.post<dynamic>(RequestApi.deleteShare, {"share_id": shareId},
        success: (data) {
      if (success != null) {
        success(true);
      }
    }, fail: (code, msg) {
      if (fail != null) {
        fail(code, msg);
      }
    });
  }

  // 笔记搜索
  createNote(
    ParamsCreateNoteModel params, {
    Success<bool>? success,
    Fail? fail,
  }) {
    Request.post<dynamic>(RequestApi.createNote, params.toJson(),
        success: (data) {
      if (success != null) {
        success(true);
      }
    }, fail: (code, msg) {
      if (fail != null) {
        fail(code, msg);
      }
    });
  }

  // 笔记搜索
  uploadOss(
    base64Img, {
    Success<bool>? success,
    Fail? fail,
  }) {
    FormData formData = FormData.fromMap({
      "base64_str": base64Img,
    });
    Request.post<dynamic>(
      RequestApi.uploadOss,
      formData,
      success: (data) {
        if (success != null) {
          success(data);
        }
      },
      fail: (code, msg) {
        if (fail != null) {
          fail(code, msg);
        }
      },
    );
  }

  // 笔记搜索
  uploadOssFile(
    File file, {
    Success<bool>? success,
    Fail? fail,
  }) {
    // 先获取 Token
    FormData formData = FormData.fromMap({
      "file": file,
    });
    Request.post<dynamic>(
      RequestApi.uploadOss,
      formData,
      success: (data) {
        if (success != null) {
          success(data);
        }
      },
      fail: (code, msg) {
        if (fail != null) {
          fail(code, msg);
        }
      },
    );
  }

  getAllTagsOld({
    Success<TagsModel>? success,
    Fail? fail,
  }) {
    RequestOld.post(RequestApi.getAllTags, {});
  }

  // 笔记搜索
  Future<ResponseOssModel?> getOssToken(
    String fileName,
    String contentType,
  ) async {
    // 先获取 Token
    FormData formData = FormData.fromMap({
      "file_name": fileName,
      "file_type": contentType,
    });

    final responseMap =
        await ApiService.post(RequestApi.getOssToken, data: formData);
    if (responseMap.code == 200) {
      return ResponseOssModel.fromJson(responseMap.data);
    }
    ToastUtil.toast("获取oss Token失败");
    return null;
  }

  // 文件上传
  Future<ResponseOssModel?> uploadLocalOssFile(
    File file,
    String contentType,
  ) async {
    FormData formData = FormData.fromMap({
      "file": file.readAsBytesSync(),
    });

    final responseMap = await ApiService.post(
      RequestApi.uploadOss,
      data: formData,
      contentType: contentType,
    );
    if (responseMap.code == 200) {
      return ResponseOssModel.fromJson(responseMap.data);
    }
    ToastUtil.toast("获取oss Token失败");
    return null;
  }

  // 更新用户资料
  Future<UserEntity?> updateAccount(Map<String, String> mData ) async {
    mData['phone'] = GlobalUtil.user.phone;
    mData['idkey'] = GlobalUtil.user.idkey;
    final responseMap = await ApiService.post(
      RequestApi.updateAccount,
      data: mData,
      contentType: Headers.jsonContentType,
    );
    if (responseMap.code == 200) {
      return UserEntity.fromJson(responseMap.data);
    }
    ToastUtil.toast("操作失败");
    return null;
  }

  // 获取验证码
  Future<bool> getVerifyCode(String action, String phone ) async {

    final responseMap = await ApiService.post(
      RequestApi.getVerifyCode,
      data: {
        "action": action,
        "channel": 'phone',
        "phone": phone
      },
      contentType: Headers.jsonContentType,
    );
    if (responseMap.code == 200) {
      return true;
    }
    ToastUtil.toast(responseMap.message);
    return false;
  }

  // 登录
  Future<UserEntity?> submitLogin(String phone, String code ) async {
    final responseMap = await ApiService.post(
      RequestApi.login,
      data: {
        "phone": phone,
        "verifyCode": code,
      },
      contentType: Headers.jsonContentType,
    );
    if (responseMap.code == 200) {
      return UserEntity.fromJson(responseMap.data);
    }
    ToastUtil.toast(responseMap.message);
    return null;
  }
}
