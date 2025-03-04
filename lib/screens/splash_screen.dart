import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:space_x_rocket_launches/common_exports.dart';
import 'package:space_x_rocket_launches/providers/launches_database_state_providers.dart';
import 'package:space_x_rocket_launches/providers/launches_list_provider.dart';
import 'package:space_x_rocket_launches/providers/rockets_database_state_providers.dart';
import 'package:space_x_rocket_launches/providers/rockets_list_provider.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    Future.delayed(const Duration(seconds: 2), () async {
      //awaiting on the app startup
      await ref
          .read(launchesListNotifierStateProvider.notifier)
          .fetchLaunchesList();
      await ref
          .read(rocketsListNotifierStateProvider.notifier)
          .fetchRocketsList();
      await ref
          .read(rocketsDatabaseStateNotifierProvider.notifier)
          .fetchRocketsListFromDataBase();
      await ref
          .read(launchesDatabaseStateNotifierProvider.notifier)
          .fetchLaunchesListFromDataBase();
      if (context.mounted) context.go(RouterName.home);
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/animation/rocket.gif'),
            const Text('Loading'),
          ],
        ),
      ),
    );
  }
}
