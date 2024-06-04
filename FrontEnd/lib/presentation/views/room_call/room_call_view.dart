import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_car/presentation/common/base_state_delegate/base_state_delegate.dart';
import 'package:rental_car/presentation/views/room_call/notifier/room_call_notifier.dart';
import 'package:rental_car/presentation/views/room_call/widget/meeting_controls.dart';
import 'package:rental_car/presentation/views/room_call/widget/participant_tile.dart';
import 'package:videosdk/videosdk.dart';

class RoomCallView extends ConsumerStatefulWidget {
  final String meetingId;
  final String token;
  final String userOwner;
  final bool type;

  const RoomCallView({
    super.key,
    required this.meetingId,
    required this.token,
    required this.userOwner,
    required this.type,
  });

  @override
  BaseStateDelegate<RoomCallView, RoomCallNotifier> createState() =>
      _RoomCallViewState();
}

class _RoomCallViewState
    extends BaseStateDelegate<RoomCallView, RoomCallNotifier> {
  late Room _room;
  var micEnabled = true;
  var camEnabled = true;

  Map<String, Participant> participants = {};
  late StreamSubscription fcmListener;

  @override
  void initNotifier() {
    notifier = ref.read(roomCallNotifierProvider.notifier);
    if (widget.type) {
      notifier.callToUser(
        userId: widget.userOwner,
        keyRoom: widget.meetingId,
      );
    }
    _room = VideoSDK.createRoom(
      roomId: widget.meetingId,
      token: widget.token,
      displayName: widget.userOwner,
      micEnabled: micEnabled,
      camEnabled: camEnabled,
      defaultCameraIndex: kIsWeb ? 0 : 1,
    );

    setMeetingEventListener();

    _room.join();
    fcmListener = FirebaseMessaging.onMessage.listen(notifier.handleMessage);
  }

  @override
  void dispose() {
    super.dispose();
    fcmListener.cancel();
  }

  void setMeetingEventListener() {
    _room.on(Events.roomJoined, () {
      setState(() {
        participants.putIfAbsent(
          _room.localParticipant.id,
          () => _room.localParticipant,
        );
      });
    });

    _room.on(
      Events.participantJoined,
      (Participant participant) {
        setState(
          () => participants.putIfAbsent(
            participant.id,
            () => participant,
          ),
        );
      },
    );

    _room.on(
      Events.participantLeft,
      (String participantId) {
        if (participants.containsKey(participantId)) {
          setState(
            () => participants.remove(participantId),
          );
        }
      },
    );

    _room.on(
      Events.roomLeft,
      () {
        participants.clear();
      },
    );
  }

  Future<bool> _onWillPop() async {
    _room.leave();
    Navigator.pop(context);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) async {
        if (didPop) {
          return;
        }
        _onWillPop();
      },
      child: Scaffold(
        body: Stack(
          children: [
            Expanded(
              child: (participants.isNotEmpty)
                  ? ParticipantTile(
                      key: Key(participants.values
                          .elementAt(widget.type ? 0 : 1)
                          .id),
                      participant:
                          participants.values.elementAt(widget.type ? 0 : 1),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: SizedBox(
                width: 150.w,
                height: 200.h,
                child: (participants.length > 1)
                    ? ParticipantTile(
                        key: Key(participants.values
                            .elementAt(widget.type ? 1 : 0)
                            .id),
                        participant:
                            participants.values.elementAt(widget.type ? 1 : 0),
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: MeetingControls(
                onToggleMicButtonPressed: () {
                  micEnabled ? _room.muteMic() : _room.unmuteMic();
                  micEnabled = !micEnabled;
                },
                onToggleCameraButtonPressed: () {
                  camEnabled ? _room.disableCam() : _room.enableCam();
                  camEnabled = !camEnabled;
                },
                onLeaveButtonPressed: () {
                  _room.leave();
                  notifier.hangUpToUser(widget.userOwner);
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
