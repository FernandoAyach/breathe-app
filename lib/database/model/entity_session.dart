import 'package:breathe_app/model/session.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class EntitySession {
  int id = 0;
  String duration;
  String name;

  EntitySession({required this.duration, required this.name});

  EntitySession.fromSession(Session session)
      : id = session.id,
        duration = session.duration,
        name = session.name;

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "duration": duration,
    };
  }
}
