import 'package:flutter/material.dart';
import 'package:mac_battles/types.dart';

class EventsPage extends StatelessWidget {
  final List<Event> events;

  const EventsPage({super.key, required this.events});

  String _formatDate(DateTime date) {
    return "${date.hour}:${date.minute}";
  }

  @override
  Widget build(BuildContext context) {
    if (events.isEmpty) {
      return const Scaffold(body: Center(child: Text("No current events...")));
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Event Right Now!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Image.network(events[0].image, width: 200),
            SizedBox(height: 20),
            Text(events[0].name),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_formatDate(events[0].startTime)),
                Text(" - "),
                Text(_formatDate(events[0].endTime)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
