import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  ThemeData appTheme() {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: const AppBarTheme(backgroundColor: AppColors.background),
      backgroundColor: AppColors.background,
      primaryColor: AppColors.white,
      brightness: Brightness.dark,
    );
  }
}
