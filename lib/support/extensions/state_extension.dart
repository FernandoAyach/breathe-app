import 'package:flutter/material.dart';

import '../style/app_colors.dart';
import '../style/app_fonts.dart';

extension TextSnackBarExtension on State {
  void showTextSnackBar(String textContent) {
    SnackBar snackBar = SnackBar(
      backgroundColor: AppColors.black,
      content: Text(
        textContent,
        style: AppFonts.interRegular(16, AppColors.white),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
