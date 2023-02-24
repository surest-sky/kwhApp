import 'dart:convert';

import 'package:azlistview/azlistview.dart';
import 'package:lpinyin/lpinyin.dart';

class TagSimple extends ISuspensionBean {
  late String name;
   String firstLetter = "";

  TagSimple({
    required this.name
  });

  TagSimple.fromJson(dynamic json) {
    name = json["name"];
    var letter = PinyinHelper.getShortPinyin(name);
    firstLetter = letter.substring(0, 1);
  }

  @override
  String getSuspensionTag() => firstLetter.toLowerCase();

  @override
  String toString() {
    final map = <String, dynamic>{};
    map["name"] = name;
    map["firstLetter"] = firstLetter;
    return jsonEncode(map);
  }
}