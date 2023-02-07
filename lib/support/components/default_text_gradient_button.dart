import 'package:breathe_app/support/style/app_fonts.dart';
import 'package:flutter/material.dart';

class DefaultTextGradientButton extends StatelessWidget {
  final String text;
  final Color primaryColor;
  final Color secondaryColor;
  final Color textColor;
  final void Function()? onTap;

  const DefaultTextGradientButton({
    super.key,
    required this.text,
    required this.primaryColor,
    required this.secondaryColor,
    required this.textColor,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              primaryColor.withOpacity(0.35),
              secondaryColor,
            ],
          ),
        ),
        child: Center(
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
