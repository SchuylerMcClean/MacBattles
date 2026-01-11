import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mac_battles/types.dart';

int calculateUpgradeCost(int value) {
  return pow(value, 1.2).floor();
}

class UpgradePage extends StatelessWidget {
  const UpgradePage({super.key, required this.user, required this.upgradeFn});

  final User user;
  final Function(PetSkill) upgradeFn;

  Widget buildUpgradeButton(
    BuildContext context,
    int points,
    int currentValue,
    int cost,
    Function()? onPressed,
  ) {
    if (cost > points) {
      return ElevatedButton(
        onPressed: null,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.onSecondary,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("CAN'T"), Text("UPGRADE")],
        ),
      );
    }
    return ElevatedButton(
      onPressed: onPressed,
      child: Column(
        children: [
          Text("UPGRADE"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("$currentValue% --> ${currentValue + 5}%"),
              SizedBox(width: 10),
              Text("${cost}pts"),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final atkCost = calculateUpgradeCost(user.pet.atk);
    final defCost = calculateUpgradeCost(user.pet.def);
    final spdCost = calculateUpgradeCost(user.pet.spd);
    final cscCost = calculateUpgradeCost(user.pet.csc);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(user.pet.image),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildUpgradeButton(
                  context,
                  user.points,
                  user.pet.atk,
                  atkCost,
                  () => upgradeFn(PetSkill.Attack),
                ),
                SizedBox(width: 10),
                Column(children: [Text("Attack"), Text("${user.pet.atk}%")]),
              ],
            ),

            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildUpgradeButton(
                  context,
                  user.points,
                  user.pet.def,
                  defCost,
                  () => upgradeFn(PetSkill.Defense),
                ),
                SizedBox(width: 10),
                Column(children: [Text("Defense"), Text("${user.pet.def}%")]),
              ],
            ),

            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildUpgradeButton(
                  context,
                  user.points,
                  user.pet.spd,
                  spdCost,
                  () => upgradeFn(PetSkill.Speed),
                ),
                SizedBox(width: 10),
                Column(children: [Text("Speed"), Text("${user.pet.spd}%")]),
              ],
            ),

            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildUpgradeButton(
                  context,
                  user.points,
                  user.pet.csc,
                  cscCost,
                  () => upgradeFn(PetSkill.CriticalStrike),
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    Text("Critical Strike Chance"),
                    Text("${user.pet.csc}%"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
