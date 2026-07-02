import 'package:flutter/material.dart';

/// Represents the contract for app theme preferences.
abstract class AppThemeService {
  /// Gets the saved theme mode.
  Future<ThemeMode> getThemeMode();

  /// Saves the selected theme mode.
  Future<void> setThemeMode(ThemeMode themeMode);
}
