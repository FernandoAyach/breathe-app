import '../support/utils/localize.dart';

class DurationUtils {
  static const oneMinute = 1;
  static const oneSecond = 1;
  static const zero = 0;
  static const firstIndex = 0;
  static const lastIndex = 1;

  static String formatDurationOutput(String content) {

    String minutes = breakStringIntoDuration(content)[firstIndex];
    String seconds = breakStringIntoDuration(content)[lastIndex];
    int parsedMinutes = int.parse(minutes);
    int parsedSeconds = int.parse(seconds);
    String formattedMinutes = '';
    String formattedSeconds = '';
    final l10n = Localize.instance.l10n;
    
    if(parsedMinutes == oneMinute) {
      formattedMinutes = '$parsedMinutes ${l10n.sessionItemMinuteDurationSufixSingular}';
    } else if(int.parse(minutes) > oneMinute) {
      formattedMinutes = '$parsedMinutes ${l10n.sessionItemMinuteDurationSufixPlural}';
    }

    if(parsedSeconds == oneSecond) {
      formattedSeconds = '$parsedSeconds ${l10n.sessionItemSecondDurationSufixSingular}';
    } else if(parsedSeconds > oneSecond) {
      formattedSeconds = '$parsedSeconds ${l10n.sessionItemSecondDurationSufixPlural}';
    }

    if(parsedMinutes != zero && parsedSeconds != zero) {
      return '$formattedMinutes e $formattedSeconds';
    }
    return '$formattedMinutes $formattedSeconds';
  } 

  static Duration convertStringToDuration(String content) {
    String minutes = breakStringIntoDuration(content)[firstIndex];
    String seconds = breakStringIntoDuration(content)[lastIndex];
    int intMinutes = int.parse(minutes);
    int intSeconds = int.parse(seconds);

    return Duration(minutes: intMinutes, seconds: intSeconds);
  }

  static List<String> breakStringIntoDuration(String content) {
    return content.split(' ');
  }
}

