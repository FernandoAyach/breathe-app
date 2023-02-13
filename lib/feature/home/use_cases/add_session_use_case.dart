import 'package:breathe_app/database/model/entity_session.dart';

import '../../../database/repository/session_repository.dart';
import '../../../model/error_handler.dart';
import '../../../model/session.dart';

typedef Failure = void Function(String failure);
typedef Success = void Function();

abstract class AddSessionUseCaseProtocol {
  void execute({
    required Session session, 
    required Success success, 
    required Failure failure
  });
}

class  AddSessionUseCase extends AddSessionUseCaseProtocol {
  final SessionRepositoryProtocol sessionRepository;

  AddSessionUseCase({required this.sessionRepository});

  @override
  void execute({
    required Session session, 
    required Success success, 
    required Failure failure
  }) {
    sessionRepository.addSession(
      session: session.fromSession(),
      success: (result) {
        try {
          success();
        } catch (error) {
          failure(ErrorHandler(errorType: AppError.databaseInternalError)
              .errorDescription);
        }
      },
      failure: (errorType) {
        failure(ErrorHandler(errorType: errorType).errorDescription);
      },
    );
  }
}
