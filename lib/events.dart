import 'package:flutter/material.dart';
import 'package:mac_battles/types.dart';

class Events extends StatelessWidget {
  final List<Event> events;

  const Events({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    if (events.isEmpty) {
      return const Scaffold(body: Center(child: Text("No current events...")));
    }

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              "Event Right Now!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Image.network(events[0].image, width: 200),
            Text(events[0].name),
            Row(
              children: [
                Text(events[0].startTime.toString()),
                Text(" - "),
                Text(events[0].endTime.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
