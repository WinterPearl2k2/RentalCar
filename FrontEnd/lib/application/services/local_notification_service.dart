import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rental_car/application/utils/log_utils.dart';

import '../../main.dart';
import 'navigation_service.dart';

class LocalNotificationService {
  static final LocalNotificationService _instance =
      LocalNotificationService._();

  factory LocalNotificationService() => _instance;

  LocalNotificationService._();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    // Initialize native android notification
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // Initialize native Ios Notifications
    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings();

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (
        NotificationResponse notificationResponse,
      ) {
        LogUtils.i('payload: ${notificationResponse.payload}');
        if (notificationResponse.payload != null) {
          switch (notificationResponse.notificationResponseType) {
            case NotificationResponseType.selectedNotification:
              final String payload = notificationResponse.payload.toString();
              String? currentPath;
              injection.getIt<NavigationService>().navigatorKey.currentState?.popUntil(
                (route) {
                  currentPath = route.settings.name;
                  LogUtils.i('currentPath $currentPath');
                  return currentPath != null ||currentPath == payload;
                },
              );
              if(currentPath == payload) break;
              injection.getIt<NavigationService>().navigateTo(
                    payload,
                  );
              break;
            case NotificationResponseType.selectedNotificationAction:
              break;
          }
        }
      },
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );
  }

  @pragma('vm:entry-point')
  static void notificationTapBackground(
      NotificationResponse notificationResponse) {
    LogUtils.i('payload: ${notificationResponse.payload}');
    injection.getIt<NavigationService>().navigateTo(
          notificationResponse.payload.toString(),
        );
  }

  notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'channelId',
        'channelName',
        importance: Importance.max,
      ),
      iOS: DarwinNotificationDetails(),
    );
  }

  Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payLoad,
  }) async {
    return flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      await notificationDetails(),
      payload: payLoad,
    );
  }
}
