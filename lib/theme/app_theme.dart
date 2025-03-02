import 'package:flutter/material.dart';
import 'package:space_x_rocket_launches/theme/app_colors.dart';
import 'package:space_x_rocket_launches/theme/text_styles.dart';

ThemeData get appTheme => ThemeData(
    scaffoldBackgroundColor: AppColors.darkBackground,
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.darkPrimary),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.darkPrimary,
        selectedItemColor: AppColors.darkText,
        unselectedItemColor: AppColors.darkSubText,
        showUnselectedLabels: true,
        selectedLabelStyle: AppTextStyles.regular));
