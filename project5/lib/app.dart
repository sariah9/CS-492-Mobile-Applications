import 'package:flutter/material.dart';
import 'screens/landing.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wasteagram',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        accentColor: Colors.pink[700],
      ),
      home: LandingPage(),
    );
  }
}
