import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_x_rocket_launches/models/launches_data_model.dart';
import 'package:space_x_rocket_launches/providers/launches_database_state_providers.dart';
import 'package:space_x_rocket_launches/theme/app_colors.dart';

class LaunchesDetailScreen extends StatelessWidget {
  const LaunchesDetailScreen({super.key, required this.launch});
  final LaunchesDataModel launch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.clear,
                          color: AppColors.darkText,
                          size: 48.sp,
                        )),
                    Consumer(
                      builder: (context, ref, child) {
                        return IconButton(
                            onPressed: () {
                              ref
                                  .read(launchesDatabaseStateNotifierProvider
                                      .notifier)
                                  .addLauchesToDataBase(launch);
                            },
                            icon: Icon(
                              Icons.bookmark_outline,
                              color: AppColors.darkText,
                              size: 48.sp,
                            ));
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                BuildTile(
                  title: 'Mission Name',
                  subtitle: launch.missionName,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                        child: BuildTile(
                            title: 'Launch Date',
                            subtitle: launch.landingDate.split('T')[0])),
                    Expanded(
                        child: BuildTile(
                            title: 'Status',
                            subtitle: launch.successStatus
                                ? "Successful"
                                : 'Failed')),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                        child: BuildTile(
                            title: 'Video Source',
                            subtitle: launch.videoSource)),
                    Expanded(
                        child: BuildTile(
                            title: 'Article Source',
                            subtitle: launch.articleSoruce)),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                        child: BuildTile(
                            title: 'Wikipedia Source',
                            subtitle: launch.wikipediaSource)),
                  ],
                ),
              ],
            ),
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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
      child: ListTile(
        tileColor: AppColors.darkAccent,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        title: Text(
          title,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
