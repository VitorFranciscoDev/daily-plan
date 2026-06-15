import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: const Color(0xFFF5F5F5),
  colorScheme: const ColorScheme.light(
    brightness: .light,
    primary: Color.fromARGB(255, 71, 131, 251),
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color.fromARGB(255, 16, 9, 150),
    onSecondary: Color(0xFFFFFFFF),
    error: Color(0xFFB71C1C),
    onError: Color(0xFFFFFFFF),
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFF212121),
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFF121212),
  colorScheme: const ColorScheme.dark(
    brightness: .dark,
    primary: Color.fromARGB(255, 0, 17, 83),
    onPrimary: Color(0xFF000000),
    secondary: Color.fromARGB(255, 23, 94, 165),
    onSecondary: Color(0xFFFFFFFF),
    error: Color(0xFFEF9A9A),
    onError: Color(0xFF000000),
    surface: Color(0xFF1E1E1E),
    onSurface: Color(0xFFE0E0E0),
  ),
);