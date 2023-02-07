import 'package:breathe_app/support/components/default_text_button.dart';
import 'package:breathe_app/support/components/default_text_gradient_button.dart';
import 'package:breathe_app/support/components/default_text_input.dart';
import 'package:breathe_app/support/style/app_colors.dart';
import 'package:breathe_app/support/style/app_fonts.dart';
import 'package:flutter/material.dart';

import '../../../../support/utils/localize.dart';

abstract class HandleSessionDialogViewModelProtocol {
  TextEditingController get sessionNameController;
  TextEditingController get minuteDurationController;
  TextEditingController get secondDurationController;
  String? textValidator(String? content);
  String? minuteValidator(String? content);
  String? secondValidator(String? content);
  GlobalKey<FormState> get formKey;
  void onTapCancel();
  void onTapConfirm();
  //void addSession();
}

class HandleSessionDialog extends StatelessWidget {
  final HandleSessionDialogViewModelProtocol viewModel;
  
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
          key: viewModel.formKey,
          child: Column(
            children: <Widget>[
              DefaultTextInput(
                label: l10n.dialogFormSessionNameLabel,
                validator: viewModel.textValidator,
                controller: viewModel.sessionNameController,
              ),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Row(
                  children: [
                    Expanded(
                      child: DefaultTextInput(
                        label: l10n.dialogMinutesLabel,
                        hint: l10n.dialogDefaultDurationTimeHint,
                        maxLength: 2,
                        inputType: TextInputType.number,
                        validator: viewModel.minuteValidator,
                        controller: viewModel.minuteDurationController,
                      ),
                    ),
                    Expanded(
                      child: DefaultTextInput(
                        label: l10n.dialogSecondsLabel,
                        hint: l10n.dialogDefaultDurationTimeHint,
                        maxLength: 2,
                        inputType: TextInputType.number,
                        validator: viewModel.secondValidator,
                        controller: viewModel.secondDurationController,
                      ),
                    ),
                  ],
                ),
              ),
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
                onTap: viewModel.onTapCancel,
              ),
            ),
            Expanded(
              child: DefaultTextGradientButton(
                primaryColor: AppColors.pink,
                secondaryColor: AppColors.white,
                textColor: AppColors.black,
                text: l10n.buttonCreateSessionLabel,
                onTap: () {
                  viewModel.onTapConfirm();
                  FocusScope.of(context).requestFocus(FocusNode());
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
