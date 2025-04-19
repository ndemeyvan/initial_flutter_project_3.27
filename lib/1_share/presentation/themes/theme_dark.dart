import 'package:flutter/material.dart';

class ThemeDark {
  ThemeData data() {
    return ThemeData.dark(useMaterial3: true).copyWith(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFFC58C46), // This will set primary color
        primary: const Color(0xFFC58C46),
        brightness: Brightness.light,
      ),
      primaryColor: Color(0xFFC58C46), // Optional for backward compatibility
      primaryColorDark: Colors.black,
      primaryColorLight: Colors.white,
    );
  }
}
