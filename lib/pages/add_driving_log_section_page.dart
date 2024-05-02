import 'package:drift/drift.dart';
import 'package:driving_buddy/pages/add_location_page.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material;

import '../data/database.dart';
import '../main.dart';

class AddDrivingLogSectionPage extends StatefulWidget {
  const AddDrivingLogSectionPage({super.key});

  @override
  State<AddDrivingLogSectionPage> createState() => _AddDrivingLogSectionPageState();
}

class _AddDrivingLogSectionPageState extends State<AddDrivingLogSectionPage> {

  final TextEditingController _odometerStartController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _save() async {
    Navigator.pop(context);
    db.drivingLog.insertOne(DrivingLogCompanion.insert(
      dateTimeStart: DateTime.now(),
      dateTimeEnd: DateTime.now(),
      odometerStart: int.parse(_odometerStartController.text),
      odometerEnd: int.parse(_odometerStartController.text) + 5,
      locationStart: 1,
      locationEnd: 2,
      notes: const Value<String?>("notes"),
    ));
  }

  Future<List<LocationData>> _getData(String filter) {
    String regexPattern = '^${RegExp.escape(filter)}.*';
    var rows = db.location.select()..where((t) => t.name.regexp(regexPattern, caseSensitive: false));
    return rows.get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Section'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: material.Column(
          children: [
            TextField(
              controller: _odometerStartController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Current odometer value'),
              autofocus: true,
            ),
            Row(
              children: [
                Expanded(
                  child: DropdownSearch<LocationData>(
                    asyncItems: (String filter) => _getData(filter),
                    itemAsString: (LocationData l) => l.name,
                    onChanged: (LocationData? l) => print(l!.name),
                    dropdownDecoratorProps: const DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(labelText: "Start Location"),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  tooltip: "Add Location",
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddLocationPage(),
                      ),
                    );
                  },
                )
              ],
            ),
            TextField(
              controller: _notesController,
              decoration: const InputDecoration(labelText: 'Notes (can also be added later)'),
              textCapitalization: TextCapitalization.sentences,
            ),
            ElevatedButton(
              onPressed: _save,
              child: const Text('Start Section'),
            ),
          ],
        ),
      ),
    );
  }
}