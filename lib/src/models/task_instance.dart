import 'package:isar/isar.dart';
import 'task.dart';

part 'task_instance.g.dart';

@collection
class TaskInstance {
  final Id id = Isar.autoIncrement;
  final task = IsarLink<Task>();
  bool completed = false;
}
