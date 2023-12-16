import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoyee/constants/constants.dart';
part 'task.g.dart';

@HiveType(typeId: K.taskTypeId)
class Task extends HiveObject {
  @HiveField(0)
  String taskName;

  @HiveField(1)
  bool isCompleted;

  Task(this.taskName, this.isCompleted);
}
