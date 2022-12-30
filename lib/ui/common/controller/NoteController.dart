import 'package:app/base/get/getx_controller_inject.dart';
import 'package:app/model/note_item.dart';
import 'package:app/util/time_util.dart';
import 'package:app/util/toast_util.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NoteController extends BaseGetController {
  late NoteItem note;
  late String dataId;
  bool isLoaded = false;

  void initNote(String dataId) {
    request.getDataDetail(dataId, success: (NoteItem noteItem) {
      note = noteItem;
      isLoaded = true;
      update();
    });
  }
}