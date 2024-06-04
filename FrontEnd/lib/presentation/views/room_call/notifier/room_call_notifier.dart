import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rental_car/application/services/car_service.dart';
import 'package:rental_car/main.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:videosdk/videosdk.dart';

import '../../../../application/utils/log_utils.dart';
import '../../../../data/data_sources/remote/dio/api_exception.dart';
import '../state/room_call_state.dart';

part 'room_call_notifier.g.dart';

@riverpod
class RoomCallNotifier extends _$RoomCallNotifier {
  @override
  RoomCallState build() => const RoomCallState();

  Future<void> initData(Room room) async {
    await Future.delayed(
      const Duration(milliseconds: 1),
    );
    state = state.copyWith(
      wait: true,
    );
    setMeetingEventListener(room);
    state = state.copyWith(
      wait: false,
    );
  }

  void setMeetingEventListener(Room room) {
    room.on(
      Events.roomJoined,
      () {
        state.participants.putIfAbsent(
          room.localParticipant.id,
          () => room.localParticipant,
        );
        state = state.copyWith(participants: state.participants);
      },
    );

    room.on(
      Events.participantJoined,
      (Participant participant) {
        () => state.participants.putIfAbsent(
              participant.id,
              () => participant,
            );
        state = state.copyWith(participants: state.participants);
      },
    );

    room.on(
      Events.participantLeft,
      (String participantId) {
        if (state.participants.containsKey(participantId)) {
          () => state.participants.remove(participantId);
          state = state.copyWith(participants: state.participants);
        }
      },
    );

    room.on(
      Events.roomLeft,
      () {
        state.participants.clear();
      },
    );
  }

  Future<void> callToUser({
    required String userId,
    required String keyRoom,
  }) async {
    try {
      await injection.getIt<ICarService>().connectToUser(
            userId: userId,
            keyRoom: keyRoom,
          );
    } on APIException catch (e) {
      LogUtils.e(e.message.toString());
      Fluttertoast.showToast(msg: e.message.toString());
    }
  }

  Future<void> hangUpToUser(String userId) async {
    print('object');
    try {
      await injection.getIt<ICarService>().hangUpToUser(
            userId: userId,
          );
    } on APIException catch (e) {
      LogUtils.e(e.message.toString());
      Fluttertoast.showToast(msg: e.message.toString());
    }
  }

  Future<void> handleMessage(RemoteMessage msg) async {
    final cancel = msg.data['cancel'] ?? '';
    if (cancel != '' && !(state.newMessage == cancel)) {
      state = state.copyWith(newMessage: cancel);
      Navigator.pop(
        navigatorKey.currentState!.context,
      );
    }
  }
}
