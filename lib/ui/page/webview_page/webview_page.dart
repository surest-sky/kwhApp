import 'package:app/base/get/get_common_view.dart';
import 'package:app/res/colors.dart';
import 'package:app/res/r.dart';
import 'package:app/ui/page/webview_page/webview_controller.dart';
import 'package:app/util/widget/_toolbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
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
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Stack(
                children: [
                  ToolBar(
                    link: controller.detail.link,
                    backColor: ColorStyle.color_474747,
                    backOnTap: () {
                      Get.back();
                    },
                    title: controller.detail.title,
                  ),
                  Positioned(
                    right: 20,
                    bottom: 11,
                    width: 24,
                    height: 24,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                        splashColor: ColorStyle.color_E2E3E8_66,
                        onTap: () {},
                      ),
                    ),
                  ),
                ],
              ),
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
