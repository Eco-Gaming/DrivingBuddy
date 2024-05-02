import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:driving_buddy/constants.dart';
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
  IntColumn get locationStart => integer().references(Location, #id)();
  IntColumn get locationEnd => integer().references(Location, #id)();
  TextColumn get notes => text().nullable()();
}

class Tag extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
}

class TagRelation extends Table {
  IntColumn get drivingLog => integer().references(DrivingLog, #id)();
  IntColumn get tag => integer().references(Tag, #id)();
}

class GasLog extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get datetime => dateTime()();
  IntColumn get odometer => integer()();
  RealColumn get tankOld => real()(); // value between 0 and 1
  RealColumn get tankNew => real()(); // value between 0 and 1
  RealColumn get volume => real()(); // currently in Liters
  RealColumn get amountPaid => real()(); // currently in Euros
  RealColumn get price => real()(); // currently in Euros per Liter
  IntColumn get location => integer().references(Location, #id)();
  IntColumn get fuelType => intEnum<FuelType>()();
  TextColumn get notes => text().nullable()();
}

class ParkingLog extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get dateTimeStart => dateTime()();
  DateTimeColumn get dateTimeEnd => dateTime()();
  IntColumn get location => integer().references(Location, #id)();
  RealColumn get amountPaid => real()(); // currently in Euros
  TextColumn get notes => text().nullable()();
}

class Location extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get latitude => real()();
  RealColumn get longitude => real()();
  TextColumn get name => text()();
  IntColumn get type => intEnum<LocationType>()();
}

@DriftDatabase(tables: [DrivingLog, Tag, TagRelation, GasLog, ParkingLog, Location])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
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
