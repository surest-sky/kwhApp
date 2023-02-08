import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class NoteEditor extends StatefulWidget {
  final String? content;
  const NoteEditor({Key? key, this.content}) : super(key: key);

  @override
  State<NoteEditor> createState() => _NoteEditorState();
}

class _NoteEditorState extends State<NoteEditor> {
  @override
  Widget build(BuildContext context) {
    final HtmlEditorController controller = HtmlEditorController();
    return HtmlEditor(
      controller: controller,
      htmlToolbarOptions: const HtmlToolbarOptions(
        toolbarItemHeight: 0,
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
      ),
      htmlEditorOptions: HtmlEditorOptions(
        hint: "请输入...",
        initialText: widget.content,
      ),
    );
  }
}
