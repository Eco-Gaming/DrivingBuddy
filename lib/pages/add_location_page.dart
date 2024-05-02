import 'package:drift/drift.dart' as drift;
import 'package:driving_buddy/constants.dart';
import 'package:driving_buddy/data/database.dart';
import 'package:driving_buddy/main.dart';
import 'package:flutter/material.dart';

class AddLocationPage extends StatefulWidget {
  const AddLocationPage({super.key});

  @override
  State<AddLocationPage> createState() => _AddLocationPageState();
}

class _AddLocationPageState extends State<AddLocationPage> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationDataController = TextEditingController();
  LocationType _locationType = LocationType.other;

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _save() async {
    if (_nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Give this location a name first')),
      );
      return;
    } else if (_locationDataController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter LocationData first')),
      );
      return;
    }

    Navigator.pop(context);
    db.location.insertOne(LocationCompanion.insert(
        latitude: 0.0,
        longitude: 0.0,
        name: _nameController.text,
        type: _locationType,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true, // showExitRationale(context)
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Location'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                textCapitalization: TextCapitalization.words,
                autofocus: true,
              ),
              TextField( // TODO: Proper Location Input!
                controller: _locationDataController,
                decoration: const InputDecoration(labelText: 'LocationData (this field isn\'t used yet)'),
              ),
              DropdownButtonFormField<LocationType>(
                value: _locationType,
                decoration: const InputDecoration(labelText: 'Location Type'),
                items: LocationType.values.map((LocationType value) {
                  return DropdownMenuItem<LocationType>(
                    value: value,
                    child: Text(value.name),
                  );
                }).toList(),
                onChanged: (LocationType? newValue) {
                  setState(() {
                    _locationType = newValue!;
                  });
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _save,
          tooltip: 'Save Location',
          child: const Icon(Icons.save),
        ),
      ),
    );
  }

  Future<bool?> showExitRationale(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Leave'),
          content: const Text('Leaving this page will discard your inputs.'),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: const Text('Leave'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }
}