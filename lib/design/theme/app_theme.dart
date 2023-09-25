import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getThemeData() => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: _getTextTheme(),
      );

  static TextTheme _getTextTheme() => const TextTheme(
        titleMedium: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
        titleSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      );
}
