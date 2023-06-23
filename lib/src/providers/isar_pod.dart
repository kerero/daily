import 'package:daily/src/models/task.dart';
import 'package:daily/src/models/task_instance.dart';
import 'package:riverpod/riverpod.dart';
import 'package:isar/isar.dart';
import 'package:daily/src/models/settings.dart';

final isarPod = Provider((ref) {
  return ref.watch(isarFuturePod).maybeWhen(
        data: (d) => d,
        orElse: () => throw Exception('Isar uninitialized'),
      );
});

final isarFuturePod = FutureProvider((ref) async {
  return Isar.open([SettingsSchema, TaskSchema, TaskInstanceSchema],
      directory: '.');
});
