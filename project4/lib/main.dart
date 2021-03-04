// Sariah Bunnell
// Project 4 - Journal
// Sources:
// https://stackoverflow.com/questions/57818472/how-to-change-theme-of-the-entire-app-using-3-different-themes-flutter
// https://medium.com/codechai/persisting-theme-using-sharedpreferences-android-ios-and-web-1f4431d9dbcd
// cover.jpg: Photo by Dariusz Sankowski on Unsplash.com
// https://api.flutter.dev/flutter/material/DropdownButton-class.html
// https://flutter.dev/docs/cookbook/navigation/navigation-basics
// https://api.flutter.dev/flutter/material/Icons-class.html
// https://gist.github.com/ybakos/2769781ecd6844a38c37f4e751f41761
// https://medium.com/@zxlee618/master-detail-view-in-flutter-e1237aa7165f
// Exploration Lectures and Videos Week 7 and 8

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
