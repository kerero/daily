import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';
import 'package:daily/src/models/settings.dart';
import 'isar_pod.dart';

final settingsPod = Provider<Settings>((ref) {
  return ref.watch(settingsFuturePod).maybeWhen(
        data: (d) => d,
        orElse: () => throw Exception('Isar uninitialized'),
      );
});

final settingsFuturePod = FutureProvider<Settings>((ref) async {
  final isar = await ref.read(isarFuturePod.future);
  isar.settings.watchObject(Settings.idConstant).listen((event) {
    if (event != null) {
      ref.state = AsyncData(event);
    }
  });
  return await isar.settings.get(Settings.idConstant) ?? Settings();
});
