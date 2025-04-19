import 'package:flutter/material.dart';

class MaliyaColors {
  // Base colors
  static const Color white = Colors.white;
  static const Color black = Colors.black;

  // Primary colors
  static const Color primary = Color(0xFF6B5AED);
  static const Color secondary = Color(0xFF263238);

  // Dark colors
  static const Color background = Color(0xFF0D0D0D);
  static const Color lightText = Color(0xFFC7D3D9);
  static const Color n1 = Color(0xFF262B3D);

  // Grey colors;
  static const Color grey = Color(0xFF808486);
  static const Color grey2 = Color(0xFFCED3D5);
  static const Color grey1 = Color(0xFFD9D9D9);
  static const Color grey3 = Color(0xFFEFEFEF);
  static const Color grey4 = Color(0xFFF7F7F7);

  // Others Colors
  static const Color green = Color(0xFF3ACC6C);
  static const Color success = Color(0xFF03BE42);
  static const Color green2 = Color(0xFF4CE364);
  static const Color green100 = Color(0xFFCDFFDE);
  static const Color red = Color(0xFFF90402);
  static const Color red100 = Color(0xFFFEDDDD);
  static const Color blue = Color(0xFF0061FF);
  static const Color lightBlue = Color(0xFF00A3FF);
  static const Color lightBlue1 = Color(0xff0EA9B3);
  static const Color lightBlue2 = Color(0xFF60EFFF);
  static const Color lightBlue3 = Color(0xFFE7F6FF);
  static const Color sunny = Color(0xFFFFB800);
  static const Color navyDark = Color(0xFF0A134A);
  static const Color orange = Color(0xFFFFb800);
  static const Color brown = Color(0xFFC35D00);

  static MaterialColor createMaterialColor(Color color) {
    final strengths = <double>[.05];
    final swatch = <int, Color>{};
    final r = color.red;
    final g = color.green;
    final b = color.blue;

    for (var i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (final strength in strengths) {
      final ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}
