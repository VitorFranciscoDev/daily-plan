import 'package:daily_plan/services/theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

AppThemeService newAppThemeService() {
  return _AppThemeService();
}

class _AppThemeService implements AppThemeService {
  static const _themeModeKey = 'theme_mode';
  static const _taskContainerLayoutKey = 'task_container_layout';

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

  @override
  Future<TaskContainerLayout> getTaskContainerLayout() async {
    final layoutName = await _preferences.getString(_taskContainerLayoutKey);

    return TaskContainerLayout.values.firstWhere(
      (layout) => layout.name == layoutName,
      orElse: () => TaskContainerLayout.minimal,
    );
  }

  @override
  Future<void> setTaskContainerLayout(TaskContainerLayout layout) async {
    await _preferences.setString(_taskContainerLayoutKey, layout.name);
  }
}
