import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.pet});

  final Pet pet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7EB),
      color: Color(0xFF764248),
      body: const Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            child: Text(
                "Welcome back, user!",
                style: TextStyle(fontSize: 24),
            ),
            child: Text(
                "${pet.name}",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            child: Image(
                image: AssetImage('${pet.image}'),
                width: 200,
            ),
            child: Text(
                "Level ${pet.level}",
                style: TextStyle(fontSize: 20)
            ),
            child: Text(
                "BATTLE",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)
            ),
            child: Row(
                MainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Expanded(
                        child: ElevatedButton(
                        onPressed: () {}, // TODO: open dialog
                        child: const Text("Join"),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF764248),
                            color: Color(0xFFF6F7EB),
                        ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                        child: ElevatedButton(
                        onPressed: () {}, // TODO: generate code
                        child: const Text("Host"),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF764248),
                            color: Color(0xFFF6F7EB),
                        ),
                    ),
                ]
            )
          ]
        )
      ),
    );
  }
}
