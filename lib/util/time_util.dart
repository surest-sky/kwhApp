import 'dart:async';

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