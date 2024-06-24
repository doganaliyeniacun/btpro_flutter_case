import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color.fromARGB(255, 231, 81, 70),
      onPrimary: Color.fromARGB(255, 231, 81, 70),
      secondary: Colors.white,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.red,
      surface: Colors.black,
      onSurface: Colors.black,      
    ),    
  );
}
