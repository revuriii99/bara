import 'package:flutter/material.dart';

class AppColors {
  static const Color primary1 = Color(0xFF2163AE);
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primary1,
      scaffoldBackgroundColor: Colors.white,
      useMaterial3: true,
    );
  }
}