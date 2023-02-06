import '../../objectbox.g.dart';
import '../database.dart';
import '../model/entity_session.dart';

abstract class SessionRepositoryProtocol {
  void getSessions({Success? success, Failure? failure});
}

typedef Success = void Function(dynamic result);
typedef Failure = void Function(String error);

class SessionRepository extends SessionRepositoryProtocol {
  final Database database;

  SessionRepository({required this.database});

  Future<Box> _getSessionTable() async {
    final databaseInstance = await database.getInstance();
    return databaseInstance.box<EntitySession>();
  }

  @override
  void getSessions({Success? success, Failure? failure}) async {
    try {
      final sessionTable = await _getSessionTable();
      List<EntitySession> sessions = sessionTable.getAll() as List<EntitySession>;
      success?.call(sessions);
    } catch (error) {
      failure?.call("");
    }
  }
}
