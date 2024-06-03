import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:rental_car/application/services/preference_service.dart';

import '../../data/dtos/notification_message_dto.dart';
import '../../firebase_options.dart';
import '../../main.dart';
import '../routes/routes_name.dart';
import '../utils/log_utils.dart';
import 'local_notification_service.dart';
import 'navigation_service.dart';

class FirebaseService {
  FirebaseService._();

  static final FirebaseService _instance = FirebaseService._();

  factory FirebaseService() => _instance;

  static final FirebaseMessaging _message = FirebaseMessaging.instance;

  static Future<void> _handleBackgroundMessage(RemoteMessage msg) async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    final notifierDto = NotificationMessageDto.fromJson(msg.data);
    LogUtils.i(notifierDto.toString());
    injection
        .getIt<NavigationService>()
        .navigateReplaceTo(RoutesName.bottomNavigation);
    injection
        .getIt<NavigationService>()
        .navigateTo(RoutesName.carRentalManagement);
  }

  static Future<void> _handleOpenAppMessage(RemoteMessage msg) async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    final notifierDto = NotificationMessageDto.fromJson(msg.data);
    LogUtils.i(notifierDto.toString());
    injection
        .getIt<NavigationService>()
        .navigateReplaceTo(RoutesName.bottomNavigation);
    injection
        .getIt<NavigationService>()
        .navigateTo(RoutesName.carRentalManagement);
  }

  static Future<void> _handleMessage(RemoteMessage msg) async {
    final notifierDto = NotificationMessageDto.fromJson(msg.data);
    LogUtils.i(notifierDto.toString());
    LocalNotificationService().showNotification(
      title: msg.notification?.title.toString(),
      body: msg.notification?.body.toString(),
      payLoad: RoutesName.carRentalManagement,
    );
  }

  void handleMessage({required onChangedMessage, required onMessageOpenApp}) {
    FirebaseMessaging.onMessage.listen(onChangedMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(onChangedMessage);
  }

  Future<void> initNotifications() async {
    await _message.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: true,
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
