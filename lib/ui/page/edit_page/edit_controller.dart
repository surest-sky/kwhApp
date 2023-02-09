import 'package:app/base/get/getx_controller_inject.dart';
import 'package:app/model/note_item.dart';
import 'package:app/ui/core/editor/editor_controller.dart';
import 'package:get/get.dart';

class EditController extends BaseGetController {
  late NoteItem noteItem;
  EditorController get editorController  => Get.find();
  String get title  => editorController.dataid.isNotEmpty ? '编辑' : '新增';

  @override
  void onInit() {
    super.onInit();

    noteItem = Get.arguments as NoteItem;
    print("noteItem333");
    print(noteItem.fullText);
    editorController.initEditorValue(noteItem);
  }
}