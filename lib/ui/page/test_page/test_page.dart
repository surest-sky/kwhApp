import 'package:app/base/get/get_common_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';

import 'search_controller.dart';

class TestPage extends GetCommonView<TestController> {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final HtmlEditorController controller = HtmlEditorController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text"),
      ),
      body: HtmlEditor(
        controller: controller, //required
        htmlToolbarOptions: const HtmlToolbarOptions(
          defaultToolbarButtons: [
            ParagraphButtons(
              alignLeft: false,
              alignCenter: false,
              alignRight: false,
              alignJustify: false,
              increaseIndent: false,
              decreaseIndent: false,
              textDirection: false,
              lineHeight: false,
              caseConverter: false,
            ),
            InsertButtons(
              link: true,
              picture: false,
              audio: false,
              video: false,
              otherFile: false,
              table: false,
              hr: false,
            ),
            ListButtons(
              ul: true,
              ol: true,
              listStyles: false,
            ),
            FontButtons(
              bold: true,
              italic: true,
              underline: true,
              clearAll: true,
              strikethrough: true,
              superscript: true,
              subscript: true,
            )
          ],
          toolbarPosition: ToolbarPosition.belowEditor,
        ),
        htmlEditorOptions: HtmlEditorOptions(
          hint: "Your text here...",
          initialText: "<b>text content initial, if any</b>",
        ),
        otherOptions: OtherOptions(
          height: 200,
        ),
      ),
    );
  }
}
