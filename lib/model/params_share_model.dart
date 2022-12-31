class ParamsShareModel {
  ParamsShareModel({
    required this.title,
    required this.idList,
    required this.shareId,
    required this.view,
  });

  ParamsShareModel.fromJson(dynamic json) {
    title = json['title'];
    idList = json['id_list'];
    shareId = json['share_id'] ?? "";
    view = json['view'];
  }

  late String title;
  late String idList;
  late String shareId;
  late String view;

  Map<String, dynamic> toUpdateJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['id_list'] = idList;
    map['share_id'] = shareId;
    map['view'] = view;
    return map;
  }

  Map<String, dynamic> toCreateJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['id_list'] = idList;
    map['view'] = view;
    return map;
  }
}
