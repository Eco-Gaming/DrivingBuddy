import 'package:drift/drift.dart' as drift;
import 'package:driving_buddy/constants.dart';
import 'package:driving_buddy/data/database.dart';
import 'package:driving_buddy/main.dart';
import 'package:driving_buddy/utils.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class AddLocationPage extends StatefulWidget {
  const AddLocationPage({super.key});

  @override
  State<AddLocationPage> createState() => _AddLocationPageState();
}

class _AddLocationPageState extends State<AddLocationPage> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationLatController = TextEditingController();
  final TextEditingController _locationLongController = TextEditingController();
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
    } else if (_locationLatController.text.isEmpty || _locationLatController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter Location first')),
      );
      return;
    }

    var rows = db.location.select()..where((l) => l.name.equals(_nameController.text));
    var result = await rows.get();

    if (result.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('A Location with that name already exists!'))
      );
    } else {
      Navigator.pop(context);
      db.location.insertOne(LocationCompanion.insert(
        latitude: double.parse(_locationLatController.text),
        longitude: double.parse(_locationLongController.text),
        name: _nameController.text,
        type: _locationType,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (allowed) async {
        if (!allowed) {
          bool? exit = await showExitRationale(context);
          if (exit != null && exit && context.mounted) Navigator.pop(context);
        }
      },
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
              TextField(
                controller: _locationLatController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(labelText: 'Latitude'),
              ),
              TextField(
                controller: _locationLongController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(labelText: 'Longitude'),
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _getCurrentPosition,
                      icon: const Icon(Icons.my_location),
                      label: const Text('Get current Location'),
                    ),
                  ),
                ],
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

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Location services are disabled. Please enable the services'))
      );
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Location permissions are denied'))
        );
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Location permissions are permanently denied, we cannot request permissions.'))
      );
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;

    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
          setState(() {
            _locationLatController.text = position.latitude.toString();
            _locationLongController.text = position.longitude.toString();
          });
        }).catchError((e) {
           debugPrint(e);
    });
  }
}