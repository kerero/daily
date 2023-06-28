import 'package:daily/src/models/task_instance.dart';
import 'package:daily/src/providers/isar_pod.dart';
import 'package:daily/src/providers/tasks_pod.dart';
import 'package:daily/src/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import 'add_task.dart';

/// Displays detailed information about a SampleItem.
class TasksList extends ConsumerWidget {
  const TasksList({super.key});

  static const routeName = '/sample_item';

  @override
  Widget build(context, ref) {
    final isar = ref.read(isarPod);
    final tasksStream =
        isar.taskInstances.where().build().watch(fireImmediately: true);
    return Stack(children: [
      StreamBuilderTimeout(
        stream: tasksStream,
        timeout: const Duration(seconds: 5),
        onData: (data) => ListView(
          children: data.map((e) => tasksItemBuilder(e)).toList(),
        ),
      ),
      Positioned(
        bottom: MediaQuery.of(context).viewInsets.bottom + 25,
        right: MediaQuery.of(context).size.width * 0.2,
        left: MediaQuery.of(context).size.width * 0.2,
        child: const AddTask(),
      )
    ]);
  }

  Widget tasksItemBuilder(TaskInstance taskInstance) {
    final title = taskInstance.task.value!.title;
    final itemTemplate = Card(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Title(color: Colors.black, child: Text(title)),
      ),
    );
    return itemTemplate;
  }
}
