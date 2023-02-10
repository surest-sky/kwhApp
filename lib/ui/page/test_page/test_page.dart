import 'package:app/base/get/get_common_view.dart';
import 'package:flutter/material.dart';

import 'search_controller.dart';

class TestPage extends GetCommonView<TestController> {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: const Text("data"));
  }
}
