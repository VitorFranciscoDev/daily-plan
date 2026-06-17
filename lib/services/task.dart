import '../entities/entity_task.dart';

/// Represents the contract for task related actions
abstract class TaskService {
  /// Creates a new task with the given information
  Future<void> createNewTask(Task task);

  /// Lists all the tasks from the given date
  Future<List<Task>?> listTaskByDate(DateTime date);

  /// Update the isDone from the given task
  Future<void> updateTaskStatus(int taskId,bool isDone);
}