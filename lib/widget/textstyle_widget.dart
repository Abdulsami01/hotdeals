import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotdealsgemet/core/app_rss/app_colors.dart';

TextStyle textStyleWidget({
  Color color: AppColors.primaryTextColor,
  double letterSpacing: 1.0,
  double fontSize: 15.0,
  FontWeight fontWeight: FontWeight.normal,
  bool isUnderline: false,
}) {
  return GoogleFonts.poppins(
    color: color,
    letterSpacing: letterSpacing,
    fontWeight: fontWeight,
    fontSize: fontSize,
    decoration: isUnderline ? TextDecoration.underline : TextDecoration.none,
  );
}
