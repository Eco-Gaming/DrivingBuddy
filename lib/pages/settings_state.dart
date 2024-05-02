import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsState extends ChangeNotifier {
  SharedPreferences? prefs;

  ThemeMode themeMode = ThemeMode.system;

  bool systemColors = true;
  bool explainedPermissions = false;

  Future<void> init() async {
    final prefsInstance = await SharedPreferences.getInstance();

    prefs = prefsInstance;

    final theme = prefsInstance.getString('themeMode');
    if (theme == "ThemeMode.system") {
      themeMode = ThemeMode.system;
    } else if (theme == "ThemeMode.light") {
      themeMode = ThemeMode.light;
    } else if (theme == "ThemeMode.dark") {
      themeMode = ThemeMode.dark;
    }

    systemColors = prefsInstance.getBool("systemColors") ?? true;
    explainedPermissions =
        prefsInstance.getBool('explainedPermissions') ?? false;
  }

  void setExplained(bool explained) {
    explainedPermissions = explained;
    notifyListeners();
    prefs?.setBool('explainedPermissions', explained);
  }

  void setSystem(bool system) {
    systemColors = system;
    prefs?.setBool('systemColors', system);
    notifyListeners();
  }

  void setTheme(ThemeMode theme) {
    themeMode = theme;
    prefs?.setString('themeMode', theme.toString());
    notifyListeners();
  }
}
