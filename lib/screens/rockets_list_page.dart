import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_x_rocket_launches/providers/rockets_list_provider.dart';
import 'package:space_x_rocket_launches/widgets/reusable_widgets/custom_tile_widget.dart';
import 'package:space_x_rocket_launches/widgets/data_widgets/rockets_detail_screen.dart';
import 'package:space_x_rocket_launches/widgets/reusable_widgets/error_state_widget.dart';

class RocketsListPage extends ConsumerWidget {
  const RocketsListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rocketsList = ref.watch(rocketsListNotifierStateProvider);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Scaffold(
        body: rocketsList.when(
            data: (rocketData) {
              return rocketData.isEmpty
                  ? const Center(
                      child: Text('The launches were empty'),
                    )
                  : Scrollbar(
                      interactive: true,
                      thickness: 10,
                      radius: Radius.circular(20.r),
                      child: ListView.builder(
                        itemCount: rocketData.length,
                        itemBuilder: (context, index) {
                          final singleRocket = rocketData[index];
                          return CustomListTileWidget(
                            name: singleRocket.rocketName,
                            title: 'Rocket Name',
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      RocketDetailScreen(rocket: singleRocket),
                                )),
                          );
                        },
                      ),
                    );
            },
            error: (error, stackTrace) => const ErrorStateWidget(),
            loading: () => const Center(child: CircularProgressIndicator())),
      ),
    );
  }
}
