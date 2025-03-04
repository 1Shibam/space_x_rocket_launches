import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:space_x_rocket_launches/models/rockets_data_model.dart';
import 'package:space_x_rocket_launches/services/rockets_database_service.dart';

class RocketsDatabaseStateNotifier
    extends StateNotifier<AsyncValue<List<RocketsDataModel>>> {
  final Ref ref;
  RocketsDatabaseStateNotifier(this.ref) : super(const AsyncValue.loading()) {
    fetchRocketsListFromDataBase();
  }

  Future<void> fetchRocketsListFromDataBase() async {
    try {

      state = const AsyncValue.loading();
      final rocketDBService =
          await ref.read(rocketsDatabaseServiceProvier.future);
      final rockets = await rocketDBService.getListOfRocketsFromDB();
      state = AsyncValue.data(rockets);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> addRocketsToDataBase(RocketsDataModel rocket) async {
    try {

      state = const AsyncValue.loading();
      final rocketDBService =
          await ref.read(rocketsDatabaseServiceProvier.future);
      await rocketDBService.addToRocketsDB(rocket);
      final updatedRockets = await rocketDBService.getListOfRocketsFromDB();
      state = AsyncValue.data(updatedRockets);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> deleteRocketsFromTheDataBase(int rocketID) async {
    try {
      state = const AsyncValue.loading();
      final rocketDBService =
          await ref.read(rocketsDatabaseServiceProvier.future);
      await rocketDBService.deleteRocketsFromDB(rocketID);
      final updatedRockets = await rocketDBService.getListOfRocketsFromDB();
      state = AsyncValue.data(updatedRockets);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

final rocketsDatabaseStateNotifierProvider = StateNotifierProvider<
    RocketsDatabaseStateNotifier, AsyncValue<List<RocketsDataModel>>>((ref) {
  return RocketsDatabaseStateNotifier(ref);
});
