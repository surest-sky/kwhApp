import 'package:app/res/r.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ShareEmpty extends StatelessWidget {
  const ShareEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Center(child: Column(
        children: [
          Expanded(child: Lottie.asset(R.assetsLottieShareEmptyCollect)                                                                          ),
          const Text("暂无数据哦"),
        ],
      )),
    );
  }
}
