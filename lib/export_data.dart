import 'package:csv/csv.dart';
import 'package:drift/drift.dart';
import 'package:driving_buddy/main.dart';
import 'package:driving_buddy/utils.dart';
import 'package:flutter/material.dart';

class ExportData extends StatelessWidget {
  const ExportData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Wrap(
                children: <Widget>[
                  ListTile(
                      leading: const Icon(Icons.insights),
                      title: const Text('Driving Log'),
                      onTap: () async {
                        Navigator.pop(context);
                        final drivingLogEntries = await db.drivingLog.select().get();
                        final List<List<dynamic>> csvData = [
                          [
                            'id',
                            'dateTimeStart',
                            'dateTimeEnd',
                            'odometerStart',
                            'odometerEnd',
                            'locationStart',
                            'locationEnd',
                            'notes',
                            'tags'
                          ]
                        ];
                        for (var drivingLog in drivingLogEntries) {
                          csvData.add([
                            drivingLog.id,
                            drivingLog.dateTimeStart,
                            drivingLog.dateTimeEnd,
                            drivingLog.odometerStart,
                            drivingLog.odometerEnd,
                            drivingLog.locationStart,
                            drivingLog.locationEnd,
                            drivingLog.notes,
                            drivingLog.tags,
                          ]);
                        }

                        if (!await requestNotificationPermission()) return;
                        final csv = const ListToCsvConverter(eol: "\n")
                            .convert(csvData);
                        android.invokeMethod('save', ['driving_log.csv', csv]);
                      }),
                  ListTile(
                    leading: const Icon(Icons.event),
                    title: const Text('Gas Log'),
                    onTap: () async {
                      Navigator.pop(context);
                      final gasLogEntries = await db.gasLog.select().get();
                      final List<List<dynamic>> csvData = [
                        [
                          'datetime',
                          'odometer',
                          'tankOld',
                          'tankNew',
                          'liters',
                          'euros',
                          'pricePerLiter',
                          'location',
                          'fuelType',
                          'notes',
                          'tags'
                        ]
                      ];
                      for (var gasLog in gasLogEntries) {
                        csvData.add([
                          gasLog.datetime,
                          gasLog.odometer,
                          gasLog.tankOld,
                          gasLog.tankNew,
                          gasLog.liters,
                          gasLog.euros,
                          gasLog.pricePerLiter,
                          gasLog.location,
                          gasLog.fuelType,
                          gasLog.notes,
                          gasLog.tags
                        ]);
                      }

                      if (!await requestNotificationPermission()) return;
                      final csv =
                      const ListToCsvConverter(eol: "\n").convert(csvData);
                      android.invokeMethod('save', ['gas_log.csv', csv]);
                    },
                  ),
                ],
              );
            },
          );
        },
        icon: const Icon(Icons.download),
        label: const Text('Export data'));
  }
}
