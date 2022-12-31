import 'package:app/model/note_item.dart';
import 'package:app/util/time_util.dart';

class ShareDataModel {
  ShareDataModel({
    required this.md5,
    required this.uId,
    required this.createdAt,
    required this.idList,
    required this.remark,
    required this.shareId,
    required this.title,
    required this.updatedAt,
    required this.url,
    required this.view,
    required this.selectItems,
  });

  ShareDataModel.fromJson(dynamic json) {
    md5 = json['md5'];
    uId = json['u_id'];
    createdAt = json['created_at'];
    idList = json['id_list'];
    remark = json['remark'];
    shareId = json['share_id'];
    title = json['title'];
    updatedAt = json['updated_at'];
    url = json['url'];
    view = json['view'];
    final List<NoteItem> tempNotes = [];
    for (var element in (json['list'] as List<dynamic>)) {
      tempNotes.add(NoteItem.fromJson(element));
    }
    selectItems = tempNotes;
  }


  String get uat {
    return TimeUtil.convertFormatDate(updatedAt);
  }

  late String md5;
  late String uId;
  late int createdAt;
  late String idList;
  late String remark;
  late String shareId;
  late String title;
  late int updatedAt;
  late String url;
  late String view;
  late int total;
  late List<NoteItem> selectItems;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['md5'] = md5;
    map['u_id'] = uId;
    map['created_at'] = createdAt;
    map['id_list'] = idList;
    map['remark'] = remark;
    map['share_id'] = shareId;
    map['title'] = title;
    map['updated_at'] = updatedAt;
    map['url'] = url;
    map['view'] = view;
    map['total'] = total;
    return map;
  }
}
