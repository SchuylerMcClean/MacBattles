import 'package:flutter/material.dart';
import 'package:mac_battles/types.dart';

class UpgradePage extends StatelessWidget {
  const UpgradePage({super.key, required this.user});

  final User user;
  final int cost = 45;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.network(user.pet.image),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Column(
                    children: [
                      Text("UPGRADE"),
                      Row(
                        children: [
                          Text("${user.pet.atk}% --> ${user.pet.atk + 5}%"),
                          Text("${cost}pts"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Column(
                    children: [
                      Text("UPGRADE"),
                      Row(
                        children: [
                          Text("${user.pet.def}% --> ${user.pet.def + 5}%"),
                          Text("${cost}pts"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Column(
                    children: [
                      Text("UPGRADE"),
                      Row(
                        children: [
                          Text("${user.pet.spd}% --> ${user.pet.spd + 5}%"),
                          Text("${cost}pts"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Column(
                    children: [
                      Text("UPGRADE"),
                      Row(
                        children: [
                          Text("${user.pet.csc}% --> ${user.pet.csc + 5}%"),
                          Text("${cost}pts"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
