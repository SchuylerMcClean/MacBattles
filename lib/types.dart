class Pet {
  const Pet({
    required this.name,
    required this.level,
    required this.atk,
    required this.def,
    required this.spd,
    required this.csc,
  });

  final String name;
  final int level;
  final int atk;
  final int def;
  final int spd;
  final int csc;
}

class User {
  const User({required this.pet, required this.id, required this.name});

  final String name;
  final Pet pet;
  final String id; // UUID
}

class Event {
  const Event({
    required this.name,
    required this.image,
    required this.startTime,
    required this.endTime,
  });

  final String name;
  final String image;
  final DateTime startTime;
  final DateTime endTime;
}

class AppState {
  const AppState({required this.user, required this.events});

  final User user;
  final List<Event> events;
}
