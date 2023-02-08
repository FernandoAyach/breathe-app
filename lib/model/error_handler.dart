import '../support/utils/localize.dart';

class ErrorHandler {
  
  final AppError errorType;
  final l10n = Localize.instance.l10n;

  ErrorHandler({required this.errorType});

  String get errorDescription {

    switch(errorType) {
      case AppError.databaseGetError:
        return l10n.databaseGetError;
      case AppError.databaseAddError:
        return l10n.databaseAddError;
      case AppError.databaseDeleteError:
        return l10n.databaseDeleteError;
      case AppError.databaseInternalError:
        return l10n.databaseInternalError;
      default:
        return l10n.unknownError;
    }
  }
}

enum AppError {
  databaseGetError,
  databaseAddError,
  databaseDeleteError,
  databaseInternalError,
}
