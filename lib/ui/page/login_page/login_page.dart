import 'package:app/base/get/get_common_view.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'login_controller.dart';

class LoginPage extends GetCommonView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("斑点熊"),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(top: 1),
        child: WebViewWidget(controller: controller.webviewController),
      )
    );
  }
}
