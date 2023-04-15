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
  final container = ProviderContainer();
  await container.read(isarFuturePod.future);
  await container.read(settingsFuturePod.future);

  runApp(
      UncontrolledProviderScope(container: container, child: const DailyApp()));
}
