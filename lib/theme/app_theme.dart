import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_x_rocket_launches/theme/app_colors.dart';
import 'package:space_x_rocket_launches/theme/fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: LightColors.lightPrimary,
    hintColor: LightColors.lightAccent,
    scaffoldBackgroundColor: LightColors.lightBackground,
    textTheme: TextTheme(
      bodyLarge: _buildTextStyle(LightColors.lightText, AppFonts.regular),
      bodyMedium: _buildTextStyle(LightColors.lightSubText, AppFonts.regular),
      displayLarge: _buildTextStyle(LightColors.lightText, AppFonts.bold,
          fontSize: 24.sp),
      displayMedium: _buildTextStyle(LightColors.lightSubText, AppFonts.medium,
          fontSize: 22.sp),
      displaySmall: _buildTextStyle(LightColors.lightText, AppFonts.regular,
          fontSize: 20.sp),
    ),
    appBarTheme: AppBarTheme(
      color: LightColors.lightPrimary,
      titleTextStyle: _buildTextStyle(LightColors.lightText, AppFonts.bold),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: LightColors.lightAccent,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: DarkColors.darkPrimary,
    hintColor: DarkColors.darkAccent,
    scaffoldBackgroundColor: DarkColors.darkBackground,
    textTheme: TextTheme(
      bodyLarge: _buildTextStyle(DarkColors.darkText, AppFonts.regular),
      bodyMedium: _buildTextStyle(DarkColors.darkSubText, AppFonts.regular),
      displayLarge:
          _buildTextStyle(DarkColors.darkText, AppFonts.bold, fontSize: 24.sp),
      displayMedium: _buildTextStyle(DarkColors.darkSubText, AppFonts.medium,
          fontSize: 22.sp),
      displaySmall: _buildTextStyle(DarkColors.darkText, AppFonts.regular,
          fontSize: 20.sp),
    ),
    appBarTheme: AppBarTheme(
      color: DarkColors.darkPrimary,
      titleTextStyle: _buildTextStyle(DarkColors.darkText, AppFonts.bold),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: DarkColors.darkAccent,
    ),
  );

  // Helper function to create TextStyle
}

TextStyle _buildTextStyle(Color color, String fontFamily,
    {double fontSize = 16}) {
  return TextStyle(
    color: color,
    fontFamily: fontFamily,
    fontSize: fontSize.sp,
    fontWeight: FontWeight.normal,
  );
}
