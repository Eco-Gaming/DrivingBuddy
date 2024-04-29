import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'database.g.dart';

class DrivingLog extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get dateTimeStart => dateTime()();
  DateTimeColumn get dateTimeEnd => dateTime()();
  IntColumn get odometerStart => integer()();
  IntColumn get odometerEnd => integer()();
  TextColumn get locationStart => text()();
  TextColumn get locationEnd => text()();
  TextColumn get notes => text()();
  TextColumn get tags => text()();
}

class GasLog extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get datetime => dateTime()();
  IntColumn get odometer => integer()();
  RealColumn get tankOld => real()();
  RealColumn get tankNew => real()();
  RealColumn get liters => real()();
  RealColumn get euros => real()();
  RealColumn get pricePerLiter => real()();
  TextColumn get location => text()();
  TextColumn get fuelType => text()();
  TextColumn get notes => text()();
  TextColumn get tags => text()();
}

@DriftDatabase(tables: [DrivingLog, GasLog])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  //READ
  Future<List<DrivingLogData>> getAllDrivingLogEntries() => select(drivingLog).get();
  Stream<List<DrivingLogData>> watchAllDrivingLogEntries() => select(drivingLog).watch();
  //INSERT
  Future insertDrivingLogEntry(DrivingLogData drivingLogEntry) => into(drivingLog).insert(drivingLogEntry);
  //Update
  Future updateDrivingLogEntry(DrivingLogData drivingLogEntry) => update(drivingLog).replace(drivingLogEntry);
  //Delete
  Future deleteDrivingLogEntry(DrivingLogData drivingLogEntry) => delete(drivingLog).delete(drivingLogEntry);
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'driving_buddy.sqlite'));

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    final cachebase = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cachebase;
    return NativeDatabase.createInBackground(file,
        logStatements: kDebugMode ? true : false);
  });
}
