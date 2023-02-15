import 'package:breathe_app/support/utils/ui_constants.dart';
import 'package:flutter/material.dart';

import '../style/app_colors.dart';
import '../style/app_fonts.dart';

class DefaultTextInput extends StatelessWidget {
  final String? hint;
  final String? label;
  final int? maxLength;
  final TextInputType? inputType; 
  final String? Function(String?)? validator;
  final TextEditingController controller;

  const DefaultTextInput({
    super.key, 
    this.hint, 
    this.label, 
    this.maxLength, 
    this.inputType,
    this.validator,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          alignLabelWithHint: true,
          contentPadding: const EdgeInsets.all(32),
          floatingLabelStyle: const TextStyle(color: AppColors.black),
          enabledBorder: UiConstants.outlinedRoundedBorderPink,
          focusedBorder: UiConstants.outlinedRoundedBorderPink,
          errorBorder: UiConstants.outlinedRoundedBorderRed,
          focusedErrorBorder: UiConstants.outlinedRoundedBorderRed,
          errorMaxLines: 6
        ),
        maxLength: maxLength ?? 20,
        keyboardType: inputType,
        style: AppFonts.interRegular(16, AppColors.black),
        validator: validator,
        controller: controller,
      ),
    );
  }
}
