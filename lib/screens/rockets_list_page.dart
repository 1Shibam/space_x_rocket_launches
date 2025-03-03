import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_x_rocket_launches/providers/rockets_list_provider.dart';

class RocketsListPage extends ConsumerWidget {
  const RocketsListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rocketsList = ref.watch(rocketsListNotifierStateProvider);
    return Scaffold(
      body: rocketsList.when(
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
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              title: Text(
                                singleLaunch.rocketName,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            Divider(
                              color: Theme.of(context).primaryColorDark,
                            )
                          ],
                        );
                      },
                    ),
                  );
          },
          error: (error, stackTrace) => const Center(
                child: Text('Something went wrong'),
              ),
          loading: () => const Center(child: CircularProgressIndicator())),
    );
  }
}
