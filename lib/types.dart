import 'package:mac_battles/upgrade.dart';

enum PetSkill { Attack, Defense, Speed, CriticalStrike }

class Pet {
  const Pet({
    required this.name,
    required this.level,
    required this.atk,
    required this.def,
    required this.spd,
    required this.csc,
    required this.image,
  });

  final String name;
  final int level;
  final int atk;
  final int def;
  final int spd;
  final int csc;
  final String image;

  int upgradeCost(PetSkill skill) {
    return calculateUpgradeCost(switch (skill) {
      PetSkill.Attack => atk,
      PetSkill.Defense => def,
      PetSkill.Speed => spd,
      PetSkill.CriticalStrike => csc,
    });
  }

  Pet withUpgrade(PetSkill skill, int increase) {
    var atk = this.atk;
    var def = this.def;
    var spd = this.spd;
    var csc = this.csc;

    switch (skill) {
      case PetSkill.Attack:
        atk += increase;
        break;
      case PetSkill.Defense:
        def += increase;
        break;
      case PetSkill.Speed:
        spd += increase;
        break;
      case PetSkill.CriticalStrike:
        csc += increase;
        break;
    }

    return Pet(
      image: image,
      level: level,
      name: name,
      atk: atk,
      def: def,
      spd: spd,
      csc: csc,
    );
  }
}

class User {
  const User({
    required this.pet,
    required this.id,
    required this.name,
    required this.points,
  });

  final String name;
  final Pet pet;
  final String id; // UUID
  final int points;

  User withAddedPoints(int points) {
    return User(pet: pet, id: id, name: name, points: this.points + points);
  }

  User withUpgrade(PetSkill skill, int increase) {
    var cost = pet.upgradeCost(skill);

    if (points < cost) {
      return this;
    }

    return User(
      pet: pet.withUpgrade(skill, increase),
      id: id,
      name: name,
      points: points - cost,
    );
  }
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

  AppState withAddedPoints(int points) {
    return AppState(events: events, user: user.withAddedPoints(points));
  }

  AppState withUpgrade(PetSkill skill, int increase) {
    return AppState(events: events, user: user.withUpgrade(skill, increase));
  }
}
