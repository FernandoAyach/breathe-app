import 'dart:ffi';

import 'package:breathe_app/model/error_handler.dart';

import '../../objectbox.g.dart';
import '../database.dart';
import '../model/entity_session.dart';

abstract class SessionRepositoryProtocol {
  void getSessions({Success? success, Failure? failure});
  void addSession({
    required EntitySession session, 
    Success? success, 
    Failure? failure
  });
  void deleteSession({
    required int sessionId, 
    Success? success, 
    Failure? failure
  });
}

typedef Success = void Function(dynamic result);
typedef Failure = void Function(AppError error);

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
      List<EntitySession> sessions =
          sessionTable.getAll() as List<EntitySession>;
      success?.call(sessions);
    } catch (error) {
      failure?.call(AppError.databaseGetError);
    }
  }

  @override
  void addSession({
    required EntitySession session,
    Success? success,
    Failure? failure 
  }) async {
    try {
      final sessionTable = await _getSessionTable();
      final sessionId = sessionTable.put(session);
      success?.call(sessionId);
    } catch (error) {
      failure?.call(AppError.databaseAddError);
    }
  }
  
  @override
  void deleteSession({
    required int sessionId, 
    Success? success, 
    Failure? failure
  }) async {
    try {
      final sessionTable = await _getSessionTable();
     sessionTable.remove(sessionId);
      success?.call(Void);
    } catch (error) {
      failure?.call(AppError.databaseDeleteError);
    }
  }
}
