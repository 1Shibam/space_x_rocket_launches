import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_x_rocket_launches/models/launches_data_model.dart';
import 'package:space_x_rocket_launches/theme/app_colors.dart';

class LaunchesDetailScreen extends StatelessWidget {
  const LaunchesDetailScreen({super.key, required this.launchesDataModel});
  final LaunchesDataModel launchesDataModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.clear,
                color: AppColors.darkText,
                size: 48.sp,
              )),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [],
      ),
    );
  }
}
