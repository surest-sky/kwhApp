import 'package:app/base/get/get_common_view.dart';
import 'package:app/ui/page/app_page/widget/bottom_bar.dart';
import 'package:app/ui/page/share_page/share_controller.dart';
import 'package:flutter/material.dart';

class SharePage extends GetCommonView<ShareController> {
  const SharePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: const Text("Share"),
      ),
    );
  }
}

