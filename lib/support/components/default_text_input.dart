import 'package:flutter/material.dart';

import '../style/app_colors.dart';
import '../style/app_fonts.dart';

class DefaultTextInput extends StatelessWidget {
  final String? hint;
  final _textEditingController = TextEditingController();

  DefaultTextInput({super.key, this.hint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: hint ?? "",
          contentPadding: const EdgeInsets.all(30.0),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.pink, width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        ),
        controller: _textEditingController,
        style: AppFonts.interRegular(18, AppColors.black),
      ),
    );
  }
}
