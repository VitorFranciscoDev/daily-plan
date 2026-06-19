/// Represents the contract for notification related actions
abstract class NotificationService {
  /// Initializes the notification service, setting up necessary configurations
   Future<void> init();
  /// Schedules a notification with the given information
   Future<void> scheduleNotification({
    required int id,
    required String title,
    required DateTime scheduledTime,
  });
}