import 'package:flutter/material.dart';
import 'package:space_x_rocket_launches/theme/app_colors.dart';

void customSnackBar(String message, int duration, BuildContext context,
    {Color bgColor = AppColors.darkAccent}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: bgColor,
    duration: Duration(seconds: duration),
  ));
}
