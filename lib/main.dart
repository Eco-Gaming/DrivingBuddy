import 'package:driving_buddy/driving_log_page.dart';
import 'package:driving_buddy/gas_log_page.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:driving_buddy/database.dart';
import 'package:driving_buddy/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

late AppDatabase db;
late MethodChannel android;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  db = AppDatabase();
  android = const MethodChannel("me.eco_gaming.driving_buddy/android");

  final settingsState = SettingsState();
  await settingsState.init();

  runApp(appProviders(settingsState));
}

Widget appProviders(SettingsState settingsState) => MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (context) => settingsState),
  ],
  child: const App(),
);

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsState>();

    final defaultTheme = ColorScheme.fromSeed(seedColor: Colors.deepPurple);
    final defaultDark = ColorScheme.fromSeed(
        seedColor: Colors.deepPurple, brightness: Brightness.dark);

    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) => MaterialApp(
        title: 'DrivingBuddy',
        theme: ThemeData(
          colorScheme: settings.systemColors ? lightDynamic : defaultTheme,
          fontFamily: 'Manrope',
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorScheme: settings.systemColors ? darkDynamic : defaultDark,
          fontFamily: 'Manrope',
          useMaterial3: true,
        ),
        themeMode: settings.themeMode,
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsState>();

    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: TabBarView(
            children: [
              DrivingLogPage(),
              GasLogPage(),
            ],
          ),
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.car_crash),
              text: "Driving Log",
            ),
            Tab(
              icon: Icon(Icons.local_gas_station),
              text: "Gas Log",
            ),
          ],
        ),
      ),
    );
  }
}
