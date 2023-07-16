import 'package:animated_list_plus/animated_list_plus.dart';
import 'package:animated_list_plus/transitions.dart';
import 'package:daily/src/models/task.dart';
import 'package:daily/src/models/task_instance.dart';
import 'package:daily/src/providers/isar_pod.dart';
import 'package:daily/src/providers/tasks_pod.dart';
import 'package:daily/src/utils.dart';
import 'package:daily/src/views/task_preview.dart';
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

    ref.watch(tasksChangeEventPod);
    final data = isar.taskInstances.where().sortByCompleted().findAllSync();
    return Stack(children: [
      ImplicitlyAnimatedList(
        items: data,
        areItemsTheSame: (oldItem, newItem) => oldItem.id == newItem.id,
        itemBuilder: (context, animation, item, i) {
          return SizeFadeTransition(
            sizeFraction: 0.7,
            curve: Curves.easeInOut,
            animation: animation,
            child: TaskPreview(taskInstance: item),
          );
        },
      ),
      Positioned(
        bottom: MediaQuery.of(context).viewInsets.bottom + 25,
        right: MediaQuery.of(context).size.width * 0.2,
        left: MediaQuery.of(context).size.width * 0.2,
        child: const AddTask(),
      )
    ]);
  }
}
