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
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label ?? "",
          hintText: hint ?? "",
          alignLabelWithHint: true,
          contentPadding: const EdgeInsets.all(30.0),
          floatingLabelStyle: const TextStyle(color: AppColors.black),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.pink, width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(20.0))
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.pink, width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(20.0))
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.red, width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(20.0))
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.red, width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(20.0))
          ),
          errorMaxLines: 6
        ),
        maxLength: maxLength ?? 20,
        keyboardType: inputType ?? TextInputType.text,
        style: AppFonts.interRegular(18, AppColors.black),
        validator: validator,
        controller: controller,
      ),
    );
  }
}
