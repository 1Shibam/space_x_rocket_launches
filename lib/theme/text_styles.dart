import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_x_rocket_launches/theme/app_colors.dart';
import 'package:space_x_rocket_launches/theme/fonts.dart';

class AppTextStyles {
  // Regular TextStyle

  static TextStyle regular = TextStyle(
    fontFamily: AppFonts.regular,
    fontSize: 16.sp, // Using ScreenUtil for responsive font size
    color: AppColors.darkText,
  );

  // Medium TextStyle
  static TextStyle medium = TextStyle(
    fontFamily: AppFonts.medium,
    fontSize: 18.sp,
    color: AppColors.darkText,
  );

  // Bold TextStyle
  static TextStyle bold = TextStyle(
      fontFamily: AppFonts.bold, fontSize: 20.sp, color: AppColors.darkText);

  // Large Title TextStyle (Bold and Large)
  static TextStyle largeTitle = TextStyle(
      fontFamily: AppFonts.bold, fontSize: 32.sp, color: AppColors.darkText);

  // Subheading TextStyle (Medium and slightly smaller)
  static TextStyle subheading = TextStyle(
      fontFamily: AppFonts.medium,
      fontSize: 14.sp,
      color: AppColors.darkSubText);

  // Description TextStyle (Regular with smaller font)
  static TextStyle description = TextStyle(
      fontFamily: AppFonts.regular,
      fontSize: 12.sp,
      color: AppColors.darkSubText);
}
