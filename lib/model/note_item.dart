import 'package:app/util/enum_util.dart';
import 'package:date_format/date_format.dart';

class NoteItem {
  NoteItem({
    required this.dataid,
    required this.uId,
    required this.md5,
    required this.paas,
    required this.url,
    required this.tags,
    required this.noteType,
    required this.title,
    required this.fullText,
    required this.remark,
    required this.updatedAt,
    this.errorMsg,
  });

  NoteItem.fromJson(dynamic json) {
    final String _dataid = json['dataid'] ?? "";
    dataid = _dataid.toString();
    uId = json['u_id'] ?? "";
    md5 = json['md5'] ?? "";
    paas = json['paas'] ?? "";
    url = json['url'] ?? "";
    noteType = json['type'] ?? "";
    final List<String> _tags = [];
    ((json['tags'] ?? []) as List<dynamic>).forEach((element) {
      _tags.add(element as String);
    });
    tags = _tags;
    title = json['title'] ?? "";
    fullText = json['full_text'] ?? "";
    remark = json['remark'] ?? "";
    updatedAt = json['updated_at'] ?? 0;
    errorMsg = json['errorMsg'] ?? "";
  }

  late String dataid;
  late String uId;
  late String md5;
  late String paas;
  late String url;
  late String noteType;
  late String title;
  late String fullText;
  late int updatedAt;
  late String remark;
  late List<String> tags;
  String? errorMsg;

  String get uat {
    return _convertFormatDate(updatedAt);
  }

  String get type {
    return EnumUtil.getNoteType(noteType);
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dataid'] = dataid;
    map['u_id'] = uId;
    map['md5'] = md5;
    map['paas'] = paas;
    map['url'] = url;
    map['type'] = type;
    map['remark'] = remark;
    map['title'] = title;
    map['tags'] = tags.isEmpty ? "" : tags.join(',');
    map['full_text'] = fullText;
    map['updated_at'] = updatedAt;
    return map;
  }

  String _convertFormatDate(int _date) {
    final _dt = DateTime.fromMillisecondsSinceEpoch(_date * 1000);
    return formatDate(_dt, [yyyy, '-', mm, '-', dd]);
  }
}
