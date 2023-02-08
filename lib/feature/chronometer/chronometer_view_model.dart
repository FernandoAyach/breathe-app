import 'dart:async';
import 'package:breathe_app/feature/chronometer/chronometer_controller.dart';
import 'package:flutter/material.dart';

import '../../model/session.dart';
import '../../support/style/app_colors.dart';

class ChronometerViewModel extends ChronometerViewProtocol {
  static const Duration totalDuration = Duration(hours: 1);
  static const Duration insertedDuration = Duration(hours: 0, minutes: 59, seconds: 50);

  Duration currentDuration = const Duration(hours: 0, minutes: 59, seconds: 50);
  Timer? timer;
  Icon icon = const Icon(Icons.play_arrow);
  Color iconBackgroundColor = AppColors.green;
  final Session session;

  ChronometerViewModel({required this.session});

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
  void updateChronometer() {
    if (isChronometerActive) {
      updateIconToPlay();
      stopChronometer();
    } else {
      updateIconToPause();
      runChronometer();
    }
    notifyListeners();
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

  @override
  Color get getColor => iconBackgroundColor;

  @override
  Icon get getIcon => icon;

  @override
  void restartChronometer() {
    timer?.cancel();
    currentDuration = insertedDuration;
    updateIconToPlay();
    notifyListeners();
  }

  int handleTime(int time, String type) {
    if (type == "seconds") {
      return time - (60 * currentDuration.inMinutes);
    }
    return time - (60 * currentDuration.inHours);
  }

  void addTime() {
    currentDuration = Duration(
      hours: currentDuration.inHours,
      minutes: handleTime(currentDuration.inMinutes, "minutes"),
      seconds: handleTime(currentDuration.inSeconds, "seconds") + 1
    );
    if (currentDuration > totalDuration) {
      timer?.cancel();
      currentDuration = const Duration();
    }
    notifyListeners();
  }

  String formatDuration() {
    String formattedDuration = "0${currentDuration.inHours}:";
    int seconds = handleTime(currentDuration.inSeconds, "seconds");
    int minutes = handleTime(currentDuration.inMinutes, "minutes");

    if (minutes < 10) {
      formattedDuration += "0$minutes:";
    } else {
      formattedDuration += "$minutes:";
    }

    if (seconds < 10) {
      formattedDuration += "0$seconds";
    } else {
      formattedDuration += "$seconds";
    }

    return formattedDuration;
  }

  void updateIconToPlay() {
    icon = const Icon(Icons.play_arrow);
    iconBackgroundColor = AppColors.green;
  }

  void updateIconToPause() {
    icon = const Icon(Icons.pause);
    iconBackgroundColor = AppColors.red;
  }
}
