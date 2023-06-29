import 'package:daily/src/constants.dart';
import 'package:daily/src/models/task.dart';
import 'package:daily/src/models/task_instance.dart';
import 'package:daily/src/providers/isar_pod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';

class AddTask extends HookConsumerWidget {
  const AddTask({super.key});
  static const btnSize = 60.0;

  @override
  Widget build(BuildContext context, ref) {
    final isar = ref.read(isarPod);
    final textController = useTextEditingController();
    onSubmit() {
      addTask(textController.value.text, isar);
      textController.clear();
    }

    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).primaryColorLight),
          borderRadius:
              const BorderRadius.all(Radius.circular(Constants.borderRadius))),
      padding: const EdgeInsets.only(left: 15, bottom: 1),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onSubmitted: (_) => onSubmit(),
              controller: textController,
              decoration: InputDecoration(
                  hintText: 'Create a new task',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey.shade400)),
            ),
          ),
          ElevatedButton(
            onPressed: onSubmit,
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(btnSize, btnSize),
              elevation: 0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(Constants.borderRadius)),
              ),
            ),
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  void addTask(String title, Isar isar) async {
    await isar.writeTxn(() async {
      final newTask = Task()..title = title;
      await isar.tasks.put(newTask);
      final newTaskInstance = TaskInstance()..task.value = newTask;
      await isar.taskInstances.put(newTaskInstance);
      await newTaskInstance.task.save();
    });
  }
}
