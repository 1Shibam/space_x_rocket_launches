import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:space_x_rocket_launches/models/rockets_data_model.dart';
import 'package:space_x_rocket_launches/services/space_x_services.dart';

class RocketsListNotifier
    extends StateNotifier<AsyncValue<List<RocketsDataModel>>> {
  RocketsListNotifier(this.services) : super(const AsyncValue.loading()) {
    fetchRocketsList();
  }
  final SpaceXServices services;

  Future<void> fetchRocketsList() async {
    try {
      state = const AsyncValue.loading();
      final rockets = await services.getRocketsList();
      state = AsyncValue.data(rockets);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

final rocketsListNotifierStateProvider = StateNotifierProvider<
        RocketsListNotifier, AsyncValue<List<RocketsDataModel>>>(
    (ref) => RocketsListNotifier(SpaceXServices()));
