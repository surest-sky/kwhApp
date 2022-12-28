import 'package:app/base/get/get_common_view.dart';
import 'package:app/ui/page/app_page/widget/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'home_controller.dart';

class HomePage extends GetCommonView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: const Text("home"),
      ),
    );
  }
}

