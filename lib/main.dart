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
    setState(() async {
      _state = await refreshAppState();
    });
  }

  Widget inAppScreen(BuildContext context, Widget w) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(widget.title),
      ),
      body: Center(child: w),
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
        primary: surface,
        onPrimary: primary,
        secondary: secondary,
        onSecondary: dark,
        error: secondary,
        onError: dark,
        surface: surface,
        onSurface: dark,
      ),
    );

    if (_state == null) {
      _loadState();
      return MaterialApp(
        title: widget.title,
        theme: theme,
        home: Scaffold(body: Center(child: CircularProgressIndicator())),
      );
    }

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
