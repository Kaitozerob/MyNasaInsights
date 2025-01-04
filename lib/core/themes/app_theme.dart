import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    useMaterial3: true,
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(fontSize: 16, color: Colors.black),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
    useMaterial3: true,
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
      bodyLarge: TextStyle(fontSize: 16, color: Colors.white),
    ),
  );
}