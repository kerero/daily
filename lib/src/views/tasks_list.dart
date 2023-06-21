import 'package:daily/src/models/task.dart';
import 'package:daily/src/providers/isar_pod.dart';
import 'package:daily/src/providers/tasks_pod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'add_task.dart';

/// Displays detailed information about a SampleItem.
class TasksList extends ConsumerWidget {
  const TasksList({super.key});

  static const routeName = '/sample_item';

  @override
  Widget build(context, ref) {
    final isar = ref.read(isarPod);

    final itemTemplate = Card(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Title(color: Colors.black, child: const Text("Title")),
      ),
    );

    return Stack(children: [
      ListView(
        children: [itemTemplate, itemTemplate, itemTemplate],
      ),
      Positioned(
        bottom: MediaQuery.of(context).viewInsets.bottom + 25,
        right: 25,
        left: 10,
        child: const AddTask(),
      )
    ]);
  }
}
