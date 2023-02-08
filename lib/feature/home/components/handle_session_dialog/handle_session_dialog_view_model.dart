import 'package:breathe_app/feature/home/home_controller.dart';
import 'package:breathe_app/model/duration_utils.dart';
import 'package:breathe_app/support/components/default_snack_bar.dart';
import 'package:breathe_app/support/style/app_fonts.dart';
import 'package:flutter/material.dart';

import '../../../../model/form_validator.dart';
import '../../../../model/session.dart';
import '../../../../support/style/app_colors.dart';
import '../../use_cases/add_session_use_case.dart';
import 'package:flutter_gen/gen_l10n/localization.dart';

class HandleSessionDialogViewModel extends HandleSessionDialogViewProtocol {
  final AddSessionUseCaseProtocol addSessionUseCase;
  final Localization l10n;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _minuteDurationController =
      TextEditingController();
  final TextEditingController _secondDurationController =
      TextEditingController();
  final TextEditingController _sessionNameController = TextEditingController();
  Session? _session;

  HandleSessionDialogViewModel(
      {required this.addSessionUseCase, required this.l10n});

  @override
  String? textValidator(String? content) {
    return FormValidator.defaultValidation(content!);
  }

  @override
  String? minuteValidator(String? content) {
    return FormValidator.minuteValidation(content!);
  }

  @override
  String? secondValidator(String? content) {
    return FormValidator.secondValidation(content!);
  }

  @override
  void onTapCancel() {
    _clearFields();
    _dismissDialog();
  }

  @override
  void onTapConfirm() {
    _changeFocus();
    if (_formKey.currentState!.validate()) {
      String minutes = _minuteDurationController.text;
      String seconds = _secondDurationController.text;
      String name = _sessionNameController.text;

      if (FormValidator.minutesAndSecondZero(minutes, seconds)) {
        _showSnackBar();
      } else {
        _session = Session(
            duration: DurationUtils.formatDurationOutput(minutes, seconds),
            name: name);
        _addSession();
      }
    }
  }

  void _addSession() {
    _dismissDialog();
    _clearFields();
    if (_session != null) {
      addSessionUseCase.execute(
          session: _session!,
          success: (result) {},
          failure: (errorDescription) {});
    }
  }

  @override
  GlobalKey<FormState> get formKey => _formKey;

  @override
  TextEditingController get minuteDurationController =>
      _minuteDurationController;

  @override
  TextEditingController get secondDurationController =>
      _secondDurationController;

  @override
  TextEditingController get sessionNameController => _sessionNameController;

  void _dismissDialog() {
    onDismissDialog?.call();
  }

  void _changeFocus() {
    onConfirmDialog?.call();
  }

  void _clearFields() {
    _minuteDurationController.clear();
    _secondDurationController.clear();
    _sessionNameController.clear();
  }

  void _showSnackBar() {
    onShowSnackBarDialog?.call(getDefaultTextSnackBar(l10n.durationJustZerosMessage));
  }
}
