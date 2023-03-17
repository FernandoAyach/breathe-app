import 'package:breathe_app/feature/home/components/handle_session_dialog/handle_session_dialog.dart';

import '../utils/localize.dart';

const oneMinute = 60;
const zero = 0;
final l10n = Localize.instance.l10n;

extension DefaultSessionValidation on HandleSessionDialogViewModelProtocol {
  String? defaultValidation(String? content) {
    if (_emptyFields(content!)) {
      return l10n.emptyFieldFormMessage;
    } else if (_hasSpecialCharacters(content)) {
      return l10n.specialCharactersFormMessage;
    }
    return null;
  }
}

extension MinuteValidation on HandleSessionDialogViewModelProtocol {
  String? minuteValidation(String? content) {
    if (_emptyFields(content!)) {
      return l10n.emptyFieldFormMessage;
    } else if (_hasSpecialCharacters(content)) {
      return l10n.specialCharactersFormMessage;
    } else if (_notValidMinutes(content)) {
      return l10n.invalidDurationFormMessage;
    }
    return null;
  }
}

extension SecondValidation on HandleSessionDialogViewModelProtocol {
  String? secondValidation(String? content) {
    if (_emptyFields(content!)) {
      return l10n.emptyFieldFormMessage;
    } else if (_hasSpecialCharacters(content)) {
      return l10n.specialCharactersFormMessage;
    } else if (_notValidSeconds(content)) {
      return l10n.invalidDurationFormMessage;
    }
    return null;
  }
}

extension ZeroMinuteAndSecondValidation on HandleSessionDialogViewModelProtocol {
  bool minutesAndSecondZero(String minutes, String seconds) {
    try {
      if (int.parse(minutes) == zero && int.parse(seconds) == zero) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}

bool _emptyFields(String? content) {
  if (content == null || content.isEmpty) {
    return true;
  }
  return false;
}

bool _hasSpecialCharacters(String content) {
  final validCharacters = RegExp(r'^[a-zA-Z0-9 ]+$');
  if (validCharacters.hasMatch(content)) {
    return false;
  }
  return true;
}

bool _notValidSeconds(String content) {
  try {
    if (int.parse(content) >= oneMinute) {
      return true;
    }
    return false;
  } catch (e) {
    return false;
  }
}

bool _notValidMinutes(String content) {
  try {
    if (int.parse(content) > oneMinute) {
      return true;
    }
    return false;
  } catch (e) {
    return false;
  }
}