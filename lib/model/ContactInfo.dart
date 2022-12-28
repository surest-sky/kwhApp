import 'dart:convert';
import 'dart:ui';

import 'package:azlistview/azlistview.dart';
import 'package:flutter/cupertino.dart';

class ContactInfo extends ISuspensionBean {
  String name;
  String tagIndex;
  String? namePinyin;

  Color? bgColor;
  IconData? iconData;

  String? img;
  String? id;
  String? firstletter;

  ContactInfo({
    required this.name,
    required this.tagIndex,
    this.namePinyin,
    this.bgColor,
    this.iconData,
    this.img,
    this.id,
    this.firstletter,
  });

  ContactInfo.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        img = json['img'],
        tagIndex = json['tagIndex'] ?? "222",
        id = json['id']?.toString(),
        firstletter = json['firstletter'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'img': img,
      };

  @override
  String getSuspensionTag() => tagIndex;

  @override
  String toString() => json.encode(this);
}
