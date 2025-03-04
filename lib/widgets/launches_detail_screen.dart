import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_x_rocket_launches/models/launches_data_model.dart';
import 'package:space_x_rocket_launches/providers/launches_database_state_providers.dart';
import 'package:space_x_rocket_launches/providers/rockets_list_provider.dart';
import 'package:space_x_rocket_launches/theme/app_colors.dart';
import 'package:space_x_rocket_launches/widgets/rockets_detail_screen.dart';

class LaunchesDetailScreen extends ConsumerWidget {
  const LaunchesDetailScreen({super.key, required this.launch});
  final LaunchesDataModel launch;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //? getting the rocket name by matching the ids-
    final rockets = ref.watch(rocketsListNotifierStateProvider).value!;
    String rocketName = '';
    for (int i = 0; i < rockets.length; i++) {
      if (rockets[i].id == launch.id) {
        rocketName = rockets[i].rocketName;
      }
    }
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 120.h),
        child: Container(
          height: double.maxFinite,
          color: AppColors.darkBackground,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.clear,
                      color: AppColors.darkText,
                      size: 48.sp,
                    )),
                IconButton(
                    onPressed: () => ref
                        .read(launchesDatabaseStateNotifierProvider.notifier)
                        .addLauchesToDataBase(launch),
                    icon: Icon(
                      Icons.bookmark_outline,
                      color: AppColors.darkText,
                      size: 48.sp,
                    )),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BuildTile(
              title: 'Mission Name',
              subtitle: launch.missionName,
            ),
            BuildTile(
              title: 'Rocket Name',
              subtitle: rocketName,
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
                        subtitle:
                            launch.successStatus ? "Successful" : 'Failed')),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    child: BuildTile(
                        title: 'Video Source', subtitle: launch.videoSource)),
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
    );
  }
}
