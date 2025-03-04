import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:space_x_rocket_launches/common_exports.dart';
import 'package:space_x_rocket_launches/providers/launches_list_provider.dart';

import 'package:space_x_rocket_launches/widgets/reusable_widgets/custom_tile_widget.dart';
import 'package:space_x_rocket_launches/widgets/data_widgets/launches_detail_screen.dart';

import '../widgets/reusable_widgets/error_state_widget.dart';

//sort type State provider --
final sortTypeProvider = StateProvider<String>((ref) => 'Launch Date');

//Search query provider --
final searchQueryProvider = AutoDisposeStateProvider<String>((ref) => '');

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

                //Search - Bar
                SearchBar(
                  textStyle: WidgetStatePropertyAll(
                      Theme.of(context).textTheme.bodyLarge),
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
                    IconButton(
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                        },
                        icon: const Icon(Icons.search))
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sort Type:',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      //sorting state change here -
                      Consumer(
                        builder: (context, ref, child) {
                          return DropdownButton<String>(
                            value: ref.watch(sortTypeProvider),
                            dropdownColor: AppColors.darkAccent,
                            style: Theme.of(context).textTheme.bodyMedium,
                            borderRadius: BorderRadius.circular(12.r),
                            items: [
                              DropdownMenuItem(
                                value: 'Launch Date',
                                child: Text(
                                  'Launch Date',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'Success Status',
                                child: Text(
                                  'Success Status',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            ],
                            onChanged: (value) {
                              ref.read(sortTypeProvider.notifier).state =
                                  value!;
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),

                const Divider(),
                SizedBox(
                  height: 16.h,
                ),
              ],
            ),
          ),
          //List tiles
          Expanded(
            child: Consumer(
              builder: (context, ref, child) {
                final sortType = ref.watch(sortTypeProvider);
                final launchesList =
                    ref.watch(launchesListNotifierStateProvider);
                final searchQuery = ref.watch(searchQueryProvider);
                return launchesList.when(
                    data: (launchData) {
                      //Filtering the search by name
                      final filteredLaunches = launchData
                          .where((launch) => launch.missionName
                              .toLowerCase()
                              .contains(searchQuery.toLowerCase()))
                          .toList();
                      //Filter the list by type
                      if (sortType == 'Success Status') {
                        filteredLaunches.sort((a, b) {
                          final aSuccess = a.successStatus ? 1 : 0;
                          final bSuccess = b.successStatus ? 1 : 0;
                          return bSuccess.compareTo(aSuccess);
                        });
                      } else {
                        filteredLaunches.sort((a, b) => b.landingDate
                            .split('T')[0]
                            .compareTo(a.landingDate.split('T')[0]));
                      }
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
                    error: (error, stackTrace) {
                      return const ErrorStateWidget();
                    },
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
