import 'package:daily_plan/global.dart';
import 'package:daily_plan/services/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// State for the application
class AppState with ChangeNotifier {
  /// Defines if it is in loading state or not
  var loading = false;

  /// Current theme mode selected by the user.
  ThemeMode themeMode = ThemeMode.system;

  /// Current task container layout selected by the user.
  TaskContainerLayout taskContainerLayout = TaskContainerLayout.minimal;

  /// Loads the saved theme mode.
  Future<void> loadThemeMode() async {
    themeMode = await appThemeService.getThemeMode();
    notifyListeners();
  }

  /// Loads the saved task container layout.
  Future<void> loadTaskContainerLayout() async {
    taskContainerLayout = await appThemeService.getTaskContainerLayout();
    notifyListeners();
  }

  /// Loads saved app appearance preferences.
  Future<void> loadAppearancePreferences() async {
    themeMode = await appThemeService.getThemeMode();
    taskContainerLayout = await appThemeService.getTaskContainerLayout();
    notifyListeners();
  }

  /// Changes and persists the theme mode.
  Future<void> changeThemeMode(ThemeMode value) async {
    themeMode = value;
    notifyListeners();
    await appThemeService.setThemeMode(value);
  }

  /// Changes and persists the task container layout.
  Future<void> changeTaskContainerLayout(TaskContainerLayout value) async {
    taskContainerLayout = value;
    notifyListeners();
    await appThemeService.setTaskContainerLayout(value);
  }
}
