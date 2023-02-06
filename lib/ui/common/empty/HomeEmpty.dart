import 'package:app/res/r.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeEmpty extends StatelessWidget {
  const HomeEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 300,
          child: Lottie.asset(R.assetsLottieRefreshEmpty),
        ),
        const Text("请先搜索看看咯"),
      ],
    );
  }
}
