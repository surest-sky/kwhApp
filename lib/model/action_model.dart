import 'package:flutter/material.dart';

import 'note_item.dart';

class ActionModel {
  late bool isShow;
  late Function(String) deleted;
  late Function()? onLoadRefresh;
  late Widget? selectWidget;
  late Function(List<NoteItem>)? selectComplete;

  ActionModel({required this.deleted, this.isShow = true, this.selectWidget, this.selectComplete, this.onLoadRefresh});
}
