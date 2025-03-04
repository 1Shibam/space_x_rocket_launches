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
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              BuildTile(
                title: 'Mission Name',
                subtitle: launchesDataModel.missionName,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                      child: BuildTile(
                          title: 'Web Cast',
                          subtitle: launchesDataModel.videoSource))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BuildTile extends StatelessWidget {
  const BuildTile({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: AppColors.darkAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}
