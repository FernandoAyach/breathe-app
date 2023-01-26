import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {

  static TextStyle interBold(double size, Color color) {
    return GoogleFonts.inter(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle interSemiBold(double size, Color color) {
    return GoogleFonts.inter(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle interMedium(double size, Color color) {
    return GoogleFonts.inter(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle interRegular(double size, Color color) {
    return GoogleFonts.inter(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w400,
    );
  }
}