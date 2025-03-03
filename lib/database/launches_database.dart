import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

final launchesDatabaseProvider = FutureProvider<Database>((ref) async {
  //gettin path
  final dbPath = await getApplicationDocumentsDirectory();
  final pathDirectory = join(dbPath.path, 'launchesDB.db');
  return openDatabase(
    pathDirectory,
    version: 1,
    onCreate: (launchesDatabase, version) {
      //? SQL query for launches database
      launchesDatabase.execute('''
      CREATE TABLE launchesTable(
      launchID INTEGER PRIMARY KEY AUTOINCREMENT,
      flightNumber INTEGER,
      videoSource TEXT,
      articleSource TEXT,
      wikipediaSource TEXT,
      missionName TEXT,
      rocket TEXT,
      landingDate TEXT,
      successStatus INTEGER DEFAULT 0
      )
''');
    },
  );
});


