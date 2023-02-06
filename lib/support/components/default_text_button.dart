import 'package:flutter/material.dart';

import '../style/app_colors.dart';
import '../style/app_fonts.dart';

class DefaultTextButton extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String text;

  const DefaultTextButton({
    super.key, 
    required this.backgroundColor, 
    required this.textColor,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(30.0),
          ),
          overlayColor: MaterialStateProperty.all(AppColors.pink),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        child: Text(
          text,
          style: AppFonts.interSemiBold(20, textColor),
        ),
      ),
    );
  }
}
