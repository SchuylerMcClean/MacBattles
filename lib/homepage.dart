import 'package:flutter/material.dart';
import 'package:mac_battles/types.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.user});

  final User user;

  Widget burnt_button(
    BuildContext context,
    String text,
    Function()? onPressed,
  ) {
    return ElevatedButton(
      onPressed: onPressed, // TODO:
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          Theme.of(context).colorScheme.primary,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Welcome back, ${user.name}!", style: TextStyle(fontSize: 24)),
            Text(
              user.pet.name,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Image(image: AssetImage(user.pet.image), width: 200),
            Text("Level ${user.pet.level}", style: TextStyle(fontSize: 20)),
            Text(
              "BATTLE",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: 30),
                Expanded(child: burnt_button(context, "Join", () {})),
                SizedBox(width: 30),
                Expanded(child: burnt_button(context, "Host", () {})),
                SizedBox(width: 30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
