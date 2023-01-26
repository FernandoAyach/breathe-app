import 'dart:async';
import 'package:breathe_app/feature/chronometer/chronometer_controller.dart';


class ChronometerViewModel extends ChronometerViewProtocol {
  static const countDownDuration = Duration(seconds: 10);
  Duration duration = const Duration();
  Timer? timer;
  int seconds = 0;

  @override
  void initChronometer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
    notifyListeners();
  }

  @override
  String get getDuration => duration.inSeconds.toString();

  void addTime() {
    seconds = seconds + 1;
    if (seconds > countDownDuration.inSeconds){
      timer?.cancel();
    } else{
      duration = Duration(seconds: seconds);
    }
    notifyListeners();
  }
}
