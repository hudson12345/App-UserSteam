import 'package:flutter/material.dart';
import 'package:perfil_steam/pages/homePage.dart';

void main() {
  runApp( MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage()
    );
  }
}
