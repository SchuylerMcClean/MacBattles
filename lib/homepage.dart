import 'package:flutter/material.dart';
import 'package:mac_battles/network.dart';
import 'package:mac_battles/types.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.user});

  final User user;

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  String? _battleCode;
  String _joinCode = "";

  void getCode() async {
    var newBattleCode = await generateCode();

    debugPrint("Battle Code: $newBattleCode");

    setState(() => _battleCode = newBattleCode);
  }

  Widget burnt_button(
    BuildContext context,
    String text,
    Function()? onPressed,
  ) {
    return ElevatedButton(
      onPressed: onPressed,
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
    if (_battleCode == null) {
      getCode();
    }

    var user = widget.user;

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
                Expanded(
                  child: burnt_button(
                    context,
                    "Join",
                    () => showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        insetPadding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Enter a battle code:',
                                ),
                                onChanged: (value) =>
                                    setState(() => _joinCode = value),
                              ),
                            ),
                            burnt_button(
                              context,
                              "Join",
                              () => {
                                // TODO: Play battle
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 30),
                Expanded(
                  child: burnt_button(
                    context,
                    "Host",
                    () => showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        insetPadding: EdgeInsets.all(10),
                        child: Text(
                          "Your battle code: $_battleCode",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
