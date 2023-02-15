import '../../../api/database/repository/session_repository.dart';
import '../../../model/error_handler.dart';

typedef Failure = void Function(String failure);
typedef Success = void Function();

abstract class DeleteSessionUseCaseProtocol {
  void execute({
    required int sessionId, 
    required Success success, 
    required Failure failure
  });
}

class DeleteSessionUseCase extends DeleteSessionUseCaseProtocol {
  final SessionRepositoryProtocol sessionRepository;

  DeleteSessionUseCase({required this.sessionRepository});

  @override
  void execute({
    required int sessionId, 
    required Success success, 
    required Failure failure
  }) {
    sessionRepository.deleteSession(
      sessionId: sessionId,
      success: (result) {
        try {
          success();
        } catch (error) {
          failure(
            ErrorHandler(errorType: AppError.databaseInternalError)
              .errorDescription
          );
        }
      },
      failure: (errorType) {
        failure(ErrorHandler(errorType: errorType).errorDescription);
      },
    );
  }
}
