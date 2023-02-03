
import 'package:breathe_app/database/model/entity_session.dart';
import 'package:breathe_app/database/repository/session_repository.dart';
import 'package:breathe_app/objectbox.g.dart';
import 'package:intl/date_symbols.dart';

import '../../../model/session.dart';

typedef Failure = void Function(Exception failure);
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
        List<Session> sessions = List.empty();
        try {
          results.forEach((EntitySession session) {
            sessions.add(session.toSession());
          });
          success.call(sessions);
        } on Error catch (error) {
          failure(Exception(error));
        }
      },
      failure: (error) {
        failure(Exception(error));
      },
    );
  }
}