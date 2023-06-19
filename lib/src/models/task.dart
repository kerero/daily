import 'package:isar/isar.dart';

part 'task.g.dart';

@collection
class Task {
  final Id id = Isar.autoIncrement;
  String title = '';
  String description = '';
}
