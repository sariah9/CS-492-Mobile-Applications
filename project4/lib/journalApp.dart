import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'widgets/welcomePage.dart';

class JournalApp extends StatefulWidget {
  final SharedPreferences preferences;
  JournalApp({Key key, @required this.preferences}) : super(key: key);

  @override
  AppState createState() => AppState();
}

class AppState extends State<JournalApp> {
  static const THEME_KEY = 'themeDark';
  ThemeData themeSelection;

  bool get themeDarkGet =>
    widget.preferences.getBool(THEME_KEY) ?? false;

  void themeSet(bool setting) {
    widget.preferences.setBool(THEME_KEY, setting);
    setState(() => {});
  }

  ThemeData initTheme() {
    themeDarkGet ? themeSelection = ThemeData.dark() : themeSelection = ThemeData.light();
    return themeSelection;
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Journal App',
      theme: initTheme(),
      home: WelcomePage(
        func: themeSet,
        sel: themeDarkGet,
        prefs: widget.preferences, 
      ),
    );
  }
}
