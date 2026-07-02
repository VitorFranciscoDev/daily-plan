import 'package:flutter/material.dart';

/// Available layouts for task containers.
enum TaskContainerLayout { normal, minimal }

/// Represents the contract for app theme preferences.
abstract class AppThemeService {
  /// Gets the saved theme mode.
  Future<ThemeMode> getThemeMode();

  /// Saves the selected theme mode.
  Future<void> setThemeMode(ThemeMode themeMode);

  /// Gets the saved task container layout.
  Future<TaskContainerLayout> getTaskContainerLayout();

  /// Saves the selected task container layout.
  Future<void> setTaskContainerLayout(TaskContainerLayout layout);
}
