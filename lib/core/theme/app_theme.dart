import 'package:door_care/core/theme/color/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData theme = ThemeData(
    scaffoldBackgroundColor: AppColor.background,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w900,
        fontSize: 28,
      ),
      displayMedium: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w800,
        letterSpacing: .5,
        fontSize: 25,
      ),
      displaySmall: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w800,
        fontSize: 23,
      ),
      headlineLarge: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 22,
      ),
      headlineMedium: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
      headlineSmall: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 19,
      ),
      titleLarge: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
      titleMedium: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 17,
      ),
      titleSmall: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
      labelLarge: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 15,
      ),
      labelMedium: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      labelSmall: TextStyle(
        color: Colors.black,
        fontSize: 13,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      bodySmall: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 13,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColor.background,
    ),
    tabBarTheme: const TabBarTheme(dividerColor: Colors.transparent),
    appBarTheme: const AppBarTheme(backgroundColor: AppColor.background),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primary,
        foregroundColor: AppColor.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );
}
