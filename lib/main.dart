import 'package:candy_game/ui/feature/home/home_screen.dart';
import 'package:flutter/material.dart';

import 'di/di.dart';
import 'ui/main/theme_data.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initDI().then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sweet Billions',
      theme: candiesThemeData(),
      home: HomeScreen(),
    );
  }
}
