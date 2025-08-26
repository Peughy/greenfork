import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greenfork/src/constants/app_size.dart';

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

class CustomBorderStyle {
  final Color color;

  const CustomBorderStyle({required this.color});

  InputBorder borderStyle() => OutlineInputBorder(
    borderRadius: BorderRadius.circular(AppSize.radius),
    borderSide: BorderSide(width: AppSize.borderWidth, color: color),
  );
}
