import 'package:flutter/material.dart';
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

  final supabase = Supabase.instance.client;

  debugPrint(
    "Event count ${(await supabase.from("Events").select("*").order("start_date", ascending: false).count()).count.toString()}",
  );

  var userMap = await supabase
      .from("Users")
      .select("*")
      .eq("id", dotenv.env['USER_ID'] ?? '')
      .single();

  debugPrint("User Map: $userMap");

  var petMap = await supabase
      .from("Pets")
      .select("*")
      .eq("id", userMap['pet_id'] as String)
      .single();

  return AppState(
    user: User(
      name: userMap['name'],
      id: userMap['id'],
      pet: Pet(
        //id: data['pet_id'],
        name: petMap['name'],
        image: petMap['image'],
        level: petMap['level'],
        atk: petMap['atk'],
        def: petMap['def'],
        spd: petMap['spd'],
        csc: petMap['csc'],
      ),
      points: userMap['points'],
    ),
    events:
        (await supabase
                .from("Events")
                .select("*")
                .order("start_date", ascending: false)
                .limit(1)
                .then(
                  (data) => data.map<Event>(
                    (e) => Event(
                      name: e['name'],
                      image: e['image'],
                      startTime: DateTime.parse(e['start_date']),
                      endTime: DateTime.parse(e['end_date']),
                    ),
                  ),
                ))
            .toList(),
  );
}
