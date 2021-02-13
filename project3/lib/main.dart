import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app.dart';
import 'screens/services.dart';

const String title = 'Call Me Maybe?';

void main() { 
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.portraitUp,
  ]);
  setupLocator();
  runApp(App(title: title));

}
