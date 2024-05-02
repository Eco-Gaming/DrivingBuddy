enum FuelType { // Changing the order of these values will break the database!!!
  super95(name: 'Super 95'),
  diesel(name: 'Diesel');

  const FuelType({
    required this.name,
  });

  final String name;
}

enum LocationType { // Changing the order of these values will break the database!!!
  gasStation(name: 'Gas Station'),
  parkingMeter(name: 'Parking Meter'),
  other(name: 'Other');

  const LocationType({
    required this.name,
  });

  final String name;
}