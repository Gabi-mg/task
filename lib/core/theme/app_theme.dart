import 'package:flutter/material.dart';

class AppTheme {
  static ColorScheme colorSchemeLight = const ColorScheme(
    brightness: Brightness.light,
    primary: Colors.indigo,
    onPrimary: Colors.black,
    secondary: Colors.white,
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.red,
    background: Colors.blue,
    onBackground: Colors.amber,
    surface: Colors.green,
    onSurface: Colors.black,
  );

  static ThemeData themeData() {
    return ThemeData.light().copyWith(
      colorScheme: colorSchemeLight,
      scaffoldBackgroundColor: colorSchemeLight.secondary,
      appBarTheme: AppBarTheme(
        color: colorSchemeLight.primary,
        elevation: 0,
        foregroundColor: colorSchemeLight.secondary,
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        border: const OutlineInputBorder(),
        errorStyle: TextStyle(color: colorSchemeLight.error),
      ),
    );
  }
}
