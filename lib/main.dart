import 'package:aesapp/static/themes.dart';
import 'package:aesapp/ui/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AESApp());
}

class AESApp extends StatelessWidget {
  const AESApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: DarkDashTheme().toSwatchScheme(),
        useMaterial3: true,
      ),
      home: const PageSelector(),
    );
  }
}
