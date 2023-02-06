import 'package:app/res/r.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SearchEmpty extends StatelessWidget {
  const SearchEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 300,
          child: Lottie.asset(R.assetsLottieSearchEmptyCollect),
        ),
        const Text("请先搜索看看咯"),
      ],
    );
  }
}
