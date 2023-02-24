import 'package:app/ui/page/webview_page/webview_controller.dart';
import 'package:app/util/toast_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';


class WebviewAction extends StatelessWidget {
  late String url;
  WebviewAction({Key? key, required this.url}) : super(key: key);
  Uri get browserUrl => Uri.parse(url);

  Future<void> _launchInBrowser() async {
    if (!await launchUrl(
      browserUrl,
      mode: LaunchMode.externalApplication,
    )) {
      ToastUtil.toast("浏览器打开异常");
    }
  }

  Future<void> _refreshInBrowser() async {
    Get.back();
    Get.find<WebController>().webviewController.reload();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: const Text('分享'),
              leading: const Icon(Icons.share),
              onTap: () {
                Get.back();
                Share.share(url);
              },
            ),
            ListTile(
              title: const Text('浏览器打开'),
              leading: const Icon(Icons.open_in_browser),
              onTap: () {
                Get.back();
                _launchInBrowser();
              },
            ),
            ListTile(
              title: const Text('刷新'),
              leading: const Icon(Icons.refresh),
              onTap: () {
                _refreshInBrowser();
              },
            ),
            ListTile(
              title: const Text('返回主页'),
              leading: const Icon(Icons.reply),
              onTap: () {
                Get.back();
                Get.back();
              },
            ),
            ListTile(
              title: const Text('取消'),
              leading: const Icon(Icons.highlight_off),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}
