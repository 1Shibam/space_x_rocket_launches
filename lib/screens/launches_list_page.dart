import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_x_rocket_launches/providers/launches_list_provider.dart';
import 'package:space_x_rocket_launches/theme/app_colors.dart';
import 'package:space_x_rocket_launches/widgets/custom_tile_widget.dart';
import 'package:space_x_rocket_launches/widgets/launches_detail_screen.dart';

class LaunchesListPage extends StatelessWidget {
  const LaunchesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          SearchBar(
            elevation: const WidgetStatePropertyAll(20),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r))),
            hintText: 'Search mission',
            hintStyle: WidgetStatePropertyAll(
                Theme.of(context).textTheme.headlineSmall),
            constraints: BoxConstraints.tight(Size(400.w, 64.h)),
            backgroundColor: WidgetStateProperty.all(AppColors.darkAccent),
            trailing: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.search))
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          const Divider(),
          SizedBox(
            height: 16.h,
          ),
          Expanded(
            child: Consumer(
              builder: (context, ref, child) {
                final launchesList =
                    ref.watch(launchesListNotifierStateProvider);
                return launchesList.when(
                    data: (launchData) {
                      return launchData.isEmpty
                          ? const Center(
                              child: Text('The launches were empty'),
                            )
                          : Scrollbar(
                              interactive: true,
                              thickness: 10,
                              radius: Radius.circular(20.r),
                              child: ListView.builder(
                                itemCount: launchData.length,
                                itemBuilder: (context, index) {
                                  final singleLaunch = launchData[index];
                                  return CustomListTileWidget(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  LaunchesDetailScreen(
                                                      launch: singleLaunch),
                                            ));
                                      },
                                      title: 'Mission name',
                                      name: singleLaunch.missionName);
                                },
                              ),
                            );
                    },
                    error: (error, stackTrace) => const Center(
                          child: Text('Something went wrong'),
                        ),
                    loading: () => const Center(
                            child: CircularProgressIndicator(
                          color: Colors.blue,
                        )));
              },
            ),
          )
        ],
      ),
    ));
  }
}
