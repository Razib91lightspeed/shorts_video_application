import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData dark() {
    const seed = Colors.white;
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: seed,
        brightness: Brightness.dark,
      ),
      useMaterial3: true,
      scaffoldBackgroundColor: const Color(0xFF0B0B0F),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF0B0B0F),
        elevation: 0,
      ),
    );
  }
}
