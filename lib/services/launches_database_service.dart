import 'package:flutter/material.dart';
import 'package:space_x_rocket_launches/models/launches_data_model.dart';
import 'package:sqflite/sqflite.dart';

class LaunchesDatabaseService {
  final Database database;
  LaunchesDatabaseService(this.database);

  Future<void> addLaunchesToDB(LaunchesDataModel launch) async {
    try {
      await database.insert('launchesTable', launch.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (error, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);
      rethrow;
    }
  }
}
