import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:space_x_rocket_launches/database/rockets_database.dart';
import 'package:space_x_rocket_launches/models/rockets_data_model.dart';
import 'package:sqflite/sqflite.dart';

class RocketsDatabaseService {
  final Database database;
  RocketsDatabaseService(this.database);

  //? add data to the rockets Database
  Future<void> addToRocketsDB(RocketsDataModel rocket) async {
    try {
      await database.insert('rocketsTable', rocket.toJson());
    } catch (error, stackTrace) {
      debugPrint('error adding rocket - $error');
      debugPrintStack(stackTrace: stackTrace);
    }
  }

  //? fetch the list of rockets in database -
  Future<List<RocketsDataModel>> getListOfRocketsFromDB() async {
    try {
      final rockets = await database.query('rocketsTable');
      return rockets
          .map((data) => RocketsDataModel.fromDataBaseMap(data))
          .toList();
    } catch (error, stackTrace) {
      debugPrint('Error fetching list of rocket - $error');
      debugPrintStack(stackTrace: stackTrace);
      return [];
    }
  }

  //? delete the rockets data -
  Future<int> deleteRocketsFromDB(int rocketID) async {
    try {
      return await database
          .delete('rocketsTable', where: 'rocketID = ?', whereArgs: [rocketID]);
    } catch (error, stackTrace) {
      debugPrint('Error deleting the rocket - $error');
      debugPrintStack(stackTrace: stackTrace);
      return 0;
    }
  }
}

final rocketsDatabaseServiceProvier =
    FutureProvider<RocketsDatabaseService>((ref) async {
  final rocketsDB = await ref.watch(rocketDataBaseProvider.future);
  return RocketsDatabaseService(rocketsDB);
});
