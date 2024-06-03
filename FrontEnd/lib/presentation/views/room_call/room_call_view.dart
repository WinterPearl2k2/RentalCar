import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_car/presentation/views/room_call/widget/meeting_controls.dart';
import 'package:rental_car/presentation/views/room_call/widget/participant_tile.dart';
import 'package:videosdk/videosdk.dart';

class RoomCallView extends StatefulWidget {
  final String meetingId;
  final String token;

  const RoomCallView({
    super.key,
    required this.meetingId,
    required this.token,
  });

  @override
  State<RoomCallView> createState() => _RoomCallViewState();
}

class _RoomCallViewState extends State<RoomCallView> {
  late Room _room;
  var micEnabled = true;
  var camEnabled = true;

  Map<String, Participant> participants = {};

  @override
  void initState() {
    _room = VideoSDK.createRoom(
      roomId: widget.meetingId,
      token: widget.token,
      displayName: "John Doe",
      micEnabled: micEnabled,
      camEnabled: camEnabled,
      defaultCameraIndex: kIsWeb ? 0 : 1,
    );

    setMeetingEventListener();

    _room.join();

    super.initState();
  }

  // listening to meeting events
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(),
      child: Scaffold(
        body: Stack(
          children: [
            Expanded(
              child: ParticipantTile(
                key: Key(participants.values.elementAt(0).id),
                participant: participants.values.elementAt(0),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: SizedBox(
                width: 150.w,
                height: 200.h,
                child: ParticipantTile(
                  key: Key(participants.values.elementAt(0).id),
                  participant: participants.values.elementAt(0),
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
