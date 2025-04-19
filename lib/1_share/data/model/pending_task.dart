import 'package:hive/hive.dart';
part 'pending_task.g.dart';
@HiveType(typeId: 0)
class PendingTask {
  @HiveField(0)
  String processInstanceId;

  @HiveField(1)
  String taskInstanceId;

  @HiveField(2)
  String taskName;

  PendingTask({
    required this.processInstanceId,
    required this.taskInstanceId,
    required this.taskName,
  });
}
