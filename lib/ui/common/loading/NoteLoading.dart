import 'package:app/res/r.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoteLoading extends StatelessWidget {
  const NoteLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(R.assetsLottieNoteLoading);
  }
}
