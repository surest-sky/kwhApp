class TagsModel {
  TagsModel({
    required this.tagsList,
    required this.uId,
    required this.tagNum,
    required this.dataList,
  });

  TagsModel.fromJson(dynamic json) {
    tagsList =
        json['tags_list'] != null ? json['tags_list'].cast<String>() : [];
    uId = json['u_id'] ?? '';
    tagNum = json['tag_num'] ?? 0;
    dataList = [];
  }

  late List<String> tagsList;
  late String uId;
  late int tagNum;
  late List<dynamic> dataList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tags_list'] = tagsList;
    map['u_id'] = uId;
    map['tag_num'] = tagNum;
    if (dataList != null) {
      map['data_list'] = dataList.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
