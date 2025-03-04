import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_x_rocket_launches/providers/launches_database_state_providers.dart';
import 'package:space_x_rocket_launches/theme/app_colors.dart';
import 'package:space_x_rocket_launches/widgets/custom_tile_widget.dart';
import 'package:space_x_rocket_launches/widgets/launches_detail_screen.dart';

class SavedLaunchesScreen extends ConsumerWidget {
  const SavedLaunchesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
      ).copyWith(top: 60.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.clear,
                    size: 40.sp,
                    color: AppColors.darkText,
                  )),
              SizedBox(
                width: 20.w,
              ),
              Text(
                'Saved Launches',
                style: Theme.of(context).textTheme.headlineMedium,
              )
            ],
          ),
          Consumer(
            builder: (context, ref, child) {
              final launches = ref.watch(launchesDatabaseStateNotifierProvider);
              return launches.when(
                  data: (data) {
                    return data.isEmpty
                        ? const Center(
                            child: Text('No saved Launches'),
                          )
                        : Expanded(
                            child: ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                final singleData = data[index];
                                return CustomListTileWidget(
                                  name: singleData.missionName,
                                  title: 'Mission Name',
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            LaunchesDetailScreen(
                                              isSaved: false,
                                                launch: singleData),
                                      )),
                                );
                              },
                            ),
                          );
                  },
                  error: (error, stackTrace) => const Center(
                        child: Text('something went wrong!'),
                      ),
                  loading: () => const CircularProgressIndicator(
                        color: Colors.blue,
                      ));
            },
          )
        ],
      ),
    ));
  }
}
