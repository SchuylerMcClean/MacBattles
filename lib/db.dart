import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mac_battles/types.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> initializeDB() async {
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL'] ?? '',
    anonKey: dotenv.env['SUPABASE_KEY'] ?? '',
  );
}

Future<AppState> refreshAppState() async {
  throw UnimplementedError("refreshAppState is not implemented");
}
