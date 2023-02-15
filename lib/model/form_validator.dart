import '../support/utils/localize.dart';

class FormValidator {
  static const oneMinute = 60;
  static const zero = 0;

  static final l10n = Localize.instance.l10n;

  static String? defaultValidation(String content) {
    if (emptyFields(content)) {
      return l10n.emptyFieldFormMessage;
    } else if (hasSpecialCharacters(content)) {
      return l10n.specialCharactersFormMessage;
    }
    return null;
  }

  static String? minuteValidation(String content) {
    if (emptyFields(content)) {
      return l10n.emptyFieldFormMessage;
    } else if (hasSpecialCharacters(content)) {
      return l10n.specialCharactersFormMessage;
    } else if (notValidMinutes(content)) {
      return l10n.invalidDurationFormMessage;
    } 
    return null;
  }

  static String? secondValidation(String content) {
    if (emptyFields(content)) {
      return l10n.emptyFieldFormMessage;
    } else if (hasSpecialCharacters(content)) {
      return l10n.specialCharactersFormMessage;
    } else if (notValidSeconds(content)) {
      return l10n.invalidDurationFormMessage;
    }
    return null;
  }

  static bool emptyFields(String? content) {
    if (content == null || content.isEmpty) {
      return true;
    }
    return false;
  }

  static bool hasSpecialCharacters(String content) {
    final validCharacters = RegExp(r'^[a-zA-Z0-9 ]+$');
    if (validCharacters.hasMatch(content)) {
      return false;
    }
    return true;
  }

  static bool notValidSeconds(String content) {
    try {
      if (int.parse(content) >= oneMinute) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  static bool notValidMinutes(String content) {
    try {
      if (int.parse(content) > oneMinute) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  static bool minutesAndSecondZero(String minutes, String seconds) {
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