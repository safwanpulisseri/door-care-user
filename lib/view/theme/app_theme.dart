import 'package:door_care/view/theme/color/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData theme = ThemeData(
      scaffoldBackgroundColor: AppColor.background,
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w900,
          fontSize: 28,
        ),
        displayMedium: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w800,
          letterSpacing: .5,
          fontSize: 25,
        ),
        displaySmall: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w800,
          fontSize: 23,
        ),
        headlineLarge: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 22,
        ),
        headlineMedium: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
        headlineSmall: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 19,
        ),
        titleLarge: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
        titleMedium: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 17,
        ),
        titleSmall: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
        labelLarge: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
        labelMedium: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        labelSmall: TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        bodyMedium: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        bodySmall: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColor.background,
      ),
      tabBarTheme: const TabBarTheme(dividerColor: Colors.transparent),
      appBarTheme: AppBarTheme(backgroundColor: AppColor.background));
}
