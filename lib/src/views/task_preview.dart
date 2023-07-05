// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:daily/src/providers/isar_pod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/task_instance.dart';

class TaskPreview extends ConsumerWidget {
  final TaskInstance taskInstance;
  const TaskPreview({
    super.key,
    required this.taskInstance,
  });

  @override
  Widget build(context, ref) {
    final isar = ref.read(isarPod);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Checkbox(
                shape: const CircleBorder(),
                value: taskInstance.completed,
                onChanged: (b) {
                  taskInstance.completed = b ?? taskInstance.completed;
                  isar.writeTxn(() => isar.taskInstances.put(taskInstance));
                }),
            Text(
              taskInstance.task.value!.title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
