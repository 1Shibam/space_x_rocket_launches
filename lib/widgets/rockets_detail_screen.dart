import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_x_rocket_launches/models/rockets_data_model.dart';
import 'package:space_x_rocket_launches/providers/rockets_database_state_providers.dart';

import 'package:space_x_rocket_launches/theme/app_colors.dart';

class RocketDetailScreen extends ConsumerStatefulWidget {
  const RocketDetailScreen({super.key, required this.rocket});
  final RocketsDataModel rocket;

  @override
  ConsumerState<RocketDetailScreen> createState() => _RocketDetailScreenState();
}

class _RocketDetailScreenState extends ConsumerState<RocketDetailScreen> {
  bool isMetric = true;

  @override
  Widget build(BuildContext context) {
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
                        .read(rocketsDatabaseStateNotifierProvider.notifier)
                        .addRocketsToDataBase(widget.rocket),
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
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                BuildTile(
                    title: 'Rocket Name', subtitle: widget.rocket.rocketName),
                BuildTile(
                    title: 'First Launch',
                    subtitle: widget.rocket.firstLaunch.split('T')[0]),
                BuildTile(
                    title: 'Status',
                    subtitle:
                        widget.rocket.activeStatus ? "Active" : 'Inactive'),
                BuildTile(
                    title: 'Cost Per Launch',
                    subtitle: '\$${widget.rocket.costPerLaunch.toString()}'),
                BuildTile(
                    title: 'Success Rate',
                    subtitle: '${widget.rocket.successRate.toString()}%'),
                BuildTile(title: 'Country', subtitle: widget.rocket.country),
                BuildTile(
                    title: 'Wikipedia Source',
                    subtitle: widget.rocket.wikipediaSource),
                BuildTile(
                    title: 'Description', subtitle: widget.rocket.description),
                const Divider(),
                Row(
                  children: [
                    const Text('Change Units'),
                    SizedBox(width: 12.w),
                    Switch(
                      value: isMetric,
                      onChanged: (value) {
                        setState(() {
                          isMetric = value;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: BuildTile(
                            title: 'Height',
                            subtitle:
                                '${isMetric ? widget.rocket.heightInMeters : widget.rocket.heightInFeets} ${isMetric ? "m" : "ft"}')),
                    Expanded(
                        child: BuildTile(
                            title: 'Diameter',
                            subtitle:
                                '${isMetric ? widget.rocket.diameterInMeter : widget.rocket.diameterInFeets} ${isMetric ? "m" : "ft"}')),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: BuildTile(
                            title: 'Mass',
                            subtitle:
                                '${isMetric ? widget.rocket.massInKg : widget.rocket.massInLbs} ${isMetric ? "kg" : "lbs"}')),
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
