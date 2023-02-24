import 'package:app/base/get/get_common_view.dart';
import 'package:app/res/colors.dart';
import 'package:app/ui/common/FloatModal.dart';
import 'package:app/ui/page/webview_page/webview_action.dart';
import 'package:app/ui/page/webview_page/webview_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// @class : WebViewPage
/// @date : 2021/08/24
/// @name : jhf
/// @description :WebView View层
class WebViewPage extends GetCommonView<WebController> {
  const WebViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          if (await controller.webviewController.canGoBack()) {
            controller.webviewController.goBack();
            return false;
          }
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              controller.detail.title,
              maxLines: 1,
              softWrap: true,
              style: const TextStyle(
                fontSize: 20,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            backgroundColor: Colors.white,
            toolbarHeight: 50,
            elevation: 2,
            actions: [
              IconButton(
                  onPressed: () {
                    showFloatingModalBottomSheet(
                      context: context,
                      builder: (context) =>
                          WebviewAction(url: controller.detail.link),
                    );
                  },
                  icon: const Icon(Icons.more_horiz)),
            ],
          ),
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    WebViewWidget(controller: controller.webviewController),
                    Obx(
                      () => Visibility(
                        visible: controller.progress < 1,
                        child: LinearProgressIndicator(
                          minHeight: 2,
                          backgroundColor: ColorStyle.color_F9F9F9,
                          color: ColorStyle.color_24CF5F,
                          value: controller.progress.value,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
