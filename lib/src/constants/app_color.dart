import 'package:flutter/material.dart';

class AppColor {
  static Map<int, Color> primary = {
    100: Color.fromRGBO(76, 175, 80, 0.1),
    200: Color.fromRGBO(76, 175, 80, 0.2),
    300: Color.fromRGBO(76, 175, 80, 0.3),
    400: Color.fromRGBO(76, 175, 80, 0.4),
    500: Color.fromRGBO(76, 175, 80, 0.5),
    600: Color.fromRGBO(76, 175, 80, 0.6),
    700: Color.fromRGBO(76, 175, 80, 0.7),
    800: Color.fromRGBO(76, 175, 80, 0.8),
    900: Color.fromRGBO(76, 175, 80, 0.9),
  };
  static Color validation = Color(0xFF00AEFF);
  static Color error = Color(0xFFFF0000);
  static Color white = Color(0xFFFFFFFF);
  static Color black = Color(0xFF000000);

  static Color? bgWhite = Colors.grey[200];
  static Color bgDark = Color(0xFF2E2E2E);
}
