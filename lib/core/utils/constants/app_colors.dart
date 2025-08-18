import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Brand Colors
  static const Color primary = Color(0xFFFFCE1B);
  static Color secondary = Color(0xffFFECC8);
  static Color scaffoldBGColor = Color(0xffF9F9F9);

  // Gradient Colors
  static const Gradient linearGradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [Color(0xfffffa9e), Color(0xFFFAD0C4), Color(0xFFFAD0C4)],
  );

  // Text Colors
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF636F85);
  static const Color white = Color(0xFFFFFFFF);

  // Container
  static const Color containerBorder = Color(0xFFE5E7EC);

  // Background Colors
  static const Color primaryBackGround = Color(0xffF9F9F9);

  static const Color textFormFieldBorder = Color(0xFFD1D6DB);
}
