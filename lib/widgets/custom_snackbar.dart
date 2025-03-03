import 'package:flutter/material.dart';
import 'package:space_x_rocket_launches/theme/app_colors.dart';

void customSnackBar(String message, Duration duration, BuildContext context,
    {Color bgColor = AppColors.darkAccent}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: bgColor,
    duration: duration,
  ));
}
