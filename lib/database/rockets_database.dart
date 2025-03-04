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
    id TEXT,
    rocketName TEXT,
    activeStatus INTEGER DEFAULT 0,
    costPerLaunch INTEGER,
    successRate INTEGER,
    firstLaunch TEXT,
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
return {
      'id' : id,
      'rocketName': rocketName,
      'activeStatus' : activeStatus ? 1:0,
      'costPerLaunch' : costPerLaunch,
      'successRate' : successRate,
      'firstLaunch': firstLaunch,
      'country' : country,
      'wikipediaSource' : wikipediaSource,
      'description': description,
      'heightInMeters' : heightInMeters,
      'heightInFeets' : heightInFeets,
      'diameterInMeter': diameterInMeter,
      'diameterInFeets': diameterInFeets,
      'massInKg': massInKg,
      'massInLbs' : massInLbs
    };
  }
 */