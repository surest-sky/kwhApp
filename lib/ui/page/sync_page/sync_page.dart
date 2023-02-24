import 'package:app/base/get/get_common_view.dart';
import 'package:app/ui/common/loading/NoteLoading.dart';
import 'package:app/ui/page/sync_page/sync_controller.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SyncPage extends GetCommonView<SyncController> {
  const SyncPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "同步设置",
          maxLines: 1,
          softWrap: true,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        toolbarHeight: 50,
        actions: [
          IconButton(
            onPressed: controller.addSync,
            icon: const Icon(
              Icons.add,
              size: 20,
            ),
          ),
          const SizedBox(width: 10)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: WebViewWidget(
                controller: controller.webviewController,
              ),
      ),
    );
  }
}
