import 'dart:async';
import 'package:breathe_app/feature/chronometer/chronometer_controller.dart';
import 'package:breathe_app/model/duration_utils.dart';
import 'package:breathe_app/support/components/default_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localization.dart';

import '../../model/session.dart';
import '../../support/style/app_colors.dart';


class ChronometerViewModel extends ChronometerViewProtocol {
  Timer? timer;
  Icon icon = const Icon(Icons.play_arrow);
  Color iconBackgroundColor = AppColors.green;

  Duration currentDuration = const Duration();
  Duration insertedDuration = const Duration();
  double _progress = 0;

  final Session session;
  final Localization l10n;
 
  ChronometerViewModel({required this.session, required this.l10n});

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
  double get progress => _progress;

  @override
  void runChronometer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => decreaseTime());
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
  void restartChronometer() {
    timer?.cancel();
    currentDuration = insertedDuration;
    updateIconToPlay();
    notifyListeners();
  }

  @override
  void insertSelectedDuration() {
    insertedDuration =  DurationUtils.convertStringToDuration(session.duration);
    currentDuration = insertedDuration;
  }
  
  @override
  void didTapLeaveSession() {
    onTapLeaveSession?.call();
  }

  int handleSeconds(int time) {
    return time - (60 * currentDuration.inMinutes);
  }

  void decreaseTime() {
    currentDuration = Duration(
      minutes: currentDuration.inMinutes,
      seconds: handleSeconds(currentDuration.inSeconds) - 1
    );
    if (currentDuration == Duration.zero) {
      timer?.cancel();
      currentDuration = const Duration();
      didFinishLesson(getDefaultTextSnackBar(
        l10n.chronometerSnackBarFinishLessonText
      ));
    }
    setProgress();
    notifyListeners();
  }

  String formatDuration() {
    String formattedDuration = "";
    int seconds = handleSeconds(currentDuration.inSeconds);
    int minutes = currentDuration.inMinutes;

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
 
  void setProgress() {
    _progress = currentDuration.inSeconds / insertedDuration.inSeconds;
  }

  void didFinishLesson(SnackBar snackBar) {
    onFinishSession?.call(snackBar);
  }
}