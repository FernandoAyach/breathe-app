import 'package:breathe_app/feature/home/home_controller.dart';
import 'package:flutter/material.dart';

import '../../../../support/extensions/validation_extension.dart';
import '../../../../model/session.dart';
import '../../use_cases/add_session_use_case.dart';
import 'package:flutter_gen/gen_l10n/localization.dart';

class HandleSessionDialogViewModel extends HandleSessionDialogViewProtocol {
  final AddSessionUseCaseProtocol addSessionUseCase;
  final Localization l10n;
  final TextEditingController _minuteDurationController = TextEditingController();
  final TextEditingController _secondDurationController = TextEditingController();
  final TextEditingController _sessionNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Session? _session;

  HandleSessionDialogViewModel({required this.addSessionUseCase, required this.l10n});

  @override
  GlobalKey<FormState> get formKey => _formKey;

  @override
  TextEditingController get minuteDurationController => _minuteDurationController;

  @override
  TextEditingController get secondDurationController => _secondDurationController;

  @override
  TextEditingController get sessionNameController => _sessionNameController;

  @override
  String? textValidator(String? content) => defaultValidation(content);

  @override
  String? minuteValidator(String? content) => minuteValidation(content);
  
  @override
  String? secondValidator(String? content) => secondValidation(content);
  
  @override
  void onTapCancel() {
    _clearFields();
    _dismissDialog();
  }

  @override
  void onTapConfirm() {
    _changeFocus();
    _validate();
  }

  void _addSession() {
    _dismissDialog();
    _clearFields();
    if (_session != null) {
      addSessionUseCase.execute(
        session: _session!,
        success: () {},
        failure: (errorDescription) {
          _showSnackBar(errorDescription);
        }
      );
    }
  }

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

  void _showSnackBar(String textContent) {
    onShowSnackBarDialog?.call(textContent);
  }

  void _validate() {
    if (_formKey.currentState!.validate()) {
      String minutes = _minuteDurationController.text;
      String seconds = _secondDurationController.text;
      String name = _sessionNameController.text;

      if (minutesAndSecondZero(minutes, seconds)) {
        _showSnackBar(l10n.durationJustZerosMessage);
      } else {
        _session = Session(
          duration: '$minutes $seconds',
          name: name
        );
        _addSession();
      }
    }
  }
}
