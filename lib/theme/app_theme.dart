import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF6C4DFF);
  static const primaryLight = Color(0xFF8E6BFF);
  static const accent = Color(0xFF00C2A8);
  static const correct = Color(0xFF22C55E);
  static const wrong = Color(0xFFEF4444);
}

class AppTheme {
  static ThemeData _build(Brightness brightness) {
    final scheme = ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: brightness,
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      fontFamily: 'Poppins', // font kustom dari assets/fonts
    );
  }

  static ThemeData get light => _build(Brightness.light);
  static ThemeData get dark => _build(Brightness.dark);
}
