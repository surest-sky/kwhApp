import 'package:app/base/get/get_common_view.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'tag_controller.dart';

class TagPage extends GetCommonView<TagController> {
  const TagPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: const Text("标签"),
      )
    );
  }
}
