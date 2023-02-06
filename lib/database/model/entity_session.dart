import 'package:breathe_app/model/session.dart';
import 'package:breathe_app/objectbox.g.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class EntitySession {
  int id;
  String duration;
  String name;

  EntitySession({this.id = 0, required this.duration, required this.name});
}

extension MapToSession on EntitySession {
  Session toSession() {
    return Session(
      duration: duration, 
      name: name
    );
  }
}

extension MapFromSession on Session {
  EntitySession fromSession() {
    return EntitySession(
      duration: duration, 
      name: name
    );
  }
}
