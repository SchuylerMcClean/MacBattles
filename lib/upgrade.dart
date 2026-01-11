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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text("$currentValue%->${currentValue + 5}%"),
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
            Text(
              user.pet.name,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Image(image: AssetImage(user.pet.image), width: 200),
            Text("Level: ${user.pet.level}", style: TextStyle(fontSize: 24)),
            Text(
              "Pts Available: ${user.points}",
              style: TextStyle(fontSize: 24),
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: 150,
                  child: buildUpgradeButton(
                    context,
                    user.points,
                    user.pet.atk,
                    atkCost,
                    () => upgradeFn(PetSkill.Attack),
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: Column(
                    children: [
                      Text("Attack"),
                      SliderTheme(
                        // Use SliderTheme to override the default thumb shape
                        data: SliderTheme.of(context).copyWith(
                          // Set enabledThumbRadius and disabledThumbRadius to 0.0
                          thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 0.0,
                            disabledThumbRadius: 0.0,
                          ),
                          // Optionally hide the overlay as well
                          overlayShape: const RoundSliderOverlayShape(
                            overlayRadius: 0.0,
                          ),
                        ),
                        child: Slider(
                          value: user.pet.atk as double,
                          min: 0,
                          max: 100,
                          onChanged: (_) => {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: 150,
                  child: buildUpgradeButton(
                    context,
                    user.points,
                    user.pet.def,
                    defCost,
                    () => upgradeFn(PetSkill.Defense),
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: Column(
                    children: [
                      Text("Defense"),
                      SliderTheme(
                        // Use SliderTheme to override the default thumb shape
                        data: SliderTheme.of(context).copyWith(
                          // Set enabledThumbRadius and disabledThumbRadius to 0.0
                          thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 0.0,
                            disabledThumbRadius: 0.0,
                          ),
                          // Optionally hide the overlay as well
                          overlayShape: const RoundSliderOverlayShape(
                            overlayRadius: 0.0,
                          ),
                        ),
                        child: Slider(
                          value: user.pet.def as double,
                          min: 0,
                          max: 100,
                          onChanged: (_) => {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: 150,
                  child: buildUpgradeButton(
                    context,
                    user.points,
                    user.pet.spd,
                    spdCost,
                    () => upgradeFn(PetSkill.Speed),
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: Column(
                    children: [
                      Text("Speed"),
                      SliderTheme(
                        // Use SliderTheme to override the default thumb shape
                        data: SliderTheme.of(context).copyWith(
                          // Set enabledThumbRadius and disabledThumbRadius to 0.0
                          thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 0.0,
                            disabledThumbRadius: 0.0,
                          ),
                          // Optionally hide the overlay as well
                          overlayShape: const RoundSliderOverlayShape(
                            overlayRadius: 0.0,
                          ),
                        ),
                        child: Slider(
                          value: user.pet.spd as double,
                          min: 0,
                          max: 100,
                          onChanged: (_) => {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: 150,
                  child: buildUpgradeButton(
                    context,
                    user.points,
                    user.pet.csc,
                    cscCost,
                    () => upgradeFn(PetSkill.CriticalStrike),
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: Column(
                    children: [
                      Text("Critical Strike Chance"),
                      SliderTheme(
                        // Use SliderTheme to override the default thumb shape
                        data: SliderTheme.of(context).copyWith(
                          // Set enabledThumbRadius and disabledThumbRadius to 0.0
                          thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 0.0,
                            disabledThumbRadius: 0.0,
                          ),
                          // Optionally hide the overlay as well
                          overlayShape: const RoundSliderOverlayShape(
                            overlayRadius: 0.0,
                          ),
                        ),
                        child: Slider(
                          value: user.pet.csc as double,
                          min: 0,
                          max: 100,
                          onChanged: (_) => {},
                        ),
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
