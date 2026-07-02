import 'package:daily_plan/services/theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

AppThemeService newAppThemeService() {
  return _AppThemeService();
}

class _AppThemeService implements AppThemeService {
  static const _themeModeKey = 'theme_mode';

  final _preferences = SharedPreferencesAsync();

  @override
  Future<ThemeMode> getThemeMode() async {
    final themeModeName = await _preferences.getString(_themeModeKey);

    return ThemeMode.values.firstWhere(
      (themeMode) => themeMode.name == themeModeName,
      orElse: () => ThemeMode.system,
    );
  }

  @override
  Future<void> setThemeMode(ThemeMode themeMode) async {
    await _preferences.setString(_themeModeKey, themeMode.name);
  }
}
