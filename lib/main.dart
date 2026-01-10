import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mac_battles/db.dart';
import 'package:mac_battles/homepage.dart';
import 'package:mac_battles/types.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  await initializeDB();
  const title = 'Mac Battles';

  runApp(MyApp(title: title));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.title});

  final String title;

  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  AppState? _state;

  void _loadState() async {
    //var newState = await refreshAppState();

    var newState = AppState(
      user: User(
        name: "Test User",
        id: "Some UUID",
        pet: Pet(
          level: 5,
          atk: 3,
          def: 3,
          spd: 3,
          csc: 3,
          name: "Patchy mix",
          image: "dog.png",
        ),
      ),
      events: [
        Event(
          name: "Test",
          image: "http://google.images.com/",
          startTime: DateTime(2025),
          endTime: DateTime(2026),
        ),
      ],
    );

    setState(() {
      _state = newState;
    });
  }

  Widget inAppScreen(BuildContext context, Widget w) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        title: Text(widget.title),
      ),
      body: Center(child: w),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).colorScheme.onSecondary,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
              IconButton(
                icon: const Icon(Icons.event),
                onPressed: () {
                  Navigator.pushNamed(context, '/events');
                },
              ),
              IconButton(
                icon: const Icon(Icons.upgrade),
                onPressed: () {
                  Navigator.pushNamed(context, '/upgrade');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF764248);
    const surface = Color(0xFFF6F7EB);
    const secondary = Color(0xFFE28413);
    const highlight = Color(0xFF6369D1);
    const dark = Color(0xFF333232);

    var theme = ThemeData(
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: primary,
        onPrimary: surface,
        secondary: secondary,
        onSecondary: dark,
        error: secondary,
        onError: dark,
        surface: surface,
        onSurface: dark,
      ),
    );

    /*if (_state == null) {
      _loadState();
      return MaterialApp(
        title: widget.title,
        theme: theme,
        home: Scaffold(body: Center(child: CircularProgressIndicator())),
      );
    }*/

    _loadState();

    return MaterialApp(
      title: widget.title,
      theme: theme,
      initialRoute: '/',
      routes: {
        '/': (context) => inAppScreen(context, HomePage(user: _state!.user)),
      },
    );
  }
}
