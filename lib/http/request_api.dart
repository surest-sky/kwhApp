
/// @class : RequestApi
/// @name : jhf
/// @description :请求接口管理
class RequestApi{

  ///前缀地址
  static const String baseurl = 'https://kwh.leolan.top/v1/';
  // static const String baseurl = 'https://kwh-dev.leolan.top/v1/';

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

  // 搜索文章
  static const String searchData = 'data/search_data';

  // 我的分享
  static const String shareData = 'share/get_all_share_info';

  // 更新分享
  static const String updateShare = 'share/update_share_data';

  // 创建分享
  static const String createShare = 'share/create_share';

  // 删除分享
  static const String deleteShare = 'share/delete_share';

  // 创建笔记
  static const String createNote = 'data/submit_req';

  // 上传到 OSS
  static const String uploadOss = '/upload_file_to_oss';

  // 获取 OSS Token
  static const String getOssToken = '/get_oss_sts_token';

  // 更新用户账户
  static const String updateAccount = '/user/update_account';

  // 获取验证码
  static const String getVerifyCode = '/send_verification_code';

  // 登录
  static const String login = '/login';
}


