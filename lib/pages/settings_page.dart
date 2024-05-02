import 'package:driving_buddy/delete_records_button.dart';
import 'package:driving_buddy/export_data.dart';
import 'package:driving_buddy/pages/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WidgetSettings {
  final String key;
  final Widget widget;

  WidgetSettings({required this.key, required this.widget});
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final settings = context.read<SettingsState>();
  }

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsState>();
    List<WidgetSettings> children = [
      WidgetSettings(
        key: 'theme',
        widget: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropdownButtonFormField(
            value: settings.themeMode,
            decoration: const InputDecoration(
              labelStyle: TextStyle(),
              labelText: 'Theme',
            ),
            items: const [
              DropdownMenuItem(
                value: ThemeMode.system,
                child: Text("System"),
              ),
              DropdownMenuItem(
                value: ThemeMode.dark,
                child: Text("Dark"),
              ),
              DropdownMenuItem(
                value: ThemeMode.light,
                child: Text("Light"),
              ),
            ],
            onChanged: (value) => settings.setTheme(value!),
          ),
        ),
      ),
      WidgetSettings(
        key: 'system color',
        widget: ListTile(
          title: const Text('System color scheme'),
          onTap: () => settings.setSystem(!settings.systemColors),
          trailing: Switch(
            value: settings.systemColors,
            onChanged: (value) => settings.setSystem(value),
          ),
        ),
      ),
      WidgetSettings(key: 'export data', widget: const ExportData()),
      WidgetSettings(
          key: 'delete records',
          widget: DeleteRecordsButton(
            pageContext: context,
          )),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            SearchBar(
              hintText: "Search...",
              controller: searchController,
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 16.0),
              ),
              onChanged: (_) {
                setState(() {});
              },
              leading: const Icon(Icons.search),
            )
          ] +
              children
                  .where((element) =>
                  element.key.contains(searchController.text.toLowerCase()))
                  .map((e) => e.widget)
                  .toList(),
        ),
      ),
    );
  }
}
