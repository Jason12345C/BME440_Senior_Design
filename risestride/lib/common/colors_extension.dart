import 'package:flutter/material.dart';

class ThemeColors {
  static Color get primaryColor1 => const Color.fromRGBO(187, 224, 226, 1.0);
  static Color get primaryColor2 => const Color.fromRGBO(173, 188, 230, 1.0);
  static Color get primaryColor3 => const Color.fromRGBO(173, 230, 216, 1.0);

  static List<Color> get primaryG =>
      [primaryColor1, primaryColor2, primaryColor3];

  static Color get black => const Color(0xff1D1617);
  static Color get gray => const Color(0xff786F72);
  static Color get white => Colors.white;
}
