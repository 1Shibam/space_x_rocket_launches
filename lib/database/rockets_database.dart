import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

final rocketDataBaseProvider = FutureProvider<Database>((ref) async {
  final dbPath = await getApplicationDocumentsDirectory();
  final pathDirectory = join(dbPath.path, 'rocketsDB.db');

  return openDatabase(
    pathDirectory,
    version: 1,
    onCreate: (rocketsDatabase, version) {
      rocketsDatabase.execute('''
    CREATE TABLE rocketsTable(
    rocketID INTEGER PRIMARY KEY AUTOINCREMENT,
    rocket TEXT,
    rocketName TEXT,
    activeStatus INTEGER DEFAULT 0,
    costPerLaunch INTEGER,
    successRate INTEGER,
    country TEXT,
    wikipediaSource TEXT,
    description TEXT,
    heightInMeters REAL,
    heightInFeets REAL,
    diameterInMeter REAL,
    diameterInFeets REAL,
    massInKg REAL,
    massInLbs REAL

    )
''');
    },
  );
});

/*
rocketID: map['rocketID'] as int?,
        rocketName: map[''],
        activeStatus: map[''],
        costPerLaunch: map[''],
        successRate: map[''],
        firstLaunch: map[''],
        country: map[''],
        wikipediaSource: map[''],
        description: map[''],

        heightInMeters: map[''],
        heightInFeets: map[''],
        diameterInMeter: map[''],
        diameterInFeets: map[''],
        massInKg: map[''],
        massInLbs: map['']);
 */