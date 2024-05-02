// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $LocationTable extends Location
    with TableInfo<$LocationTable, LocationData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocationTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _latitudeMeta =
      const VerificationMeta('latitude');
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
      'latitude', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _longitudeMeta =
      const VerificationMeta('longitude');
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
      'longitude', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<LocationType, int> type =
      GeneratedColumn<int>('type', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<LocationType>($LocationTable.$convertertype);
  @override
  List<GeneratedColumn> get $columns => [id, latitude, longitude, name, type];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'location';
  @override
  VerificationContext validateIntegrity(Insertable<LocationData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta));
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta));
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    context.handle(_typeMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocationData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocationData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      latitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}latitude'])!,
      longitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}longitude'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      type: $LocationTable.$convertertype.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!),
    );
  }

  @override
  $LocationTable createAlias(String alias) {
    return $LocationTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<LocationType, int, int> $convertertype =
      const EnumIndexConverter<LocationType>(LocationType.values);
}

class LocationData extends DataClass implements Insertable<LocationData> {
  final int id;
  final double latitude;
  final double longitude;
  final String name;
  final LocationType type;
  const LocationData(
      {required this.id,
      required this.latitude,
      required this.longitude,
      required this.name,
      required this.type});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    map['name'] = Variable<String>(name);
    {
      map['type'] = Variable<int>($LocationTable.$convertertype.toSql(type));
    }
    return map;
  }

  LocationCompanion toCompanion(bool nullToAbsent) {
    return LocationCompanion(
      id: Value(id),
      latitude: Value(latitude),
      longitude: Value(longitude),
      name: Value(name),
      type: Value(type),
    );
  }

  factory LocationData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocationData(
      id: serializer.fromJson<int>(json['id']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      name: serializer.fromJson<String>(json['name']),
      type: $LocationTable.$convertertype
          .fromJson(serializer.fromJson<int>(json['type'])),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'name': serializer.toJson<String>(name),
      'type':
          serializer.toJson<int>($LocationTable.$convertertype.toJson(type)),
    };
  }

  LocationData copyWith(
          {int? id,
          double? latitude,
          double? longitude,
          String? name,
          LocationType? type}) =>
      LocationData(
        id: id ?? this.id,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        name: name ?? this.name,
        type: type ?? this.type,
      );
  @override
  String toString() {
    return (StringBuffer('LocationData(')
          ..write('id: $id, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('name: $name, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, latitude, longitude, name, type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocationData &&
          other.id == this.id &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.name == this.name &&
          other.type == this.type);
}

class LocationCompanion extends UpdateCompanion<LocationData> {
  final Value<int> id;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<String> name;
  final Value<LocationType> type;
  const LocationCompanion({
    this.id = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
  });
  LocationCompanion.insert({
    this.id = const Value.absent(),
    required double latitude,
    required double longitude,
    required String name,
    required LocationType type,
  })  : latitude = Value(latitude),
        longitude = Value(longitude),
        name = Value(name),
        type = Value(type);
  static Insertable<LocationData> custom({
    Expression<int>? id,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<String>? name,
    Expression<int>? type,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
    });
  }

  LocationCompanion copyWith(
      {Value<int>? id,
      Value<double>? latitude,
      Value<double>? longitude,
      Value<String>? name,
      Value<LocationType>? type}) {
    return LocationCompanion(
      id: id ?? this.id,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      name: name ?? this.name,
      type: type ?? this.type,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] =
          Variable<int>($LocationTable.$convertertype.toSql(type.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocationCompanion(')
          ..write('id: $id, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('name: $name, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }
}

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
  late final GeneratedColumn<int> locationStart = GeneratedColumn<int>(
      'location_start', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES location (id)'));
  static const VerificationMeta _locationEndMeta =
      const VerificationMeta('locationEnd');
  @override
  late final GeneratedColumn<int> locationEnd = GeneratedColumn<int>(
      'location_end', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES location (id)'));
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        dateTimeStart,
        dateTimeEnd,
        odometerStart,
        odometerEnd,
        locationStart,
        locationEnd,
        notes
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
          .read(DriftSqlType.int, data['${effectivePrefix}location_start'])!,
      locationEnd: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}location_end'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
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
  final int locationStart;
  final int locationEnd;
  final String? notes;
  const DrivingLogData(
      {required this.id,
      required this.dateTimeStart,
      required this.dateTimeEnd,
      required this.odometerStart,
      required this.odometerEnd,
      required this.locationStart,
      required this.locationEnd,
      this.notes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date_time_start'] = Variable<DateTime>(dateTimeStart);
    map['date_time_end'] = Variable<DateTime>(dateTimeEnd);
    map['odometer_start'] = Variable<int>(odometerStart);
    map['odometer_end'] = Variable<int>(odometerEnd);
    map['location_start'] = Variable<int>(locationStart);
    map['location_end'] = Variable<int>(locationEnd);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
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
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
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
      locationStart: serializer.fromJson<int>(json['locationStart']),
      locationEnd: serializer.fromJson<int>(json['locationEnd']),
      notes: serializer.fromJson<String?>(json['notes']),
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
      'locationStart': serializer.toJson<int>(locationStart),
      'locationEnd': serializer.toJson<int>(locationEnd),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  DrivingLogData copyWith(
          {int? id,
          DateTime? dateTimeStart,
          DateTime? dateTimeEnd,
          int? odometerStart,
          int? odometerEnd,
          int? locationStart,
          int? locationEnd,
          Value<String?> notes = const Value.absent()}) =>
      DrivingLogData(
        id: id ?? this.id,
        dateTimeStart: dateTimeStart ?? this.dateTimeStart,
        dateTimeEnd: dateTimeEnd ?? this.dateTimeEnd,
        odometerStart: odometerStart ?? this.odometerStart,
        odometerEnd: odometerEnd ?? this.odometerEnd,
        locationStart: locationStart ?? this.locationStart,
        locationEnd: locationEnd ?? this.locationEnd,
        notes: notes.present ? notes.value : this.notes,
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
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, dateTimeStart, dateTimeEnd, odometerStart,
      odometerEnd, locationStart, locationEnd, notes);
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
          other.notes == this.notes);
}

class DrivingLogCompanion extends UpdateCompanion<DrivingLogData> {
  final Value<int> id;
  final Value<DateTime> dateTimeStart;
  final Value<DateTime> dateTimeEnd;
  final Value<int> odometerStart;
  final Value<int> odometerEnd;
  final Value<int> locationStart;
  final Value<int> locationEnd;
  final Value<String?> notes;
  const DrivingLogCompanion({
    this.id = const Value.absent(),
    this.dateTimeStart = const Value.absent(),
    this.dateTimeEnd = const Value.absent(),
    this.odometerStart = const Value.absent(),
    this.odometerEnd = const Value.absent(),
    this.locationStart = const Value.absent(),
    this.locationEnd = const Value.absent(),
    this.notes = const Value.absent(),
  });
  DrivingLogCompanion.insert({
    this.id = const Value.absent(),
    required DateTime dateTimeStart,
    required DateTime dateTimeEnd,
    required int odometerStart,
    required int odometerEnd,
    required int locationStart,
    required int locationEnd,
    this.notes = const Value.absent(),
  })  : dateTimeStart = Value(dateTimeStart),
        dateTimeEnd = Value(dateTimeEnd),
        odometerStart = Value(odometerStart),
        odometerEnd = Value(odometerEnd),
        locationStart = Value(locationStart),
        locationEnd = Value(locationEnd);
  static Insertable<DrivingLogData> custom({
    Expression<int>? id,
    Expression<DateTime>? dateTimeStart,
    Expression<DateTime>? dateTimeEnd,
    Expression<int>? odometerStart,
    Expression<int>? odometerEnd,
    Expression<int>? locationStart,
    Expression<int>? locationEnd,
    Expression<String>? notes,
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
    });
  }

  DrivingLogCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? dateTimeStart,
      Value<DateTime>? dateTimeEnd,
      Value<int>? odometerStart,
      Value<int>? odometerEnd,
      Value<int>? locationStart,
      Value<int>? locationEnd,
      Value<String?>? notes}) {
    return DrivingLogCompanion(
      id: id ?? this.id,
      dateTimeStart: dateTimeStart ?? this.dateTimeStart,
      dateTimeEnd: dateTimeEnd ?? this.dateTimeEnd,
      odometerStart: odometerStart ?? this.odometerStart,
      odometerEnd: odometerEnd ?? this.odometerEnd,
      locationStart: locationStart ?? this.locationStart,
      locationEnd: locationEnd ?? this.locationEnd,
      notes: notes ?? this.notes,
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
      map['location_start'] = Variable<int>(locationStart.value);
    }
    if (locationEnd.present) {
      map['location_end'] = Variable<int>(locationEnd.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
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
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

class $TagTable extends Tag with TableInfo<$TagTable, TagData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TagTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tag';
  @override
  VerificationContext validateIntegrity(Insertable<TagData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TagData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TagData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $TagTable createAlias(String alias) {
    return $TagTable(attachedDatabase, alias);
  }
}

class TagData extends DataClass implements Insertable<TagData> {
  final int id;
  final String name;
  const TagData({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  TagCompanion toCompanion(bool nullToAbsent) {
    return TagCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory TagData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TagData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  TagData copyWith({int? id, String? name}) => TagData(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('TagData(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TagData && other.id == this.id && other.name == this.name);
}

class TagCompanion extends UpdateCompanion<TagData> {
  final Value<int> id;
  final Value<String> name;
  const TagCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  TagCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<TagData> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  TagCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return TagCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $TagRelationTable extends TagRelation
    with TableInfo<$TagRelationTable, TagRelationData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TagRelationTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _drivingLogMeta =
      const VerificationMeta('drivingLog');
  @override
  late final GeneratedColumn<int> drivingLog = GeneratedColumn<int>(
      'driving_log', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES driving_log (id)'));
  static const VerificationMeta _tagMeta = const VerificationMeta('tag');
  @override
  late final GeneratedColumn<int> tag = GeneratedColumn<int>(
      'tag', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES tag (id)'));
  @override
  List<GeneratedColumn> get $columns => [drivingLog, tag];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tag_relation';
  @override
  VerificationContext validateIntegrity(Insertable<TagRelationData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('driving_log')) {
      context.handle(
          _drivingLogMeta,
          drivingLog.isAcceptableOrUnknown(
              data['driving_log']!, _drivingLogMeta));
    } else if (isInserting) {
      context.missing(_drivingLogMeta);
    }
    if (data.containsKey('tag')) {
      context.handle(
          _tagMeta, tag.isAcceptableOrUnknown(data['tag']!, _tagMeta));
    } else if (isInserting) {
      context.missing(_tagMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  TagRelationData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TagRelationData(
      drivingLog: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}driving_log'])!,
      tag: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tag'])!,
    );
  }

  @override
  $TagRelationTable createAlias(String alias) {
    return $TagRelationTable(attachedDatabase, alias);
  }
}

class TagRelationData extends DataClass implements Insertable<TagRelationData> {
  final int drivingLog;
  final int tag;
  const TagRelationData({required this.drivingLog, required this.tag});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['driving_log'] = Variable<int>(drivingLog);
    map['tag'] = Variable<int>(tag);
    return map;
  }

  TagRelationCompanion toCompanion(bool nullToAbsent) {
    return TagRelationCompanion(
      drivingLog: Value(drivingLog),
      tag: Value(tag),
    );
  }

  factory TagRelationData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TagRelationData(
      drivingLog: serializer.fromJson<int>(json['drivingLog']),
      tag: serializer.fromJson<int>(json['tag']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'drivingLog': serializer.toJson<int>(drivingLog),
      'tag': serializer.toJson<int>(tag),
    };
  }

  TagRelationData copyWith({int? drivingLog, int? tag}) => TagRelationData(
        drivingLog: drivingLog ?? this.drivingLog,
        tag: tag ?? this.tag,
      );
  @override
  String toString() {
    return (StringBuffer('TagRelationData(')
          ..write('drivingLog: $drivingLog, ')
          ..write('tag: $tag')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(drivingLog, tag);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TagRelationData &&
          other.drivingLog == this.drivingLog &&
          other.tag == this.tag);
}

class TagRelationCompanion extends UpdateCompanion<TagRelationData> {
  final Value<int> drivingLog;
  final Value<int> tag;
  final Value<int> rowid;
  const TagRelationCompanion({
    this.drivingLog = const Value.absent(),
    this.tag = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TagRelationCompanion.insert({
    required int drivingLog,
    required int tag,
    this.rowid = const Value.absent(),
  })  : drivingLog = Value(drivingLog),
        tag = Value(tag);
  static Insertable<TagRelationData> custom({
    Expression<int>? drivingLog,
    Expression<int>? tag,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (drivingLog != null) 'driving_log': drivingLog,
      if (tag != null) 'tag': tag,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TagRelationCompanion copyWith(
      {Value<int>? drivingLog, Value<int>? tag, Value<int>? rowid}) {
    return TagRelationCompanion(
      drivingLog: drivingLog ?? this.drivingLog,
      tag: tag ?? this.tag,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (drivingLog.present) {
      map['driving_log'] = Variable<int>(drivingLog.value);
    }
    if (tag.present) {
      map['tag'] = Variable<int>(tag.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagRelationCompanion(')
          ..write('drivingLog: $drivingLog, ')
          ..write('tag: $tag, ')
          ..write('rowid: $rowid')
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
  static const VerificationMeta _volumeMeta = const VerificationMeta('volume');
  @override
  late final GeneratedColumn<double> volume = GeneratedColumn<double>(
      'volume', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _amountPaidMeta =
      const VerificationMeta('amountPaid');
  @override
  late final GeneratedColumn<double> amountPaid = GeneratedColumn<double>(
      'amount_paid', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _locationMeta =
      const VerificationMeta('location');
  @override
  late final GeneratedColumn<int> location = GeneratedColumn<int>(
      'location', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES location (id)'));
  static const VerificationMeta _fuelTypeMeta =
      const VerificationMeta('fuelType');
  @override
  late final GeneratedColumnWithTypeConverter<FuelType, int> fuelType =
      GeneratedColumn<int>('fuel_type', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<FuelType>($GasLogTable.$converterfuelType);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        datetime,
        odometer,
        tankOld,
        tankNew,
        volume,
        amountPaid,
        price,
        location,
        fuelType,
        notes
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
    if (data.containsKey('volume')) {
      context.handle(_volumeMeta,
          volume.isAcceptableOrUnknown(data['volume']!, _volumeMeta));
    } else if (isInserting) {
      context.missing(_volumeMeta);
    }
    if (data.containsKey('amount_paid')) {
      context.handle(
          _amountPaidMeta,
          amountPaid.isAcceptableOrUnknown(
              data['amount_paid']!, _amountPaidMeta));
    } else if (isInserting) {
      context.missing(_amountPaidMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    context.handle(_fuelTypeMeta, const VerificationResult.success());
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
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
      volume: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}volume'])!,
      amountPaid: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount_paid'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}location'])!,
      fuelType: $GasLogTable.$converterfuelType.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}fuel_type'])!),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
    );
  }

  @override
  $GasLogTable createAlias(String alias) {
    return $GasLogTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<FuelType, int, int> $converterfuelType =
      const EnumIndexConverter<FuelType>(FuelType.values);
}

class GasLogData extends DataClass implements Insertable<GasLogData> {
  final int id;
  final DateTime datetime;
  final int odometer;
  final double tankOld;
  final double tankNew;
  final double volume;
  final double amountPaid;
  final double price;
  final int location;
  final FuelType fuelType;
  final String? notes;
  const GasLogData(
      {required this.id,
      required this.datetime,
      required this.odometer,
      required this.tankOld,
      required this.tankNew,
      required this.volume,
      required this.amountPaid,
      required this.price,
      required this.location,
      required this.fuelType,
      this.notes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['datetime'] = Variable<DateTime>(datetime);
    map['odometer'] = Variable<int>(odometer);
    map['tank_old'] = Variable<double>(tankOld);
    map['tank_new'] = Variable<double>(tankNew);
    map['volume'] = Variable<double>(volume);
    map['amount_paid'] = Variable<double>(amountPaid);
    map['price'] = Variable<double>(price);
    map['location'] = Variable<int>(location);
    {
      map['fuel_type'] =
          Variable<int>($GasLogTable.$converterfuelType.toSql(fuelType));
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  GasLogCompanion toCompanion(bool nullToAbsent) {
    return GasLogCompanion(
      id: Value(id),
      datetime: Value(datetime),
      odometer: Value(odometer),
      tankOld: Value(tankOld),
      tankNew: Value(tankNew),
      volume: Value(volume),
      amountPaid: Value(amountPaid),
      price: Value(price),
      location: Value(location),
      fuelType: Value(fuelType),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
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
      volume: serializer.fromJson<double>(json['volume']),
      amountPaid: serializer.fromJson<double>(json['amountPaid']),
      price: serializer.fromJson<double>(json['price']),
      location: serializer.fromJson<int>(json['location']),
      fuelType: $GasLogTable.$converterfuelType
          .fromJson(serializer.fromJson<int>(json['fuelType'])),
      notes: serializer.fromJson<String?>(json['notes']),
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
      'volume': serializer.toJson<double>(volume),
      'amountPaid': serializer.toJson<double>(amountPaid),
      'price': serializer.toJson<double>(price),
      'location': serializer.toJson<int>(location),
      'fuelType': serializer
          .toJson<int>($GasLogTable.$converterfuelType.toJson(fuelType)),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  GasLogData copyWith(
          {int? id,
          DateTime? datetime,
          int? odometer,
          double? tankOld,
          double? tankNew,
          double? volume,
          double? amountPaid,
          double? price,
          int? location,
          FuelType? fuelType,
          Value<String?> notes = const Value.absent()}) =>
      GasLogData(
        id: id ?? this.id,
        datetime: datetime ?? this.datetime,
        odometer: odometer ?? this.odometer,
        tankOld: tankOld ?? this.tankOld,
        tankNew: tankNew ?? this.tankNew,
        volume: volume ?? this.volume,
        amountPaid: amountPaid ?? this.amountPaid,
        price: price ?? this.price,
        location: location ?? this.location,
        fuelType: fuelType ?? this.fuelType,
        notes: notes.present ? notes.value : this.notes,
      );
  @override
  String toString() {
    return (StringBuffer('GasLogData(')
          ..write('id: $id, ')
          ..write('datetime: $datetime, ')
          ..write('odometer: $odometer, ')
          ..write('tankOld: $tankOld, ')
          ..write('tankNew: $tankNew, ')
          ..write('volume: $volume, ')
          ..write('amountPaid: $amountPaid, ')
          ..write('price: $price, ')
          ..write('location: $location, ')
          ..write('fuelType: $fuelType, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, datetime, odometer, tankOld, tankNew,
      volume, amountPaid, price, location, fuelType, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GasLogData &&
          other.id == this.id &&
          other.datetime == this.datetime &&
          other.odometer == this.odometer &&
          other.tankOld == this.tankOld &&
          other.tankNew == this.tankNew &&
          other.volume == this.volume &&
          other.amountPaid == this.amountPaid &&
          other.price == this.price &&
          other.location == this.location &&
          other.fuelType == this.fuelType &&
          other.notes == this.notes);
}

class GasLogCompanion extends UpdateCompanion<GasLogData> {
  final Value<int> id;
  final Value<DateTime> datetime;
  final Value<int> odometer;
  final Value<double> tankOld;
  final Value<double> tankNew;
  final Value<double> volume;
  final Value<double> amountPaid;
  final Value<double> price;
  final Value<int> location;
  final Value<FuelType> fuelType;
  final Value<String?> notes;
  const GasLogCompanion({
    this.id = const Value.absent(),
    this.datetime = const Value.absent(),
    this.odometer = const Value.absent(),
    this.tankOld = const Value.absent(),
    this.tankNew = const Value.absent(),
    this.volume = const Value.absent(),
    this.amountPaid = const Value.absent(),
    this.price = const Value.absent(),
    this.location = const Value.absent(),
    this.fuelType = const Value.absent(),
    this.notes = const Value.absent(),
  });
  GasLogCompanion.insert({
    this.id = const Value.absent(),
    required DateTime datetime,
    required int odometer,
    required double tankOld,
    required double tankNew,
    required double volume,
    required double amountPaid,
    required double price,
    required int location,
    required FuelType fuelType,
    this.notes = const Value.absent(),
  })  : datetime = Value(datetime),
        odometer = Value(odometer),
        tankOld = Value(tankOld),
        tankNew = Value(tankNew),
        volume = Value(volume),
        amountPaid = Value(amountPaid),
        price = Value(price),
        location = Value(location),
        fuelType = Value(fuelType);
  static Insertable<GasLogData> custom({
    Expression<int>? id,
    Expression<DateTime>? datetime,
    Expression<int>? odometer,
    Expression<double>? tankOld,
    Expression<double>? tankNew,
    Expression<double>? volume,
    Expression<double>? amountPaid,
    Expression<double>? price,
    Expression<int>? location,
    Expression<int>? fuelType,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (datetime != null) 'datetime': datetime,
      if (odometer != null) 'odometer': odometer,
      if (tankOld != null) 'tank_old': tankOld,
      if (tankNew != null) 'tank_new': tankNew,
      if (volume != null) 'volume': volume,
      if (amountPaid != null) 'amount_paid': amountPaid,
      if (price != null) 'price': price,
      if (location != null) 'location': location,
      if (fuelType != null) 'fuel_type': fuelType,
      if (notes != null) 'notes': notes,
    });
  }

  GasLogCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? datetime,
      Value<int>? odometer,
      Value<double>? tankOld,
      Value<double>? tankNew,
      Value<double>? volume,
      Value<double>? amountPaid,
      Value<double>? price,
      Value<int>? location,
      Value<FuelType>? fuelType,
      Value<String?>? notes}) {
    return GasLogCompanion(
      id: id ?? this.id,
      datetime: datetime ?? this.datetime,
      odometer: odometer ?? this.odometer,
      tankOld: tankOld ?? this.tankOld,
      tankNew: tankNew ?? this.tankNew,
      volume: volume ?? this.volume,
      amountPaid: amountPaid ?? this.amountPaid,
      price: price ?? this.price,
      location: location ?? this.location,
      fuelType: fuelType ?? this.fuelType,
      notes: notes ?? this.notes,
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
    if (volume.present) {
      map['volume'] = Variable<double>(volume.value);
    }
    if (amountPaid.present) {
      map['amount_paid'] = Variable<double>(amountPaid.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (location.present) {
      map['location'] = Variable<int>(location.value);
    }
    if (fuelType.present) {
      map['fuel_type'] =
          Variable<int>($GasLogTable.$converterfuelType.toSql(fuelType.value));
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
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
          ..write('volume: $volume, ')
          ..write('amountPaid: $amountPaid, ')
          ..write('price: $price, ')
          ..write('location: $location, ')
          ..write('fuelType: $fuelType, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

class $ParkingLogTable extends ParkingLog
    with TableInfo<$ParkingLogTable, ParkingLogData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ParkingLogTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _locationMeta =
      const VerificationMeta('location');
  @override
  late final GeneratedColumn<int> location = GeneratedColumn<int>(
      'location', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES location (id)'));
  static const VerificationMeta _amountPaidMeta =
      const VerificationMeta('amountPaid');
  @override
  late final GeneratedColumn<double> amountPaid = GeneratedColumn<double>(
      'amount_paid', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, dateTimeStart, dateTimeEnd, location, amountPaid, notes];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'parking_log';
  @override
  VerificationContext validateIntegrity(Insertable<ParkingLogData> instance,
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
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    if (data.containsKey('amount_paid')) {
      context.handle(
          _amountPaidMeta,
          amountPaid.isAcceptableOrUnknown(
              data['amount_paid']!, _amountPaidMeta));
    } else if (isInserting) {
      context.missing(_amountPaidMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ParkingLogData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ParkingLogData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      dateTimeStart: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}date_time_start'])!,
      dateTimeEnd: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}date_time_end'])!,
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}location'])!,
      amountPaid: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount_paid'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
    );
  }

  @override
  $ParkingLogTable createAlias(String alias) {
    return $ParkingLogTable(attachedDatabase, alias);
  }
}

class ParkingLogData extends DataClass implements Insertable<ParkingLogData> {
  final int id;
  final DateTime dateTimeStart;
  final DateTime dateTimeEnd;
  final int location;
  final double amountPaid;
  final String? notes;
  const ParkingLogData(
      {required this.id,
      required this.dateTimeStart,
      required this.dateTimeEnd,
      required this.location,
      required this.amountPaid,
      this.notes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date_time_start'] = Variable<DateTime>(dateTimeStart);
    map['date_time_end'] = Variable<DateTime>(dateTimeEnd);
    map['location'] = Variable<int>(location);
    map['amount_paid'] = Variable<double>(amountPaid);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  ParkingLogCompanion toCompanion(bool nullToAbsent) {
    return ParkingLogCompanion(
      id: Value(id),
      dateTimeStart: Value(dateTimeStart),
      dateTimeEnd: Value(dateTimeEnd),
      location: Value(location),
      amountPaid: Value(amountPaid),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory ParkingLogData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ParkingLogData(
      id: serializer.fromJson<int>(json['id']),
      dateTimeStart: serializer.fromJson<DateTime>(json['dateTimeStart']),
      dateTimeEnd: serializer.fromJson<DateTime>(json['dateTimeEnd']),
      location: serializer.fromJson<int>(json['location']),
      amountPaid: serializer.fromJson<double>(json['amountPaid']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'dateTimeStart': serializer.toJson<DateTime>(dateTimeStart),
      'dateTimeEnd': serializer.toJson<DateTime>(dateTimeEnd),
      'location': serializer.toJson<int>(location),
      'amountPaid': serializer.toJson<double>(amountPaid),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  ParkingLogData copyWith(
          {int? id,
          DateTime? dateTimeStart,
          DateTime? dateTimeEnd,
          int? location,
          double? amountPaid,
          Value<String?> notes = const Value.absent()}) =>
      ParkingLogData(
        id: id ?? this.id,
        dateTimeStart: dateTimeStart ?? this.dateTimeStart,
        dateTimeEnd: dateTimeEnd ?? this.dateTimeEnd,
        location: location ?? this.location,
        amountPaid: amountPaid ?? this.amountPaid,
        notes: notes.present ? notes.value : this.notes,
      );
  @override
  String toString() {
    return (StringBuffer('ParkingLogData(')
          ..write('id: $id, ')
          ..write('dateTimeStart: $dateTimeStart, ')
          ..write('dateTimeEnd: $dateTimeEnd, ')
          ..write('location: $location, ')
          ..write('amountPaid: $amountPaid, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, dateTimeStart, dateTimeEnd, location, amountPaid, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ParkingLogData &&
          other.id == this.id &&
          other.dateTimeStart == this.dateTimeStart &&
          other.dateTimeEnd == this.dateTimeEnd &&
          other.location == this.location &&
          other.amountPaid == this.amountPaid &&
          other.notes == this.notes);
}

class ParkingLogCompanion extends UpdateCompanion<ParkingLogData> {
  final Value<int> id;
  final Value<DateTime> dateTimeStart;
  final Value<DateTime> dateTimeEnd;
  final Value<int> location;
  final Value<double> amountPaid;
  final Value<String?> notes;
  const ParkingLogCompanion({
    this.id = const Value.absent(),
    this.dateTimeStart = const Value.absent(),
    this.dateTimeEnd = const Value.absent(),
    this.location = const Value.absent(),
    this.amountPaid = const Value.absent(),
    this.notes = const Value.absent(),
  });
  ParkingLogCompanion.insert({
    this.id = const Value.absent(),
    required DateTime dateTimeStart,
    required DateTime dateTimeEnd,
    required int location,
    required double amountPaid,
    this.notes = const Value.absent(),
  })  : dateTimeStart = Value(dateTimeStart),
        dateTimeEnd = Value(dateTimeEnd),
        location = Value(location),
        amountPaid = Value(amountPaid);
  static Insertable<ParkingLogData> custom({
    Expression<int>? id,
    Expression<DateTime>? dateTimeStart,
    Expression<DateTime>? dateTimeEnd,
    Expression<int>? location,
    Expression<double>? amountPaid,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dateTimeStart != null) 'date_time_start': dateTimeStart,
      if (dateTimeEnd != null) 'date_time_end': dateTimeEnd,
      if (location != null) 'location': location,
      if (amountPaid != null) 'amount_paid': amountPaid,
      if (notes != null) 'notes': notes,
    });
  }

  ParkingLogCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? dateTimeStart,
      Value<DateTime>? dateTimeEnd,
      Value<int>? location,
      Value<double>? amountPaid,
      Value<String?>? notes}) {
    return ParkingLogCompanion(
      id: id ?? this.id,
      dateTimeStart: dateTimeStart ?? this.dateTimeStart,
      dateTimeEnd: dateTimeEnd ?? this.dateTimeEnd,
      location: location ?? this.location,
      amountPaid: amountPaid ?? this.amountPaid,
      notes: notes ?? this.notes,
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
    if (location.present) {
      map['location'] = Variable<int>(location.value);
    }
    if (amountPaid.present) {
      map['amount_paid'] = Variable<double>(amountPaid.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ParkingLogCompanion(')
          ..write('id: $id, ')
          ..write('dateTimeStart: $dateTimeStart, ')
          ..write('dateTimeEnd: $dateTimeEnd, ')
          ..write('location: $location, ')
          ..write('amountPaid: $amountPaid, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $LocationTable location = $LocationTable(this);
  late final $DrivingLogTable drivingLog = $DrivingLogTable(this);
  late final $TagTable tag = $TagTable(this);
  late final $TagRelationTable tagRelation = $TagRelationTable(this);
  late final $GasLogTable gasLog = $GasLogTable(this);
  late final $ParkingLogTable parkingLog = $ParkingLogTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [location, drivingLog, tag, tagRelation, gasLog, parkingLog];
}
