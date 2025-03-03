import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:space_x_rocket_launches/database/launches_database.dart';
import 'package:space_x_rocket_launches/models/launches_data_model.dart';
import 'package:sqflite/sqflite.dart';

class LaunchesDatabaseService {
  final Database database;
  LaunchesDatabaseService(this.database);

  //? adds the launches data to db
  Future<void> addLaunchesToDB(LaunchesDataModel launch) async {
    try {
      await database.insert('launchesTable', launch.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (error, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);
      rethrow;
    }
  }

  //? Fetches the list of launches saved in the database
  Future<List<LaunchesDataModel>> getListOfLaunchesFromDB() async {
    try {
      final List<Map<String, dynamic>> launches =
          await database.query('launchesTable');
      return launches.map((data) => LaunchesDataModel.fromDBMap(data)).toList();
    } catch (error, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);
      return [];
    }
  }

  //? delete the saved launches from the database
  Future<int> deleteLaunchFromDB(int launchID) async {
    try {
      return await database.delete('launchesTable',
          where: 'launchID = ?', whereArgs: [launchID]);
    } catch (error, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);
      return 0;
    }
  }
}

final launchesDatabaseServiceProvider =
    FutureProvider<LaunchesDatabaseService>((ref) async {
  final launchesDB = await ref.watch(launchesDatabaseProvider.future);
  return LaunchesDatabaseService(launchesDB);
});
