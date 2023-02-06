import '../support/utils/localize.dart';

class ErrorHandler {
  
  final AppError errorType;
  final l10n = Localize.instance.l10n;

  ErrorHandler({required this.errorType});

  String get errorDescription {

    switch(errorType) {
      case AppError.databaseGetError:
        return l10n.databaseGetError;
      case AppError.databaseInternalError:
        return l10n.databaseInternalError;
      default:
        return l10n.unknownError;
    }
  }
}

enum AppError {
  databaseGetError,
  databaseInternalError
}
