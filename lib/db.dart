import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mac_battles/types.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide User;

Future<void> initializeDB() async {
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL'] ?? '',
    anonKey: dotenv.env['SUPABASE_KEY'] ?? '',
  );
}

Future<AppState> refreshAppState() async {
  //throw UnimplementedError("refreshAppState is not implemented");

  return AppState(
    user: User(
      name: "Test User",
      id: "Some UUID",
      pet: Pet(
        level: 5,
        atk: 3,
        def: 3,
        spd: 3,
        csc: 3,
        name: "Patchy mix",
        image: "dog.png",
      ),
      points: 20,
    ),
    events: [
      Event(
        name: "Test",
        image: "http://google.images.com/",
        startTime: DateTime(2025),
        endTime: DateTime(2026),
      ),
    ],
  );
}
