import 'package:daily_plan/global.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// State for the application
class AppState with ChangeNotifier {
  /// Defines if it is in loading state or not
  var loading = false;

  /// Current theme mode selected by the user.
  ThemeMode themeMode = ThemeMode.system;

  /// Loads the saved theme mode.
  Future<void> loadThemeMode() async {
    themeMode = await appThemeService.getThemeMode();
    notifyListeners();
  }

  /// Changes and persists the theme mode.
  Future<void> changeThemeMode(ThemeMode value) async {
    themeMode = value;
    notifyListeners();
    await appThemeService.setThemeMode(value);
  }
}
