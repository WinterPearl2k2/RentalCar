import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rental_car/presentation/views/bottom_navigation/state/bottom_navigation_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../data/data_sources/remote/api/firebase_api.dart';

part 'bottom_navigation_notifier.g.dart';

@riverpod
class BottomNavigationNotifier extends _$BottomNavigationNotifier {
  @override
  BottomNavigationState build() => const BottomNavigationState();

  void setCurrentIndex(int index) {
    state = state.copyWith(
      currentIndex: index,
    );
  }

  Future<void> _handleMessage(RemoteMessage msg) async {
    Fluttertoast.showToast(
      msg: 'Message data: ${msg.data}',
    );
  }

  void listenMessage() {
    FirebaseApi().listenForegroundMessage(
      handleMessage: _handleMessage,
    );
  }
}
