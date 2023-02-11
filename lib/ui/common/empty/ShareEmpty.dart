import 'package:app/res/r.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ShareEmpty extends StatelessWidget {
  const ShareEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 300,
          child: Lottie.asset(R.assetsLottieShareEmptyCollect),
        ),
        const Text("请先添加看看咯"),
      ],
    );
  }
}
