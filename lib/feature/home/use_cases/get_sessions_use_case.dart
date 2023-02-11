import 'package:breathe_app/database/model/entity_session.dart';
import 'package:breathe_app/database/repository/session_repository.dart';
import 'package:breathe_app/model/error_handler.dart';

import '../../../model/session.dart';

typedef Failure = void Function(String failure);
typedef Success = void Function(List<Session> sessions);

abstract class GetSessionsUseCaseProtocol {
  void execute({required Success success, required Failure failure});
}

class GetSessionsUseCase extends GetSessionsUseCaseProtocol {
  final SessionRepositoryProtocol sessionRepository;

  GetSessionsUseCase({required this.sessionRepository});

  @override
  void execute({required Success success, required Failure failure}) {
    sessionRepository.getSessions(
      success: (results) {
        try {
          List<Session> sessions = [];
          results.forEach((EntitySession entitySession) {
            sessions.add(entitySession.toSession());
          });
          success(sessions);
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
