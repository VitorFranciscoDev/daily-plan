import 'package:daily_plan/services/impl/notification_service.dart';
import 'package:daily_plan/services/impl/task_service.dart';
import 'package:daily_plan/services/impl/theme_service.dart';
import 'package:daily_plan/services/notification.dart';
import 'package:daily_plan/services/task.dart';
import 'package:daily_plan/services/theme.dart';

/// Global instance for task service
late final TaskService taskService;
late final NotificationService notificationService;
late final AppThemeService appThemeService;

/// Initialize the services for the application
Future<void> initialize() async {
  taskService = newTaskService();
  notificationService = newNotificationService();
  appThemeService = newAppThemeService();
  await notificationService.init();
}
