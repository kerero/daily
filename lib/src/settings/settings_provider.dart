import 'package:daily/src/settings/settings_controller.dart';
import 'package:daily/src/settings/settings_service.dart';
import 'package:riverpod/riverpod.dart';

final settingsControllerPod = FutureProvider((ref) async {
  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();
  return settingsController;
});
