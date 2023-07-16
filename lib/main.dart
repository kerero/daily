import 'package:daily/src/models/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/app.dart';
import 'src/providers/isar_pod.dart';
import 'src/providers/settings_pod.dart';

void main() async {
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(const MaterialApp(
      home: Scaffold(
          body: Center(child: Text('Loading'))))); //TODO: splash screen
  final container = ProviderContainer();
  await container.read(isarFuturePod.future);
  await container.read(settingsFuturePod.future);
  await initSettings(container);

  runApp(
      UncontrolledProviderScope(container: container, child: const DailyApp()));
}

Future initSettings(ProviderContainer ref) async {
  final isar = ref.read(isarPod);
  final settings = await isar.settings.get(Settings.idConstant);
  if (settings == null) {
    await isar.writeTxn(() => isar.settings.put(Settings()));
  }
}
