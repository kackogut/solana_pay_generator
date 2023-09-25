import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData getThemeData() => ThemeData(
        colorScheme: _getLightColorScheme(),
        useMaterial3: true,
        textTheme: _getTextTheme(),
      );

  static ThemeData getDarkThemeData() => ThemeData(
        colorScheme: _getDarkColorScheme(),
        useMaterial3: true,
        textTheme: _getTextTheme(),
      );

  static TextTheme _getTextTheme() => const TextTheme(
        titleMedium: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
        titleSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      );

  static ColorScheme _getDarkColorScheme() => const ColorScheme(
        brightness: Brightness.dark,
        primary: AppColors.solanaPurple,
        onPrimary: AppColors.white,
        secondary: AppColors.solanaGreen,
        onSecondary: AppColors.white,
        error: AppColors.red,
        onError: AppColors.white,
        background: AppColors.black,
        onBackground: AppColors.white,
        surface: AppColors.black,
        onSurface: AppColors.white,
      );

  static ColorScheme _getLightColorScheme() => const ColorScheme(
        brightness: Brightness.dark,
        primary: AppColors.solanaPurple,
        onPrimary: AppColors.white,
        secondary: AppColors.solanaGreen,
        onSecondary: AppColors.white,
        error: AppColors.red,
        onError: AppColors.white,
        background: AppColors.black,
        onBackground: AppColors.white,
        surface: AppColors.black,
        onSurface: AppColors.white,
      );
}
