import 'package:isar/isar.dart';
import 'task.dart';

part 'task_instance.g.dart';

@collection
class TaskInstance {
  Id? id;
  final task = IsarLink<Task>();
  bool completed = false;
}
