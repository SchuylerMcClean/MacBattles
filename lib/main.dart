import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mac_battles/db.dart';
import 'package:mac_battles/types.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  await initializeDB();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF764248);
    const surface = Color(0xFFF6F7EB);
    const secondary = Color(0xFFE28413);
    const highlight = Color(0xFF6369D1);
    const dark = Color(0xFF333232);

    return MaterialApp(
      title: 'Mac Battles',
      theme: ThemeData(
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
      ),
      home: const MyHomePage(title: 'Mac Battles'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AppState? _state;

  void _loadState() async {
    setState(() async {
      _state = await refreshAppState();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_state == null) {
      _loadState();
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(),
    );
  }
}
