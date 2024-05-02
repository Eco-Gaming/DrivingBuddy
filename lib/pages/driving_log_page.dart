import 'package:drift/drift.dart' as drift;
import 'package:driving_buddy/pages/about_page.dart';
import 'package:driving_buddy/data/database.dart';
import 'package:driving_buddy/pages/add_driving_log_section_page.dart';
import 'package:driving_buddy/pages/settings_page.dart';
import 'package:driving_buddy/utils.dart';
import 'package:flutter/material.dart';
import 'package:driving_buddy/main.dart';

class DrivingLogPage extends StatefulWidget {
  const DrivingLogPage({super.key, required this.title});

  final String title;

  @override
  State<DrivingLogPage> createState() => _DrivingLogPageState();
}

class _DrivingLogPageState extends State<DrivingLogPage> {

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
      body: _buildDrivingLogList(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddDrivingLogSectionPage(),
            ),
          );
        },
        tooltip: 'Add section',
        child: const Icon(Icons.add),
      ),
    );
  }

  StreamBuilder<List<DrivingLogData>> _buildDrivingLogList(BuildContext context) {
    return StreamBuilder(
      stream: db.drivingLog.select().watch(),
      builder: (context, AsyncSnapshot<List<DrivingLogData>> snapshot) {
        final drivingLogEntries = snapshot.data ?? <DrivingLogData>[];

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Showing ${drivingLogEntries.length} entries:',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
              ),
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
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Theme.of(context).colorScheme.onSecondary
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DateTimeCard(drivingLogEntry: drivingLogEntry),
              const Spacer(),
              Text('${drivingLogEntry.odometerEnd - drivingLogEntry.odometerStart} km'),
              const Spacer(),
              Expanded(
                child: Text('notes TBD'),
              ),
              const Spacer(),
              Text('tags TBD'),
            ],
          ),
        ),
      ),
    );
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

class Spacer extends StatelessWidget {
  const Spacer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8),
      child: Text('*'),
    );
  }
}

class DateTimeCard extends StatelessWidget {
  const DateTimeCard({
    super.key,
    required this.drivingLogEntry,
  });

  final DrivingLogData drivingLogEntry;

  @override
  Widget build(BuildContext context) {

    List<String> start = formatDateTime(drivingLogEntry.dateTimeStart);
    String startDate = start[0];
    String startTime = start[1];
    List<String> end = formatDateTime(drivingLogEntry.dateTimeEnd);
    String endDate = end[0];
    String endTime = end[1];

    late Widget date;

    if (sameDay(drivingLogEntry.dateTimeStart, drivingLogEntry.dateTimeEnd)) {
      date = Text(startDate);
    } else {
      date = Column(
        children: [
          Text(startDate),
          Text(endDate),
        ],
      );
    }

    return Row(
      children: [
        date,
        const Spacer(),
        Column(
          children: [
            Text(startTime),
            Text(endTime),
          ],
        )
      ],
    );
  }
}