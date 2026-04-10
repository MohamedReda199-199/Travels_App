import 'package:flutter/material.dart';

abstract final class AppColors {
  // Primary Orange Palette
  static const Color primaryOrange = Color(0xFFE07B2A);
  static const Color primaryOrangeLight = Color(0xFFFFB367);
  static const Color primaryOrangeDark = Color(0xFFB85C1A);
  static const Color primaryOrangePale = Color(0xFFFFF5ED);

  // Background Colors
  static const Color scaffoldBackground = Color(0xFFF8F9FA);
  static const Color cardBackground = Colors.white;
  static const Color surfaceColor = Colors.white;

  // Text Colors
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF666666);
  static const Color textLight = Color(0xFF999999);

  // Accent Colors
  static const Color accentGreen = Color(0xFF25D366);
  static const Color accentRed = Color(0xFFE74C3C);
  static const Color accentYellow = Color(0xFFF4D03F);

  // Gradient Colors
  static const List<Color> orangeGradient = [
    Color(0xFFFF9A56),
    Color(0xFFE07B2A),
  ];
}
