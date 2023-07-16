import 'package:daily/src/models/task.dart';
import 'package:daily/src/models/task_instance.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:riverpod/riverpod.dart';
import 'isar_pod.dart';

final tasksChangeEventPod = Provider<void>((ref) {
  final isar = ref.read(isarPod);
  isar.taskInstances.watchLazy().listen((_) => ref.notifyListeners());
  isar.tasks.watchLazy().listen((_) => ref.notifyListeners());
});
