import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:space_x_rocket_launches/common_exports.dart';

import 'package:space_x_rocket_launches/models/rockets_data_model.dart';
import 'package:space_x_rocket_launches/providers/rockets_database_state_providers.dart';

import 'package:space_x_rocket_launches/widgets/reusable_widgets/url_icon_button.dart';

import '../reusable_widgets/build_tile.dart';

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
    final savedRocketsAsync = ref.watch(rocketsDatabaseStateNotifierProvider);
    final bool isSaved = savedRocketsAsync.when(
      data: (savedList) =>
          savedList.any((dbRocket) => dbRocket.id == widget.rocket.id),
      error: (_, __) => false,
      loading: () => false,
    );
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Scaffold(
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
                      onPressed: () => context.pop(),
                      icon: Icon(
                        Icons.clear,
                        color: AppColors.darkText,
                        size: 48.sp,
                      )),
                  isSaved
                      ? IconButton(
                          onPressed: () async {
                            await ref
                                .read(rocketsDatabaseStateNotifierProvider
                                    .notifier)
                                .deleteRocketsFromTheDataBase(widget.rocket.id);
                            if (context.mounted) {
                              customSnackBar(
                                  'Rocket removed form Saved', 2, context,
                                  bgColor: AppColors.errorRed);
                            }
                          },
                          icon: Icon(
                            Icons.bookmark,
                            color: AppColors.darkText,
                            size: 48.sp,
                          ))
                      : IconButton(
                          onPressed: () async {
                            await ref
                                .read(rocketsDatabaseStateNotifierProvider
                                    .notifier)
                                .addRocketsToDataBase(widget.rocket);
                            if (context.mounted) {
                              customSnackBar('Rocket Saved', 2, context,
                                  bgColor: AppColors.green);
                            }
                          },
                          icon: Icon(
                            Icons.bookmark_outline,
                            color: AppColors.darkText,
                            size: 48.sp,
                          ))
                ],
              ),
            ),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                BuildRow(
                  first: BuildTile(
                      title: 'Rocket Name', subtitle: widget.rocket.rocketName),
                  second: BuildTile(
                      title: 'Country', subtitle: widget.rocket.country),
                ),
                BuildRow(
                  first: BuildTile(
                      title: 'First Launch',
                      subtitle: widget.rocket.firstLaunch.split('T')[0]),
                  second: BuildTile(
                      title: 'Cost Per Launch',
                      subtitle: '\$${widget.rocket.costPerLaunch.toString()}'),
                ),
                BuildRow(
                  first: BuildTile(
                      title: 'Success Rate',
                      subtitle: '${widget.rocket.successRate.toString()}%'),
                  second: BuildTile(
                      title: 'Status',
                      subtitle:
                          widget.rocket.activeStatus ? "Active" : 'Inactive'),
                ),
                UrlIconButton(
                    imageUrl: 'assets/images/wikipedia copy.svg',
                    link: widget.rocket.wikipediaSource,
                    title: 'Wikipedia Source'),
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

class BuildRow extends StatelessWidget {
  const BuildRow({super.key, required this.first, required this.second});
  final Widget first;
  final Widget second;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(child: first),
        SizedBox(
          width: 4.w,
        ),
        Expanded(child: second)
      ],
    );
  }
}
