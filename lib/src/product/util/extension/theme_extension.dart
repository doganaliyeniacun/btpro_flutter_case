import 'package:flutter/material.dart';

extension ThemeExtensions on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}
