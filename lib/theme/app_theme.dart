import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_x_rocket_launches/theme/app_colors.dart';
import 'package:space_x_rocket_launches/theme/text_styles.dart';

ThemeData get appTheme => ThemeData(
    scaffoldBackgroundColor: AppColors.darkBackground,
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.darkPrimary),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: AppColors.darkPrimary,
    ),
    textTheme: TextTheme(
      headlineLarge: AppTextStyles.largeTitle,
      headlineMedium: AppTextStyles.largeTitle.copyWith(fontSize: 28.sp),
      headlineSmall: AppTextStyles.largeTitle.copyWith(fontSize: 24.sp),
      bodyLarge: AppTextStyles.medium.copyWith(fontSize: 24.sp),
      bodyMedium: AppTextStyles.medium,
      bodySmall: AppTextStyles.medium.copyWith(fontSize: 16.sp),
      displayLarge: AppTextStyles.regular.copyWith(fontSize: 24.sp),
      displayMedium: AppTextStyles.regular.copyWith(fontSize: 20.sp),
      displaySmall: AppTextStyles.regular,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.darkPrimary,
        selectedItemColor: AppColors.darkText,
        unselectedItemColor: AppColors.darkSubText,
        showUnselectedLabels: true,
        selectedLabelStyle: AppTextStyles.regular));
