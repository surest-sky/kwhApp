
class ResponseOssModel {
  ResponseOssModel({
    required this.remark,
    required this.fileName,
    required this.signUrl,
    required this.ossUrl,
    required this.expTime,
    required this.uId,
  });

  ResponseOssModel.fromJson(dynamic json) {
    remark = json['remark'];
    fileName = json['file_name'];
    signUrl = json['sign_url'];
    ossUrl = json['oss_url'];
    expTime = json['exp_time'];
    uId = json['u_id'];
  }

  late String remark;
  late String fileName;
  late String signUrl;
  late String ossUrl;
  late String expTime;
  late String uId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['remark'] = remark;
    map['file_name'] = fileName;
    map['sign_url'] = signUrl;
    map['oss_url'] = ossUrl;
    map['exp_time'] = expTime;
    map['u_id'] = uId;
    return map;
  }
}
