import 'package:drift/drift.dart' as drift;
import 'package:driving_buddy/data/database.dart';
import 'package:driving_buddy/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:driving_buddy/main.dart';

class GasLogPage extends StatefulWidget {
  const GasLogPage({super.key, required this.title});

  final String title;

  @override
  State<GasLogPage> createState() => _GasLogPageState();
}

class _GasLogPageState extends State<GasLogPage> {

  void _addGasEntry() async {
    db.gasLog.insertOne(GasLogCompanion.insert(
      datetime: DateTime.now(),
      odometer: 0,
      tankOld: 0,
      tankNew: 1,
      liters: 40,
      euros: 99,
      pricePerLiter: 10,
      location: "gas station",
      fuelType: "Diesel",
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
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (context) => [
              _settingsPage(context),
            ],
          )
        ],
      ),
      body: _buildGasLogList(context),
      floatingActionButton: FloatingActionButton(
        onPressed: _addGasEntry,
        tooltip: 'Add Gas Entry',
        child: const Icon(Icons.add),
      ),
    );
  }

  StreamBuilder<List<GasLogData>> _buildGasLogList(BuildContext context) {
    return StreamBuilder(
      stream: db.watchAllGasLogEntries(),
      builder: (context, AsyncSnapshot<List<GasLogData>> snapshot) {
        final gasLogEntries = snapshot.data ?? <GasLogData>[];

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text('Showing ${gasLogEntries.length} entries:'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: gasLogEntries.length,
                itemBuilder: (_, index) {
                  final gasLogEntry = gasLogEntries[index];
                  return _buildListItem(gasLogEntry, db);
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildListItem(GasLogData gasLogEntry, AppDatabase database) {
    return Text(gasLogEntry.tankNew.toString());
  }

  PopupMenuItem<dynamic> _settingsPage(BuildContext context) {
    return PopupMenuItem(
      child: ListTile(
        leading: const Icon(Icons.settings),
        title: const Text('Settings'),
        onTap: () async {
          Navigator.pop(context);
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SettingsPage()),
          );
        },
      ),
    );
  }
}