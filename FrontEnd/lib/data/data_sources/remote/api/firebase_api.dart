import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rental_car/application/services/preference_service.dart';
import 'package:rental_car/application/utils/log_utils.dart';

class FirebaseApi {
  final _message = FirebaseMessaging.instance;

  Future<void> handleBackgroundMessage(RemoteMessage msg) async {
    Fluttertoast.showToast(
        msg: 'handleBackgroundMessage: ${msg.notification?.title.toString()}');
  }

  Future<void> listenForegroundMessage({required handleMessage}) async {
    FirebaseMessaging.onMessage.listen(handleMessage);
  }

  Future<void> initNotifications() async {
    await _message.requestPermission();
    final fcmToken = await _message.getToken();
    if (fcmToken != null) {
      LogUtils.i('Token $fcmToken');
      PreferenceService.setDeviceToken(fcmToken);
    }
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}
