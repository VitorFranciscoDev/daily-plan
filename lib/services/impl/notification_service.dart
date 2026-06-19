import 'package:daily_plan/services/notification.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

NotificationService newNotificationService() {
  return _NotificationService();
}

class _NotificationService implements NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Função auxiliar para garantir que o fuso horário está pronto
  void _ensureTimeZonesInitialized() {
    try {
      tz.initializeTimeZones();
      // Tenta ler o local atual, se falhar (der o LateInitializationError), ele cai no catch e define
      tz.local; 
    } catch (_) {
      tz.setLocalLocation(tz.getLocation('America/Sao_Paulo'));
    }
  }

  @override
  Future<void> init() async {
    _ensureTimeZonesInitialized();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
        
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
        
    await requestPermissions();
    await _notificationsPlugin.initialize(initializationSettings);
  }

  @override
  Future<void> scheduleNotification({
    required int id,
    required String title,
    required DateTime scheduledTime,
  }) async {
    // Garante a inicialização do fuso horário novamente antes do agendamento
    _ensureTimeZonesInitialized();

    final tz.TZDateTime tzScheduledTime = tz.TZDateTime.from(
      scheduledTime,
      tz.local,
    );

    if (tzScheduledTime.isBefore(tz.TZDateTime.now(tz.local))) return;

    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
          'task_channel_v2',
          'Lembretes de Tarefas importantes',
          icon: '@mipmap/ic_launcher',
          importance: Importance.max,
          priority: Priority.high,
          playSound: true,
        );

    await _notificationsPlugin.zonedSchedule(
      id,
      'Lembrete de Tarefa',
      title,
      tzScheduledTime,
      const NotificationDetails(android: androidDetails),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,    );
  }

  static Future<void> requestPermissions() async {
    final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
        _notificationsPlugin
            .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin
            >();

    if (androidImplementation != null) {
      await androidImplementation.requestNotificationsPermission();
      await androidImplementation.requestExactAlarmsPermission();
    }
  }

  @override
  Future<void> showInstantNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
          'task_channel_v3',
          'Lembretes de Tarefas',
          icon: '@mipmap/ic_launcher',
          importance: Importance.max,
          priority: Priority.high,
          playSound: true,
        );

    await _notificationsPlugin.show(
      id,
      title,
      body,
      const NotificationDetails(android: androidDetails),
    );
  }
}