import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../application/services/car_service.dart';
import '../../../../application/utils/log_utils.dart';
import '../../../../data/data_sources/remote/dio/api_client.dart';
import '../../../../data/data_sources/remote/dio/api_exception.dart';
import '../../../../domain/model/calling.dart';
import '../../../../main.dart';
import '../../room_call/room_call_view.dart';
import '../state/calling_state.dart';

part 'calling_notifier.g.dart';

@riverpod
class CallingNotifier extends _$CallingNotifier {
  @override
  CallingState build() => const CallingState();

  Future<void> handleMessage(RemoteMessage msg) async {
    final cancel = msg.data['cancel'] ?? '';
    if (cancel != '' && !(state.newMessage == cancel)) {
      state = state.copyWith(newMessage: cancel);
      Navigator.pop(
        navigatorKey.currentState!.context,
      );
    }
  }

  Future<void> hangUpToUser(String userId) async {
    try {
      await injection
          .getIt<ICarService>()
          .hangUpToUser(
            userId: userId,
          )
          .whenComplete(
            () => Navigator.pop(navigatorKey.currentState!.context),
          );
    } on APIException catch (e) {
      LogUtils.e(e.message.toString());
      Fluttertoast.showToast(msg: e.message.toString());
    }
  }

  void join(Calling calling) {
    var re = RegExp("\\w{4}\\-\\w{4}\\-\\w{4}");
    if (calling.keyRoom.isNotEmpty && re.hasMatch(calling.keyRoom)) {
      Navigator.of(navigatorKey.currentState!.context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => RoomCallView(
            meetingId: calling.keyRoom,
            token: ApiClient.instance.token,
            userOwner: calling.mainUser,
            type: false,
          ),
        ),
      );
    }
  }

  // Future<void> _handleOpenAppMessage(RemoteMessage msg) async {
  //   await Firebase.initializeApp(
  //     options: DefaultFirebaseOptions.currentPlatform,
  //   );
  //   final notifierDto = NotificationMessageDto.fromJson(msg.data);
  // }

  Future<void> listenCalling(mounted, StreamSubscription fcmListener) async {
    if (!mounted) return;
    fcmListener = FirebaseMessaging.onMessage.listen(handleMessage);
  }
}
