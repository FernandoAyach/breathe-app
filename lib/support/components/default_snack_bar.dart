import 'package:flutter/material.dart';

import '../style/app_colors.dart';
import '../style/app_fonts.dart';

SnackBar getDefaultTextSnackBar(String textContent) {
  return SnackBar(
      backgroundColor: AppColors.black,
      content: Text(
        textContent,
        style: AppFonts.interRegular(16, AppColors.white),
      ),
    );
}