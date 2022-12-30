import 'dart:convert';

import 'package:app/model/User.dart';
import 'package:app/util/save/sp_util.dart';

class GlobalUtil {
  static bool isLogin = false;
  static UserEntity user = UserEntity.fromJson({});
  static String token = user.token;
  static bool isTest = false;

  static void initUser() {
    final _user = SpUtil.getUserInfo();
    if(_user != null) {
      user = _user;
      isLogin = true;
    }else{
      isLogin = false;
    }
  }

  static void initMockUser() {
   const test_user = '{"avatar":"https://kwh-user-file-dev.oss-cn-shanghai.aliyuncs.com/user_file/4aaf51b4718351ab582b19938dc72da3.png","created_at":"2022-08-07 16:38:46","data_url":"https://kwh-dev.leolan.top/v1/data/16720ha6DdPWts241258","deleted_at":"","email":"","idkey":"16720ha6DdPWts241258","name":"测试峰233","phone":"18270952773","u_id":"mZ1UO61526","vip_data":{"level":"L1","score":100,"vip_expire":-1},"vip_expire":-1,"wxopenid":"","salt":"dpAGYEhN","token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2NzI5MDE5NjUsInN1YiI6IntcInVfaWRcIjogXCJtWjFVTzYxNTI2XCJ9In0.D3ouDOHLvvfhmRT29QZcTAq--yShwcwSkaz-95N48Uo","token_expire":"2023-01-05 06:59:25"}';
   user = UserEntity.fromJson(jsonDecode(test_user));
   token = user.token;
   isLogin = true;
   isTest = true;
  }
}