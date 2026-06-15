import '../entities/entity_task.dart';

/// Represents the contract for task related actions
abstract class TaskService {
  /// Creates a new task with the given information
  Future<void> createNewTask(Task task);
}