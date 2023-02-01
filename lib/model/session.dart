class Session {
  int id = 0;
  String duration;
  String name;

  Session({required this.duration, required this.name});

  Session.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        duration = map['duration'],
        name = map['name'];
}