import 'package:daily_plan/services/impl/task_service.dart';
import 'package:daily_plan/services/task.dart';

/// Global instance for task service
late final TaskService taskService;

/// Initialize the services for the application
void initialize() {
  taskService = newTaskService();
}