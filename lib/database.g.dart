// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $DrivingLogTable extends DrivingLog
    with TableInfo<$DrivingLogTable, DrivingLogData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DrivingLogTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _dateTimeStartMeta =
      const VerificationMeta('dateTimeStart');
  @override
  late final GeneratedColumn<DateTime> dateTimeStart =
      GeneratedColumn<DateTime>('date_time_start', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _dateTimeEndMeta =
      const VerificationMeta('dateTimeEnd');
  @override
  late final GeneratedColumn<DateTime> dateTimeEnd = GeneratedColumn<DateTime>(
      'date_time_end', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _odometerStartMeta =
      const VerificationMeta('odometerStart');
  @override
  late final GeneratedColumn<int> odometerStart = GeneratedColumn<int>(
      'odometer_start', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _odometerEndMeta =
      const VerificationMeta('odometerEnd');
  @override
  late final GeneratedColumn<int> odometerEnd = GeneratedColumn<int>(
      'odometer_end', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _locationStartMeta =
      const VerificationMeta('locationStart');
  @override
  late final GeneratedColumn<String> locationStart = GeneratedColumn<String>(
      'location_start', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _locationEndMeta =
      const VerificationMeta('locationEnd');
  @override
  late final GeneratedColumn<String> locationEnd = GeneratedColumn<String>(
      'location_end', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
      'tags', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        dateTimeStart,
        dateTimeEnd,
        odometerStart,
        odometerEnd,
        locationStart,
        locationEnd,
        notes,
        tags
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'driving_log';
  @override
  VerificationContext validateIntegrity(Insertable<DrivingLogData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date_time_start')) {
      context.handle(
          _dateTimeStartMeta,
          dateTimeStart.isAcceptableOrUnknown(
              data['date_time_start']!, _dateTimeStartMeta));
    } else if (isInserting) {
      context.missing(_dateTimeStartMeta);
    }
    if (data.containsKey('date_time_end')) {
      context.handle(
          _dateTimeEndMeta,
          dateTimeEnd.isAcceptableOrUnknown(
              data['date_time_end']!, _dateTimeEndMeta));
    } else if (isInserting) {
      context.missing(_dateTimeEndMeta);
    }
    if (data.containsKey('odometer_start')) {
      context.handle(
          _odometerStartMeta,
          odometerStart.isAcceptableOrUnknown(
              data['odometer_start']!, _odometerStartMeta));
    } else if (isInserting) {
      context.missing(_odometerStartMeta);
    }
    if (data.containsKey('odometer_end')) {
      context.handle(
          _odometerEndMeta,
          odometerEnd.isAcceptableOrUnknown(
              data['odometer_end']!, _odometerEndMeta));
    } else if (isInserting) {
      context.missing(_odometerEndMeta);
    }
    if (data.containsKey('location_start')) {
      context.handle(
          _locationStartMeta,
          locationStart.isAcceptableOrUnknown(
              data['location_start']!, _locationStartMeta));
    } else if (isInserting) {
      context.missing(_locationStartMeta);
    }
    if (data.containsKey('location_end')) {
      context.handle(
          _locationEndMeta,
          locationEnd.isAcceptableOrUnknown(
              data['location_end']!, _locationEndMeta));
    } else if (isInserting) {
      context.missing(_locationEndMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    } else if (isInserting) {
      context.missing(_notesMeta);
    }
    if (data.containsKey('tags')) {
      context.handle(
          _tagsMeta, tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta));
    } else if (isInserting) {
      context.missing(_tagsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DrivingLogData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DrivingLogData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      dateTimeStart: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}date_time_start'])!,
      dateTimeEnd: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}date_time_end'])!,
      odometerStart: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}odometer_start'])!,
      odometerEnd: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}odometer_end'])!,
      locationStart: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location_start'])!,
      locationEnd: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location_end'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes'])!,
      tags: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tags'])!,
    );
  }

  @override
  $DrivingLogTable createAlias(String alias) {
    return $DrivingLogTable(attachedDatabase, alias);
  }
}

class DrivingLogData extends DataClass implements Insertable<DrivingLogData> {
  final int id;
  final DateTime dateTimeStart;
  final DateTime dateTimeEnd;
  final int odometerStart;
  final int odometerEnd;
  final String locationStart;
  final String locationEnd;
  final String notes;
  final String tags;
  const DrivingLogData(
      {required this.id,
      required this.dateTimeStart,
      required this.dateTimeEnd,
      required this.odometerStart,
      required this.odometerEnd,
      required this.locationStart,
      required this.locationEnd,
      required this.notes,
      required this.tags});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date_time_start'] = Variable<DateTime>(dateTimeStart);
    map['date_time_end'] = Variable<DateTime>(dateTimeEnd);
    map['odometer_start'] = Variable<int>(odometerStart);
    map['odometer_end'] = Variable<int>(odometerEnd);
    map['location_start'] = Variable<String>(locationStart);
    map['location_end'] = Variable<String>(locationEnd);
    map['notes'] = Variable<String>(notes);
    map['tags'] = Variable<String>(tags);
    return map;
  }

  DrivingLogCompanion toCompanion(bool nullToAbsent) {
    return DrivingLogCompanion(
      id: Value(id),
      dateTimeStart: Value(dateTimeStart),
      dateTimeEnd: Value(dateTimeEnd),
      odometerStart: Value(odometerStart),
      odometerEnd: Value(odometerEnd),
      locationStart: Value(locationStart),
      locationEnd: Value(locationEnd),
      notes: Value(notes),
      tags: Value(tags),
    );
  }

  factory DrivingLogData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DrivingLogData(
      id: serializer.fromJson<int>(json['id']),
      dateTimeStart: serializer.fromJson<DateTime>(json['dateTimeStart']),
      dateTimeEnd: serializer.fromJson<DateTime>(json['dateTimeEnd']),
      odometerStart: serializer.fromJson<int>(json['odometerStart']),
      odometerEnd: serializer.fromJson<int>(json['odometerEnd']),
      locationStart: serializer.fromJson<String>(json['locationStart']),
      locationEnd: serializer.fromJson<String>(json['locationEnd']),
      notes: serializer.fromJson<String>(json['notes']),
      tags: serializer.fromJson<String>(json['tags']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'dateTimeStart': serializer.toJson<DateTime>(dateTimeStart),
      'dateTimeEnd': serializer.toJson<DateTime>(dateTimeEnd),
      'odometerStart': serializer.toJson<int>(odometerStart),
      'odometerEnd': serializer.toJson<int>(odometerEnd),
      'locationStart': serializer.toJson<String>(locationStart),
      'locationEnd': serializer.toJson<String>(locationEnd),
      'notes': serializer.toJson<String>(notes),
      'tags': serializer.toJson<String>(tags),
    };
  }

  DrivingLogData copyWith(
          {int? id,
          DateTime? dateTimeStart,
          DateTime? dateTimeEnd,
          int? odometerStart,
          int? odometerEnd,
          String? locationStart,
          String? locationEnd,
          String? notes,
          String? tags}) =>
      DrivingLogData(
        id: id ?? this.id,
        dateTimeStart: dateTimeStart ?? this.dateTimeStart,
        dateTimeEnd: dateTimeEnd ?? this.dateTimeEnd,
        odometerStart: odometerStart ?? this.odometerStart,
        odometerEnd: odometerEnd ?? this.odometerEnd,
        locationStart: locationStart ?? this.locationStart,
        locationEnd: locationEnd ?? this.locationEnd,
        notes: notes ?? this.notes,
        tags: tags ?? this.tags,
      );
  @override
  String toString() {
    return (StringBuffer('DrivingLogData(')
          ..write('id: $id, ')
          ..write('dateTimeStart: $dateTimeStart, ')
          ..write('dateTimeEnd: $dateTimeEnd, ')
          ..write('odometerStart: $odometerStart, ')
          ..write('odometerEnd: $odometerEnd, ')
          ..write('locationStart: $locationStart, ')
          ..write('locationEnd: $locationEnd, ')
          ..write('notes: $notes, ')
          ..write('tags: $tags')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, dateTimeStart, dateTimeEnd, odometerStart,
      odometerEnd, locationStart, locationEnd, notes, tags);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DrivingLogData &&
          other.id == this.id &&
          other.dateTimeStart == this.dateTimeStart &&
          other.dateTimeEnd == this.dateTimeEnd &&
          other.odometerStart == this.odometerStart &&
          other.odometerEnd == this.odometerEnd &&
          other.locationStart == this.locationStart &&
          other.locationEnd == this.locationEnd &&
          other.notes == this.notes &&
          other.tags == this.tags);
}

class DrivingLogCompanion extends UpdateCompanion<DrivingLogData> {
  final Value<int> id;
  final Value<DateTime> dateTimeStart;
  final Value<DateTime> dateTimeEnd;
  final Value<int> odometerStart;
  final Value<int> odometerEnd;
  final Value<String> locationStart;
  final Value<String> locationEnd;
  final Value<String> notes;
  final Value<String> tags;
  const DrivingLogCompanion({
    this.id = const Value.absent(),
    this.dateTimeStart = const Value.absent(),
    this.dateTimeEnd = const Value.absent(),
    this.odometerStart = const Value.absent(),
    this.odometerEnd = const Value.absent(),
    this.locationStart = const Value.absent(),
    this.locationEnd = const Value.absent(),
    this.notes = const Value.absent(),
    this.tags = const Value.absent(),
  });
  DrivingLogCompanion.insert({
    this.id = const Value.absent(),
    required DateTime dateTimeStart,
    required DateTime dateTimeEnd,
    required int odometerStart,
    required int odometerEnd,
    required String locationStart,
    required String locationEnd,
    required String notes,
    required String tags,
  })  : dateTimeStart = Value(dateTimeStart),
        dateTimeEnd = Value(dateTimeEnd),
        odometerStart = Value(odometerStart),
        odometerEnd = Value(odometerEnd),
        locationStart = Value(locationStart),
        locationEnd = Value(locationEnd),
        notes = Value(notes),
        tags = Value(tags);
  static Insertable<DrivingLogData> custom({
    Expression<int>? id,
    Expression<DateTime>? dateTimeStart,
    Expression<DateTime>? dateTimeEnd,
    Expression<int>? odometerStart,
    Expression<int>? odometerEnd,
    Expression<String>? locationStart,
    Expression<String>? locationEnd,
    Expression<String>? notes,
    Expression<String>? tags,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dateTimeStart != null) 'date_time_start': dateTimeStart,
      if (dateTimeEnd != null) 'date_time_end': dateTimeEnd,
      if (odometerStart != null) 'odometer_start': odometerStart,
      if (odometerEnd != null) 'odometer_end': odometerEnd,
      if (locationStart != null) 'location_start': locationStart,
      if (locationEnd != null) 'location_end': locationEnd,
      if (notes != null) 'notes': notes,
      if (tags != null) 'tags': tags,
    });
  }

  DrivingLogCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? dateTimeStart,
      Value<DateTime>? dateTimeEnd,
      Value<int>? odometerStart,
      Value<int>? odometerEnd,
      Value<String>? locationStart,
      Value<String>? locationEnd,
      Value<String>? notes,
      Value<String>? tags}) {
    return DrivingLogCompanion(
      id: id ?? this.id,
      dateTimeStart: dateTimeStart ?? this.dateTimeStart,
      dateTimeEnd: dateTimeEnd ?? this.dateTimeEnd,
      odometerStart: odometerStart ?? this.odometerStart,
      odometerEnd: odometerEnd ?? this.odometerEnd,
      locationStart: locationStart ?? this.locationStart,
      locationEnd: locationEnd ?? this.locationEnd,
      notes: notes ?? this.notes,
      tags: tags ?? this.tags,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (dateTimeStart.present) {
      map['date_time_start'] = Variable<DateTime>(dateTimeStart.value);
    }
    if (dateTimeEnd.present) {
      map['date_time_end'] = Variable<DateTime>(dateTimeEnd.value);
    }
    if (odometerStart.present) {
      map['odometer_start'] = Variable<int>(odometerStart.value);
    }
    if (odometerEnd.present) {
      map['odometer_end'] = Variable<int>(odometerEnd.value);
    }
    if (locationStart.present) {
      map['location_start'] = Variable<String>(locationStart.value);
    }
    if (locationEnd.present) {
      map['location_end'] = Variable<String>(locationEnd.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DrivingLogCompanion(')
          ..write('id: $id, ')
          ..write('dateTimeStart: $dateTimeStart, ')
          ..write('dateTimeEnd: $dateTimeEnd, ')
          ..write('odometerStart: $odometerStart, ')
          ..write('odometerEnd: $odometerEnd, ')
          ..write('locationStart: $locationStart, ')
          ..write('locationEnd: $locationEnd, ')
          ..write('notes: $notes, ')
          ..write('tags: $tags')
          ..write(')'))
        .toString();
  }
}

class $GasLogTable extends GasLog with TableInfo<$GasLogTable, GasLogData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GasLogTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _datetimeMeta =
      const VerificationMeta('datetime');
  @override
  late final GeneratedColumn<DateTime> datetime = GeneratedColumn<DateTime>(
      'datetime', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _odometerMeta =
      const VerificationMeta('odometer');
  @override
  late final GeneratedColumn<int> odometer = GeneratedColumn<int>(
      'odometer', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _tankOldMeta =
      const VerificationMeta('tankOld');
  @override
  late final GeneratedColumn<double> tankOld = GeneratedColumn<double>(
      'tank_old', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _tankNewMeta =
      const VerificationMeta('tankNew');
  @override
  late final GeneratedColumn<double> tankNew = GeneratedColumn<double>(
      'tank_new', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _litersMeta = const VerificationMeta('liters');
  @override
  late final GeneratedColumn<double> liters = GeneratedColumn<double>(
      'liters', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _eurosMeta = const VerificationMeta('euros');
  @override
  late final GeneratedColumn<double> euros = GeneratedColumn<double>(
      'euros', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _pricePerLiterMeta =
      const VerificationMeta('pricePerLiter');
  @override
  late final GeneratedColumn<double> pricePerLiter = GeneratedColumn<double>(
      'price_per_liter', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _locationMeta =
      const VerificationMeta('location');
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
      'location', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fuelTypeMeta =
      const VerificationMeta('fuelType');
  @override
  late final GeneratedColumn<String> fuelType = GeneratedColumn<String>(
      'fuel_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
      'tags', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        datetime,
        odometer,
        tankOld,
        tankNew,
        liters,
        euros,
        pricePerLiter,
        location,
        fuelType,
        notes,
        tags
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'gas_log';
  @override
  VerificationContext validateIntegrity(Insertable<GasLogData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('datetime')) {
      context.handle(_datetimeMeta,
          datetime.isAcceptableOrUnknown(data['datetime']!, _datetimeMeta));
    } else if (isInserting) {
      context.missing(_datetimeMeta);
    }
    if (data.containsKey('odometer')) {
      context.handle(_odometerMeta,
          odometer.isAcceptableOrUnknown(data['odometer']!, _odometerMeta));
    } else if (isInserting) {
      context.missing(_odometerMeta);
    }
    if (data.containsKey('tank_old')) {
      context.handle(_tankOldMeta,
          tankOld.isAcceptableOrUnknown(data['tank_old']!, _tankOldMeta));
    } else if (isInserting) {
      context.missing(_tankOldMeta);
    }
    if (data.containsKey('tank_new')) {
      context.handle(_tankNewMeta,
          tankNew.isAcceptableOrUnknown(data['tank_new']!, _tankNewMeta));
    } else if (isInserting) {
      context.missing(_tankNewMeta);
    }
    if (data.containsKey('liters')) {
      context.handle(_litersMeta,
          liters.isAcceptableOrUnknown(data['liters']!, _litersMeta));
    } else if (isInserting) {
      context.missing(_litersMeta);
    }
    if (data.containsKey('euros')) {
      context.handle(
          _eurosMeta, euros.isAcceptableOrUnknown(data['euros']!, _eurosMeta));
    } else if (isInserting) {
      context.missing(_eurosMeta);
    }
    if (data.containsKey('price_per_liter')) {
      context.handle(
          _pricePerLiterMeta,
          pricePerLiter.isAcceptableOrUnknown(
              data['price_per_liter']!, _pricePerLiterMeta));
    } else if (isInserting) {
      context.missing(_pricePerLiterMeta);
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    if (data.containsKey('fuel_type')) {
      context.handle(_fuelTypeMeta,
          fuelType.isAcceptableOrUnknown(data['fuel_type']!, _fuelTypeMeta));
    } else if (isInserting) {
      context.missing(_fuelTypeMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    } else if (isInserting) {
      context.missing(_notesMeta);
    }
    if (data.containsKey('tags')) {
      context.handle(
          _tagsMeta, tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta));
    } else if (isInserting) {
      context.missing(_tagsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GasLogData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GasLogData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      datetime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}datetime'])!,
      odometer: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}odometer'])!,
      tankOld: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}tank_old'])!,
      tankNew: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}tank_new'])!,
      liters: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}liters'])!,
      euros: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}euros'])!,
      pricePerLiter: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}price_per_liter'])!,
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location'])!,
      fuelType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}fuel_type'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes'])!,
      tags: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tags'])!,
    );
  }

  @override
  $GasLogTable createAlias(String alias) {
    return $GasLogTable(attachedDatabase, alias);
  }
}

class GasLogData extends DataClass implements Insertable<GasLogData> {
  final int id;
  final DateTime datetime;
  final int odometer;
  final double tankOld;
  final double tankNew;
  final double liters;
  final double euros;
  final double pricePerLiter;
  final String location;
  final String fuelType;
  final String notes;
  final String tags;
  const GasLogData(
      {required this.id,
      required this.datetime,
      required this.odometer,
      required this.tankOld,
      required this.tankNew,
      required this.liters,
      required this.euros,
      required this.pricePerLiter,
      required this.location,
      required this.fuelType,
      required this.notes,
      required this.tags});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['datetime'] = Variable<DateTime>(datetime);
    map['odometer'] = Variable<int>(odometer);
    map['tank_old'] = Variable<double>(tankOld);
    map['tank_new'] = Variable<double>(tankNew);
    map['liters'] = Variable<double>(liters);
    map['euros'] = Variable<double>(euros);
    map['price_per_liter'] = Variable<double>(pricePerLiter);
    map['location'] = Variable<String>(location);
    map['fuel_type'] = Variable<String>(fuelType);
    map['notes'] = Variable<String>(notes);
    map['tags'] = Variable<String>(tags);
    return map;
  }

  GasLogCompanion toCompanion(bool nullToAbsent) {
    return GasLogCompanion(
      id: Value(id),
      datetime: Value(datetime),
      odometer: Value(odometer),
      tankOld: Value(tankOld),
      tankNew: Value(tankNew),
      liters: Value(liters),
      euros: Value(euros),
      pricePerLiter: Value(pricePerLiter),
      location: Value(location),
      fuelType: Value(fuelType),
      notes: Value(notes),
      tags: Value(tags),
    );
  }

  factory GasLogData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GasLogData(
      id: serializer.fromJson<int>(json['id']),
      datetime: serializer.fromJson<DateTime>(json['datetime']),
      odometer: serializer.fromJson<int>(json['odometer']),
      tankOld: serializer.fromJson<double>(json['tankOld']),
      tankNew: serializer.fromJson<double>(json['tankNew']),
      liters: serializer.fromJson<double>(json['liters']),
      euros: serializer.fromJson<double>(json['euros']),
      pricePerLiter: serializer.fromJson<double>(json['pricePerLiter']),
      location: serializer.fromJson<String>(json['location']),
      fuelType: serializer.fromJson<String>(json['fuelType']),
      notes: serializer.fromJson<String>(json['notes']),
      tags: serializer.fromJson<String>(json['tags']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'datetime': serializer.toJson<DateTime>(datetime),
      'odometer': serializer.toJson<int>(odometer),
      'tankOld': serializer.toJson<double>(tankOld),
      'tankNew': serializer.toJson<double>(tankNew),
      'liters': serializer.toJson<double>(liters),
      'euros': serializer.toJson<double>(euros),
      'pricePerLiter': serializer.toJson<double>(pricePerLiter),
      'location': serializer.toJson<String>(location),
      'fuelType': serializer.toJson<String>(fuelType),
      'notes': serializer.toJson<String>(notes),
      'tags': serializer.toJson<String>(tags),
    };
  }

  GasLogData copyWith(
          {int? id,
          DateTime? datetime,
          int? odometer,
          double? tankOld,
          double? tankNew,
          double? liters,
          double? euros,
          double? pricePerLiter,
          String? location,
          String? fuelType,
          String? notes,
          String? tags}) =>
      GasLogData(
        id: id ?? this.id,
        datetime: datetime ?? this.datetime,
        odometer: odometer ?? this.odometer,
        tankOld: tankOld ?? this.tankOld,
        tankNew: tankNew ?? this.tankNew,
        liters: liters ?? this.liters,
        euros: euros ?? this.euros,
        pricePerLiter: pricePerLiter ?? this.pricePerLiter,
        location: location ?? this.location,
        fuelType: fuelType ?? this.fuelType,
        notes: notes ?? this.notes,
        tags: tags ?? this.tags,
      );
  @override
  String toString() {
    return (StringBuffer('GasLogData(')
          ..write('id: $id, ')
          ..write('datetime: $datetime, ')
          ..write('odometer: $odometer, ')
          ..write('tankOld: $tankOld, ')
          ..write('tankNew: $tankNew, ')
          ..write('liters: $liters, ')
          ..write('euros: $euros, ')
          ..write('pricePerLiter: $pricePerLiter, ')
          ..write('location: $location, ')
          ..write('fuelType: $fuelType, ')
          ..write('notes: $notes, ')
          ..write('tags: $tags')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, datetime, odometer, tankOld, tankNew,
      liters, euros, pricePerLiter, location, fuelType, notes, tags);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GasLogData &&
          other.id == this.id &&
          other.datetime == this.datetime &&
          other.odometer == this.odometer &&
          other.tankOld == this.tankOld &&
          other.tankNew == this.tankNew &&
          other.liters == this.liters &&
          other.euros == this.euros &&
          other.pricePerLiter == this.pricePerLiter &&
          other.location == this.location &&
          other.fuelType == this.fuelType &&
          other.notes == this.notes &&
          other.tags == this.tags);
}

class GasLogCompanion extends UpdateCompanion<GasLogData> {
  final Value<int> id;
  final Value<DateTime> datetime;
  final Value<int> odometer;
  final Value<double> tankOld;
  final Value<double> tankNew;
  final Value<double> liters;
  final Value<double> euros;
  final Value<double> pricePerLiter;
  final Value<String> location;
  final Value<String> fuelType;
  final Value<String> notes;
  final Value<String> tags;
  const GasLogCompanion({
    this.id = const Value.absent(),
    this.datetime = const Value.absent(),
    this.odometer = const Value.absent(),
    this.tankOld = const Value.absent(),
    this.tankNew = const Value.absent(),
    this.liters = const Value.absent(),
    this.euros = const Value.absent(),
    this.pricePerLiter = const Value.absent(),
    this.location = const Value.absent(),
    this.fuelType = const Value.absent(),
    this.notes = const Value.absent(),
    this.tags = const Value.absent(),
  });
  GasLogCompanion.insert({
    this.id = const Value.absent(),
    required DateTime datetime,
    required int odometer,
    required double tankOld,
    required double tankNew,
    required double liters,
    required double euros,
    required double pricePerLiter,
    required String location,
    required String fuelType,
    required String notes,
    required String tags,
  })  : datetime = Value(datetime),
        odometer = Value(odometer),
        tankOld = Value(tankOld),
        tankNew = Value(tankNew),
        liters = Value(liters),
        euros = Value(euros),
        pricePerLiter = Value(pricePerLiter),
        location = Value(location),
        fuelType = Value(fuelType),
        notes = Value(notes),
        tags = Value(tags);
  static Insertable<GasLogData> custom({
    Expression<int>? id,
    Expression<DateTime>? datetime,
    Expression<int>? odometer,
    Expression<double>? tankOld,
    Expression<double>? tankNew,
    Expression<double>? liters,
    Expression<double>? euros,
    Expression<double>? pricePerLiter,
    Expression<String>? location,
    Expression<String>? fuelType,
    Expression<String>? notes,
    Expression<String>? tags,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (datetime != null) 'datetime': datetime,
      if (odometer != null) 'odometer': odometer,
      if (tankOld != null) 'tank_old': tankOld,
      if (tankNew != null) 'tank_new': tankNew,
      if (liters != null) 'liters': liters,
      if (euros != null) 'euros': euros,
      if (pricePerLiter != null) 'price_per_liter': pricePerLiter,
      if (location != null) 'location': location,
      if (fuelType != null) 'fuel_type': fuelType,
      if (notes != null) 'notes': notes,
      if (tags != null) 'tags': tags,
    });
  }

  GasLogCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? datetime,
      Value<int>? odometer,
      Value<double>? tankOld,
      Value<double>? tankNew,
      Value<double>? liters,
      Value<double>? euros,
      Value<double>? pricePerLiter,
      Value<String>? location,
      Value<String>? fuelType,
      Value<String>? notes,
      Value<String>? tags}) {
    return GasLogCompanion(
      id: id ?? this.id,
      datetime: datetime ?? this.datetime,
      odometer: odometer ?? this.odometer,
      tankOld: tankOld ?? this.tankOld,
      tankNew: tankNew ?? this.tankNew,
      liters: liters ?? this.liters,
      euros: euros ?? this.euros,
      pricePerLiter: pricePerLiter ?? this.pricePerLiter,
      location: location ?? this.location,
      fuelType: fuelType ?? this.fuelType,
      notes: notes ?? this.notes,
      tags: tags ?? this.tags,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (datetime.present) {
      map['datetime'] = Variable<DateTime>(datetime.value);
    }
    if (odometer.present) {
      map['odometer'] = Variable<int>(odometer.value);
    }
    if (tankOld.present) {
      map['tank_old'] = Variable<double>(tankOld.value);
    }
    if (tankNew.present) {
      map['tank_new'] = Variable<double>(tankNew.value);
    }
    if (liters.present) {
      map['liters'] = Variable<double>(liters.value);
    }
    if (euros.present) {
      map['euros'] = Variable<double>(euros.value);
    }
    if (pricePerLiter.present) {
      map['price_per_liter'] = Variable<double>(pricePerLiter.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (fuelType.present) {
      map['fuel_type'] = Variable<String>(fuelType.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GasLogCompanion(')
          ..write('id: $id, ')
          ..write('datetime: $datetime, ')
          ..write('odometer: $odometer, ')
          ..write('tankOld: $tankOld, ')
          ..write('tankNew: $tankNew, ')
          ..write('liters: $liters, ')
          ..write('euros: $euros, ')
          ..write('pricePerLiter: $pricePerLiter, ')
          ..write('location: $location, ')
          ..write('fuelType: $fuelType, ')
          ..write('notes: $notes, ')
          ..write('tags: $tags')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $DrivingLogTable drivingLog = $DrivingLogTable(this);
  late final $GasLogTable gasLog = $GasLogTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [drivingLog, gasLog];
}
