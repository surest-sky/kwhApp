import 'dart:convert';

import 'package:app/base/app/global.dart';
import 'package:app/model/User.dart';
import 'package:app/util/save/sp_key.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpUtil {

  ///删除存储用户信息
  static deleteUserInfo() {
    Get.find<SharedPreferences>().remove(SPKey.keyUserInfo);
  }

  static updateUserInfo(UserEntity user) {
    user.token = GlobalUtil.token;
    putUserInfo(user);
  }

  // 写入登录用户信息
  static putUserInfo(UserEntity userInfo) {
    SharedPreferences sp = Get.find<SharedPreferences>();
    sp.setString(SPKey.keyUserInfo, jsonEncode(userInfo.toJson()));
  }

  // 读取用户信息
  static UserEntity? getUserInfo() {
    SharedPreferences sp = Get.find<SharedPreferences>();

    try {
      var json = sp.getString(SPKey.keyUserInfo);
      if (json == null) {
        return null;
      } else {
        return UserEntity.fromJson(jsonDecode(json));
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
