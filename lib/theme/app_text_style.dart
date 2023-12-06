import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flight/theme/app_colors.dart';

class AppTextStyle {
  const AppTextStyle._();

  /// Display - 82/Bold
  static final appBar = GoogleFonts.sourceCodePro(
    textStyle: const TextStyle(
      color: AppColors.primary,
      letterSpacing: .5,
      fontSize: 26,
      fontWeight: FontWeight.bold,
    ),
  );

  static final text = GoogleFonts.sourceCodePro(
    textStyle: const TextStyle(
      color: AppColors.text,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  );

  /// Display - 82/Semi-Bold
  static final xAndO = GoogleFonts.rubikBubbles(
    textStyle: const TextStyle(
      color: AppColors.primary,
      fontSize: 60,
      fontWeight: FontWeight.bold,
    ),
  );
}
