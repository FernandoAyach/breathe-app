import 'package:breathe_app/model/session.dart';

import '../../objectbox.g.dart';
import '../database.dart';

abstract class SessionRepositoryProtocol {
  void getSessions({Success? success, Failure? failure});
}

typedef Success = void Function(dynamic result);
typedef Failure = void Function(Exception error);

class SessionRepository extends SessionRepositoryProtocol {
  final Database database;

  SessionRepository({required this.database});

  Future<Box> _getSessionBox() async {
    final store = await database.getStore();
    return store.box<Session>();
  }

  @override
  void getSessions({Success? success, Failure? failure}) async {
    try {
      final box = await _getSessionBox();
      final List<EntitySession_> sessions =
          box.getAll() as List<EntitySession_>;
      success?.call(sessions);
    } catch (error) {
      failure?.call(error as Exception);
    }
  }
}
