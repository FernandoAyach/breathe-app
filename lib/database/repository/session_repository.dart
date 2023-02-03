import 'package:breathe_app/model/session.dart';

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

  Future<Box> _getSessionBox() async {
    final store = await database.getStore();
    return store.box<EntitySession>();
  }

  @override
  void getSessions({Success? success, Failure? failure}) async {
    try {
      final box = await _getSessionBox();
      List<EntitySession> sessions = box.getAll() as List<EntitySession>;
      success?.call(sessions);
    } catch (error) {
      failure?.call("");
    }
  }
}
