import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  final double fontSize;
  FontWeight? fontWeight = FontWeight.normal;
  Color? color;
  double? letterSpacing;

  AppStyle({
    required this.fontSize,
    this.fontWeight,
    this.color,
    this.letterSpacing,
  });

  TextStyle simpleTextStyle() => GoogleFonts.lato(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    letterSpacing: letterSpacing,
  );

  TextStyle titleTextStyle() => GoogleFonts.dmSerifDisplay(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    letterSpacing: letterSpacing,
  );
}
