import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../state/notification_state.dart';

part 'notification_notifier.g.dart';

@riverpod
class NotificationNotifier extends _$NotificationNotifier {
  @override
  NotificationState build() =>  const NotificationState();
}
