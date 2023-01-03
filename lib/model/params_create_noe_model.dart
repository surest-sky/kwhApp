class ParamsCreateNoteModel {
  ParamsCreateNoteModel({
    required this.content,
    required this.tags,
    required this.title,
    required this.remark,
  });

  ParamsCreateNoteModel.fromJson(dynamic json) {
    content = json['content'];
    tags = json['tags'] ?? [];
    title = json['title'] ?? "";
    remark = json['remark'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['content'] = content;
    map['tags'] = tags;
    map['title'] = title;
    map['remark'] = remark;
    return map;
  }

  late String content;
  late List<String> tags;
  late String title;
  late String remark;
}
