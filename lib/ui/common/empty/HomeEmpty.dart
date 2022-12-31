import 'package:app/res/r.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeEmpty extends StatelessWidget {
  const HomeEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Center(child: Column(
        children: [
          Expanded(child: Lottie.asset(R.assetsLottieRefreshEmpty)                                                                          ),
          const Text("暂无数据哦"),
        ],
      )),
    );
  }
}
