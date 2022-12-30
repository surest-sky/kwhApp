
/// @class : RequestApi
/// @name : jhf
/// @description :请求接口管理
class RequestApi{

  ///前缀地址
  static const String baseurl = 'https://kwh-dev.leolan.top/v1/';

  // 获取用户信息接口
  static const String getAccountInfo = 'user/get_account_info';

  // 获取用户标签接口
  static const String getAllTags = 'tags/get_user_all_tags';

  // 获取文章列表
  static const String getIndexData = 'data/get_index_data';

  // 获取标签列表数据
  static const String getTagslist = 'tags/search_tag';

  // 获取文章详情
  static const String getDetail = 'data/show_one_data/';

  // 移除文章
  static const String deleteNote = 'data/del_one_data';
}


