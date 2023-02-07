import 'package:flutter/material.dart';

import '../style/app_colors.dart';
import '../style/app_fonts.dart';

class DefaultTextInput extends StatelessWidget {
  final String? hint;
  final String? label;
  final int? maxLength;
  final TextInputType? inputType;
  final _textEditingController = TextEditingController();

  DefaultTextInput({
    super.key, 
    this.hint, 
    this.label, 
    this.maxLength, 
    this.inputType
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label ?? "",
          hintText: hint ?? "",
          alignLabelWithHint: true,
          contentPadding: const EdgeInsets.all(30.0),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.pink, width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        ),
        maxLength: maxLength ?? 20,
        keyboardType: inputType ?? TextInputType.text,
        controller: _textEditingController,
        style: AppFonts.interRegular(18, AppColors.black),
      ),
    );
  }
}
