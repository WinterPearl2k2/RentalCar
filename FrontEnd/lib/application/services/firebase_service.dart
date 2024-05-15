import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:rental_car/application/routes/routes_name.dart';
import 'package:rental_car/application/services/preference_service.dart';
import 'package:rental_car/application/utils/log_utils.dart';
import 'package:rental_car/data/dtos/notification_message_dto.dart';

import '../../main.dart';
import 'local_notification_service.dart';
import 'navigation_service.dart';

class FirebaseService {
  FirebaseService._();

  static final FirebaseService _instance = FirebaseService._();

  factory FirebaseService() => _instance;

  static final FirebaseMessaging _message = FirebaseMessaging.instance;

  static Future<void> _handleBackgroundMessage(RemoteMessage msg) async {
    final notifierDto = NotificationMessageDto.fromJson(msg.data);
    LogUtils.i(notifierDto.toString());
    injection
        .getIt<NavigationService>()
        .navigateReplaceTo(RoutesName.bottomNavigation)
        .whenComplete(
          () => injection
          .getIt<NavigationService>()
          .navigateTo(RoutesName.notification),
    );
  }

  static Future<void> _handleOpenAppMessage(RemoteMessage msg) async {
    final notifierDto = NotificationMessageDto.fromJson(msg.data);
    LogUtils.i(notifierDto.toString());
    injection
        .getIt<NavigationService>()
        .navigateReplaceTo(RoutesName.bottomNavigation)
        .whenComplete(
          () => injection
              .getIt<NavigationService>()
              .navigateTo(RoutesName.notification),
        );
  }

  Future<void> _handleMessage(RemoteMessage msg) async {
    final notifierDto = NotificationMessageDto.fromJson(msg.data);
    LogUtils.i(notifierDto.toString());
    LocalNotificationService().showNotification(
      title: msg.notification?.title.toString(),
      body: msg.notification?.body.toString(),
      payLoad: RoutesName.notification,
    );
  }

  Future<void> initNotifications() async {
    await _message.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: false,
      sound: true,
    );
    final fcmToken = await _message.getToken();
    if (fcmToken != null) {
      LogUtils.i('Token $fcmToken');
      PreferenceService.setDeviceToken(fcmToken);
    }
    FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen(_handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(_handleOpenAppMessage);
  }
}
