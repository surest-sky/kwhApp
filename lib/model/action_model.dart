import 'package:app/model/share_data_model.dart';
import 'package:flutter/material.dart';

import 'note_item.dart';

class ActionModel {
  late bool isShow;
  late Function(String) deleted;
  late Widget? selectWidget;
  late Function(List<NoteItem>)? selectComplete;

  ActionModel({required this.deleted, this.isShow = true, this.selectWidget, this.selectComplete});
}
