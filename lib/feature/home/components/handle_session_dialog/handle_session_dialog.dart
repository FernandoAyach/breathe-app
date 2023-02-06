import 'package:breathe_app/feature/home/home_view.dart';
import 'package:breathe_app/support/components/default_text_button.dart';
import 'package:breathe_app/support/components/default_text_gradient_button.dart';
import 'package:breathe_app/support/components/default_text_input.dart';
import 'package:breathe_app/support/style/app_colors.dart';
import 'package:breathe_app/support/style/app_fonts.dart';
import 'package:flutter/material.dart';

import '../../../../support/utils/localize.dart';

class HandleSessionDialog extends StatelessWidget {
  final HomeViewModelProtocol viewModel;

  const HandleSessionDialog({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final l10n = Localize.instance.l10n;

    return AlertDialog(
      scrollable: true,
      title: FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(
          l10n.dialogAddSessionTitle,
          style: AppFonts.interMedium(28, AppColors.black),
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            children: <Widget> [
              DefaultTextInput(hint: l10n.dialogFormSessionNameLabel),
            ],
          ),
        ),
      ),
      elevation: 20,
      shadowColor: AppColors.pink,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
             Expanded(
              child: DefaultTextButton(
                backgroundColor: AppColors.black,
                textColor: AppColors.white,
                text: l10n.buttonCancelLabel,
              ),
            ),
            Expanded(
              child: DefaultTextGradientButton(
                primaryColor: AppColors.pink,
                secondaryColor: AppColors.white,
                textColor: AppColors.black,
                text: l10n.buttonCreateSessionLabel,
              ),
            ),
          ],
        )
      ],
    );
  }
}
