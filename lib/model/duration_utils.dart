import '../support/utils/localize.dart';

class DurationUtils {
  static String formatDurationOutput(String minutes, String seconds) {
    String formattedMinutes = "";
    String formattedSeconds = "";
    final l10n = Localize.instance.l10n;

    if(int.parse(minutes) == 1) {
      formattedMinutes = "$minutes ${l10n.sessionItemMinuteDurationSufixSingular}";
    } else if(int.parse(minutes) > 1) {
      formattedMinutes = "$minutes ${l10n.sessionItemMinuteDurationSufixPlural}";
    }

    if(int.parse(seconds) == 1) {
      formattedMinutes = "$seconds ${l10n.sessionItemSecondDurationSufixSingular}";
    } else if(int.parse(seconds) > 1) {
      formattedMinutes = "$seconds ${l10n.sessionItemSecondDurationSufixPlural}";
    }
    return "$formattedMinutes $formattedSeconds";
}
}

