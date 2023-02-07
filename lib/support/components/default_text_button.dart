import 'package:flutter/material.dart';

import '../style/app_fonts.dart';

class DefaultTextButton extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final void Function()? onTap;

  const DefaultTextButton({
    super.key, 
    required this.backgroundColor, 
    required this.textColor,
    required this.text,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.all(30.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: backgroundColor,
          ),
          child: FittedBox(
            fit: BoxFit.fill,
            child: Text(
              text,
              style: AppFonts.interSemiBold(20, textColor),
            ),
          ),
        ),
      ),
    );
  }
}
