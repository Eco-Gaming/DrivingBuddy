import 'package:drift/drift.dart' as drift;
import 'package:driving_buddy/database.dart';
import 'package:flutter/material.dart';
import 'package:driving_buddy/main.dart';

class DrivingLogPage extends StatefulWidget {
  const DrivingLogPage({super.key, required this.title});

  final String title;

  @override
  State<DrivingLogPage> createState() => _DrivingLogPageState();
}

class _DrivingLogPageState extends State<DrivingLogPage> {

  void _addSection() async {
    db.drivingLog.insertOne(DrivingLogCompanion.insert(
      dateTimeStart: DateTime.now(),
      dateTimeEnd: DateTime.now(),
      odometerStart: 0,
      odometerEnd: 1,
      locationStart: "home",
      locationEnd: "home 2",
      notes: "test",
      tags: "",
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: _buildDrivingLogList(context),
      floatingActionButton: FloatingActionButton(
        onPressed: _addSection,
        tooltip: 'Add section',
        child: const Icon(Icons.add),
      ),
    );
  }

  StreamBuilder<List<DrivingLogData>> _buildDrivingLogList(BuildContext context) {
    return StreamBuilder(
      stream: db.watchAllDrivingLogEntries(),
      builder: (context, AsyncSnapshot<List<DrivingLogData>> snapshot) {
        final drivingLogEntries = snapshot.data ?? <DrivingLogData>[];

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text('Showing ${drivingLogEntries.length} entries:'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: drivingLogEntries.length,
                itemBuilder: (_, index) {
                  final drivingLogEntry = drivingLogEntries[index];
                  return _buildListItem(drivingLogEntry, db);
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildListItem(DrivingLogData drivingLogEntry, AppDatabase database) {
    return Text(drivingLogEntry.odometerEnd.toString());
  }
}