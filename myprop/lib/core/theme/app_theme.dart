import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: 'Poppins',
      useMaterial3: true,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontSize: 18),
        bodyMedium: TextStyle(fontSize: 16),
        titleLarge: TextStyle(fontWeight: FontWeight.bold),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.green,
          backgroundColor: Colors.green[50],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11),
          )
        )
      )
    );
  }
}