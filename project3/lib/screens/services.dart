import 'package:get_it/get_it.dart';
import '../textsAndBrowser.dart';

final GetIt locator = GetIt();

void setupLocator() {
  locator.registerSingleton(TextsAndBrowser());
}