import 'package:flutter/material.dart';

/// Represents the light theme for the application
final lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: const Color(0xFFF5F5F5),
  colorScheme: const ColorScheme.light(
    brightness: .light,
    primary: Color.fromARGB(255, 71, 131, 251),
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color.fromARGB(255, 16, 9, 150),
    onSecondary: Color.fromARGB(255, 151, 151, 151),
    error: Color(0xFFB71C1C),
    onError: Color(0xFFFFFFFF),
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFF212121),
  ),
);

/// Represents the dark theme for the application
final darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFF121212),
  colorScheme: const ColorScheme.dark(
    brightness: Brightness.dark,
    primary: Color(0xFF4783FB), 
    onPrimary: Color(0xFFFFFFFF), 
    secondary: Color(0xFF297DD2),
    onSecondary: Color.fromARGB(255, 127, 127, 127),
    error: Color(0xFFEF9A9A),
    onError: Color(0xFF000000),
    surface: Color(0xFF1E1E1E), 
    onSurface: Color(0xFFE0E0E0),
  ),
);