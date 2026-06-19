import 'package:daily_plan/services/impl/notification_service.dart';
import 'package:daily_plan/services/impl/task_service.dart';
import 'package:daily_plan/services/notification.dart';
import 'package:daily_plan/services/task.dart';

/// Global instance for task service
late final TaskService taskService;
late final NotificationService notificationService;
/// Initialize the services for the application
Future<void> initialize() async {
  taskService = newTaskService();
  notificationService = newNotificationService();
  await notificationService.init();
}