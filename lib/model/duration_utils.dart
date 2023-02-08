import '../support/utils/localize.dart';

class DurationUtils {

  static String formatDurationOutput(String content) {

    String minutes = breakStringIntoDuration(content)[0];
    String seconds = breakStringIntoDuration(content)[1];
    String formattedMinutes = "";
    String formattedSeconds = "";
    final l10n = Localize.instance.l10n;
    
    if(int.parse(minutes) == 1) {
      formattedMinutes = "$minutes ${l10n.sessionItemMinuteDurationSufixSingular}";
    } else if(int.parse(minutes) > 1) {
      formattedMinutes = "$minutes ${l10n.sessionItemMinuteDurationSufixPlural}";
    }

    if(int.parse(seconds) == 1) {
      formattedSeconds = "$seconds ${l10n.sessionItemSecondDurationSufixSingular}";
    } else if(int.parse(seconds) > 1) {
      formattedSeconds = "$seconds ${l10n.sessionItemSecondDurationSufixPlural}";
    }
    return "$formattedMinutes $formattedSeconds";
  } 

  static Duration convertStringToDuration(String content) {
    String minutes = breakStringIntoDuration(content)[0];
    String seconds = breakStringIntoDuration(content)[1];
    int intMinutes = int.parse(minutes);
    int intSeconds = int.parse(seconds);

    return Duration(minutes: intMinutes, seconds: intSeconds);
  }

  static List<String> breakStringIntoDuration(String content) {
    return content.split(' ');
  }
}

