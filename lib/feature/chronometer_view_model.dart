import 'dart:async';
import 'package:breathe_app/feature/chronometer/chronometer_controller.dart';
import 'package:flutter/material.dart';

import '../support/style/app_colors.dart';

class ChronometerViewModel extends ChronometerViewProtocol {
  static const totalDuration = Duration(minutes: 11);
  Duration duration = const Duration(minutes: 5, seconds: 55);
  Timer? timer;
  Icon icon = const Icon(Icons.play_arrow);
  Color iconBackgroundColor = AppColors.green;

  @override
  void runChronometer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
    notifyListeners();
  }

  @override
  void stopChronometer() {
    timer?.cancel();
  }

  @override
  bool get isChronometerActive {
    if (timer != null) {
      return timer!.isActive;
    }
    return false;
  }

  @override
  String get getDuration => formatDuration();

  int handleTime(int seconds) {
    return duration.inSeconds - (60 * duration.inMinutes);
  }

  @override
  void updateChronometer() {
    if (isChronometerActive) {
      icon = const Icon(Icons.play_arrow);
      iconBackgroundColor = AppColors.green;
      stopChronometer();
    } else {
      icon = const Icon(Icons.pause);
      iconBackgroundColor = AppColors.red;
      runChronometer();
    }
    notifyListeners();
  }

  @override
  Color get getColor => iconBackgroundColor;

  @override
  Icon get getIcon => icon;

  @override
  void restartChronometer() {
    timer?.cancel();
    duration = const Duration(minutes: 5, seconds: 55);
    notifyListeners();
  }

  void addTime() {
    duration = Duration(
        minutes: duration.inMinutes,
        seconds: handleTime(duration.inSeconds) + 1);
    if (duration > totalDuration) {
      timer?.cancel();
      duration = const Duration();
    }
    notifyListeners();
  }

  String formatDuration() {
    String formattedDuration = "";
    int seconds = handleTime(duration.inSeconds);
    int minutes = duration.inMinutes;

    if (minutes < 10) {
      formattedDuration = "0$minutes:";
    } else {
      formattedDuration = "$minutes:";
    }

    if (seconds < 10) {
      formattedDuration += "0$seconds";
    } else {
      formattedDuration += "$seconds";
    }

    return formattedDuration;
  }
}
