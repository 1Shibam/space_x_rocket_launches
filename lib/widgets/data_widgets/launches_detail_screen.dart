import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:space_x_rocket_launches/common_exports.dart';
import 'package:space_x_rocket_launches/models/launches_data_model.dart';
import 'package:space_x_rocket_launches/providers/launches_database_state_providers.dart';
import 'package:space_x_rocket_launches/widgets/widgets_export.dart';

class LaunchesDetailScreen extends ConsumerWidget {
  const LaunchesDetailScreen({super.key, required this.launch});
  final LaunchesDataModel launch;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savedLaunchAsync = ref.watch(launchesDatabaseStateNotifierProvider);
    final bool isSaved = savedLaunchAsync.when(
      data: (savedList) => savedList
          .any((dbLaunch) => dbLaunch.flightNumber == launch.flightNumber),
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
                                .read(launchesDatabaseStateNotifierProvider
                                    .notifier)
                                .deleteLaunchesFromDataBase(
                                    launch.flightNumber);
                            if (context.mounted) {
                              customSnackBar(
                                  'Launch removed from saved', 2, context,
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
                                .read(launchesDatabaseStateNotifierProvider
                                    .notifier)
                                .addLauchesToDataBase(launch);
                            if (context.mounted) {
                              customSnackBar('Launch Saved', 2, context,
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
                title: 'Flight Number',
                subtitle: launch.flightNumber.toString(),
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
                      child: UrlIconButton(
                    title: 'Video source',
                    imageUrl: 'assets/images/youtube link.svg',
                    link: launch.videoSource,
                  )),
                  Expanded(
                      child: UrlIconButton(
                    title: 'Article source',
                    imageUrl: 'assets/images/read article.svg',
                    link: launch.articleSoruce,
                  )),
                ],
              ),
              UrlIconButton(
                title: 'Wikipedia source',
                imageUrl: 'assets/images/wikipedia copy.svg',
                link: launch.wikipediaSource,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
