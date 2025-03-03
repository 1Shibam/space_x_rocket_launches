import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:space_x_rocket_launches/models/launches_data_model.dart';
import 'package:space_x_rocket_launches/services/space_x_services.dart';

class LaunchesListNotifer
    extends StateNotifier<AsyncValue<List<LaunchesDataModel>>> {
  LaunchesListNotifer(this.services) : super(const AsyncValue.loading()) {
    fetchLaunchesList();
  }
  final SpaceXServices services;

  Future<void> fetchLaunchesList() async {
    state = const AsyncValue.loading();
    // print('provider is triggering!!');
    try {
      final launches = await services.getLaunchesList();
      state = AsyncValue.data(launches);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

final launchesListNotifierStateProvider = StateNotifierProvider<
        LaunchesListNotifer, AsyncValue<List<LaunchesDataModel>>>(
    (ref) => LaunchesListNotifer(SpaceXServices()));
