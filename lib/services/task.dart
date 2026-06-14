import '../entities/entity_task.dart';

abstract class TaskService {
  Future<void> createNewTask(Task task);
}