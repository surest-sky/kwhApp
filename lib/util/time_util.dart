import 'dart:async';

import 'package:date_format/date_format.dart';

typedef PeriodicCallBack = void Function(Timer periodicTime);

class TimeUtil {
  static void setTimeout(callback, time) {
    Duration timeDelay = Duration(milliseconds: time);
    Timer(timeDelay, callback);
  }

 static void setInterval(PeriodicCallBack click, time) {
    Duration periodic = Duration(milliseconds: time);
    Timer.periodic(periodic, (intervalTime) {
      click(intervalTime);
    });
  }

  static String convertFormatDate(int date) {
    final dt = DateTime.fromMillisecondsSinceEpoch(date * 1000);
    return formatDate(dt, [yyyy, '-', mm, '-', dd]);
  }
}

class Throttle {
  final Duration delay;
  Timer? timer;

  Throttle({this.delay = const Duration(milliseconds: 500)});

  void call(Function callBack) {
    if (timer != null) return;
    timer = Timer(delay, () {
      callBack.call();
    });
  }
}