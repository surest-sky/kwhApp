import 'package:app/res/r.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EditLoading extends StatelessWidget {
  const EditLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(child: Column(
        children: [
          Expanded(child: Lottie.asset(R.assetsLottiePageLoading)                                                                          ),
        ],
      )),
    );
  }
}
