import 'package:drift/drift.dart' as drift;
import 'package:driving_buddy/constants.dart';
import 'package:driving_buddy/pages/about_page.dart';
import 'package:driving_buddy/data/database.dart';
import 'package:driving_buddy/pages/settings_page.dart';
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
      volume: 40,
      amountPaid: 99,
      price: 10,
      location: 0,
      fuelType: FuelType.diesel,
      notes: const drift.Value<String?>("test"),
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
              _aboutPage(context),
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
      stream: db.gasLog.select().watch(),
      builder: (context, AsyncSnapshot<List<GasLogData>> snapshot) {
        final gasLogEntries = snapshot.data ?? <GasLogData>[];

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Showing ${gasLogEntries.length} entries:',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
              ),
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

  PopupMenuItem<dynamic> _aboutPage(BuildContext context) {
    return PopupMenuItem(
      child: ListTile(
        leading: const Icon(Icons.info),
        title: const Text('About'),
        onTap: () async {
          Navigator.pop(context);
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AboutPage()),
          );
        },
      ),
    );
  }
}