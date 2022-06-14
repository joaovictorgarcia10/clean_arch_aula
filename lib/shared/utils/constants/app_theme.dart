import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  ThemeData appTheme() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: const AppBarTheme(backgroundColor: AppColors.background),
      backgroundColor: AppColors.background,
      primarySwatch: Colors.grey,
      brightness: Brightness.dark,
    );
  }
}
