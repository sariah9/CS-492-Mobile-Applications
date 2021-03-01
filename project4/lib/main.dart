import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'db/database_manager.dart';
import 'journalApp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, 
    DeviceOrientation.landscapeLeft, 
    DeviceOrientation.landscapeRight
  ]);
  await DatabaseManager.initialize();
  runApp(JournalApp(preferences: await SharedPreferences.getInstance()));
}
