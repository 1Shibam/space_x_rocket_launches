import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:space_x_rocket_launches/models/launches_data_model.dart';
import 'package:space_x_rocket_launches/services/launches_database_service.dart';

class LaunchesDatabaseStateNotifier
    extends StateNotifier<AsyncValue<List<LaunchesDataModel>>> {
  final Ref ref;
  LaunchesDatabaseStateNotifier(this.ref) : super(const AsyncValue.loading()) {
    //Initial state
    fetchLaunchesListFromDataBase();
  }

  Future<void> fetchLaunchesListFromDataBase() async {
    try {
      final launchesDBService =
          await ref.read(launchesDatabaseServiceProvider.future);
      final launches = await launchesDBService.getListOfLaunchesFromDB();
      state = AsyncValue.data(launches);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> addLauchesToDataBase(LaunchesDataModel launch) async {
    try {
      final launchDBService =
          await ref.read(launchesDatabaseServiceProvider.future);
      await launchDBService.addLaunchesToDB(launch);
      final updatedLaunches = await launchDBService.getListOfLaunchesFromDB();
      state = AsyncValue.data(updatedLaunches);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> deleteLaunchesFromDataBase(int launchID) async {
    final launchDBService =
        await ref.read(launchesDatabaseServiceProvider.future);
    await launchDBService.deleteLaunchFromDB(launchID);
    final updatedLaunches = await launchDBService.getListOfLaunchesFromDB();
    state = AsyncValue.data(updatedLaunches);
  }
}

final launchesDatabaseStateNotifierProvider = StateNotifierProvider<
        LaunchesDatabaseStateNotifier, AsyncValue<List<LaunchesDataModel>>>(
    (ref) => LaunchesDatabaseStateNotifier(ref));
