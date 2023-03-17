import 'package:flutter/material.dart';

import '../style/app_colors.dart';

class UiConstants {
  static const outlinedRoundedBorderPink = OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.pink, width: 1.5),
      borderRadius: BorderRadius.all(Radius.circular(20)));
  static const outlinedRoundedBorderRed = OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.red, width: 1.5),
      borderRadius: BorderRadius.all(Radius.circular(20)));
}
