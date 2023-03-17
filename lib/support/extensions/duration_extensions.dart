import '../utils/localize.dart';

const oneMinute = 1;
const oneSecond = 1;
const zero = 0;
const firstIndex = 0;
const lastIndex = 1;
final l10n = Localize.instance.l10n;

extension FormatDurationOutput<T> on T? {
  String formatDurationOutput(String content) {
    String minutes = _breakStringIntoDuration(content)[firstIndex];
    String seconds = _breakStringIntoDuration(content)[lastIndex];
    int parsedMinutes = int.parse(minutes);
    int parsedSeconds = int.parse(seconds);
    String formattedMinutes = '';
    String formattedSeconds = '';

    if (parsedMinutes == oneMinute) {
      formattedMinutes =
          '$parsedMinutes ${l10n.sessionItemMinuteDurationSufixSingular}';
    } else if (int.parse(minutes) > oneMinute) {
      formattedMinutes =
          '$parsedMinutes ${l10n.sessionItemMinuteDurationSufixPlural}';
    }

    if (parsedSeconds == oneSecond) {
      formattedSeconds =
          '$parsedSeconds ${l10n.sessionItemSecondDurationSufixSingular}';
    } else if (parsedSeconds > oneSecond) {
      formattedSeconds =
          '$parsedSeconds ${l10n.sessionItemSecondDurationSufixPlural}';
    }

    if (parsedMinutes != zero && parsedSeconds != zero) {
      return '$formattedMinutes e $formattedSeconds';
    }
    return '$formattedMinutes $formattedSeconds';
  }
}

extension ConvertStringToDuration<T> on T? {
  Duration convertStringToDuration(String content) {
    String minutes = _breakStringIntoDuration(content)[firstIndex];
    String seconds = _breakStringIntoDuration(content)[lastIndex];
    int intMinutes = int.parse(minutes);
    int intSeconds = int.parse(seconds);

    return Duration(minutes: intMinutes, seconds: intSeconds);
  }
}

List<String> _breakStringIntoDuration(String content) {
  return content.split(' ');
}
