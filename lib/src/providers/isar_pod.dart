import 'package:riverpod/riverpod.dart';
import 'package:isar/isar.dart';
import 'package:daily/src/models/app_settings.dart';

final isarPod = FutureProvider((ref) async {
  return Isar.open([SettingsSchema]);
});
