import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:space_x_rocket_launches/common_exports.dart';
import 'package:space_x_rocket_launches/providers/launches_list_provider.dart';
import 'package:space_x_rocket_launches/providers/search_query_providre.dart';
import 'package:space_x_rocket_launches/widgets/reusable_widgets/custom_tile_widget.dart';
import 'package:space_x_rocket_launches/widgets/data_widgets/launches_detail_screen.dart';

class LaunchesListPage extends ConsumerWidget {
  const LaunchesListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            color: AppColors.darkBackground,
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                SearchBar(
                  onChanged: (value) {
                    ref.read(searchQueryProvider.notifier).state = value;
                  },
                  elevation: const WidgetStatePropertyAll(20),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r))),
                  hintText: 'Search mission',
                  hintStyle: WidgetStatePropertyAll(
                      Theme.of(context).textTheme.headlineSmall),
                  constraints: BoxConstraints.tight(Size(400.w, 64.h)),
                  backgroundColor:
                      WidgetStateProperty.all(AppColors.darkAccent),
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
              ],
            ),
          ),
          Expanded(
            child: Consumer(
              builder: (context, ref, child) {
                final launchesList =
                    ref.watch(launchesListNotifierStateProvider);
                final searchQuery = ref.watch(searchQueryProvider);
                return launchesList.when(
                    data: (launchData) {
                      final filteredLaunches = launchData
                          .where((launch) => launch.missionName
                              .toLowerCase()
                              .contains(searchQuery.toLowerCase()))
                          .toList();
                      return filteredLaunches.isEmpty
                          ? const Center(
                              child: Text('No matching results'),
                            )
                          : Scrollbar(
                              interactive: true,
                              thickness: 10,
                              radius: Radius.circular(20.r),
                              child: ListView.builder(
                                itemCount: filteredLaunches.length,
                                itemBuilder: (context, index) {
                                  final singleLaunch = filteredLaunches[index];

                                  false;
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
