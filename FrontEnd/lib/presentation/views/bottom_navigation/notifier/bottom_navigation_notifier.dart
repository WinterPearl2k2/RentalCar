import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:rental_car/application/services/firebase_service.dart';
import 'package:rental_car/application/services/preference_service.dart';
import 'package:rental_car/application/utils/colors_utils.dart';
import 'package:rental_car/main.dart';
import 'package:rental_car/presentation/common/widgets/text_button_widget.dart';
import 'package:rental_car/presentation/views/bottom_navigation/state/bottom_navigation_state.dart';
import 'package:rental_car/presentation/views/calling/calling_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../application/routes/routes.dart';
import '../../../../data/dtos/notification_message_dto.dart';
import '../../../../firebase_options.dart';

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

  Future<void> checkAuthentication(context) async {
    final auth = PreferenceService.getAuth();
    auth ? Routes.goToAddCarView(context) : dialogNotVerified(context);
  }

  Future<void> dialogNotVerified(context) {
    return Dialogs.materialDialog(
      msg: 'Your user is not verified, please press to verify the user.',
      title: "User not verified!",
      color: Colors.white,
      context: context,
      actions: [
        SizedBox(
          height: 40.h,
          child: TextButtonWidget(
            label: 'Cancel',
            onPressed: () => Navigator.pop(context),
            colorButton: ColorUtils.textColor.withOpacity(.5),
            textColor: ColorUtils.whiteColor,
          ),
        ),
        SizedBox(
          height: 40.h,
          child: TextButtonWidget(
            label: 'Verify',
            onPressed: () => {
              Navigator.pop(context),
              Routes.goToVerifyUserView(context),
            },
          ),
        ),
      ],
    );
  }

  static Future<void> _handleMessage(RemoteMessage msg) async {
    final notifierDto = NotificationMessageDto.fromJson(msg.data);
    Navigator.push(
      navigatorKey.currentState!.context,
      MaterialPageRoute(
        builder: (context) => const CallingView(),
      ),
    );
  }

  static Future<void> _handleOpenAppMessage(RemoteMessage msg) async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    final notifierDto = NotificationMessageDto.fromJson(msg.data);
  }

  Future<void> listenCalling() async {
    injection.getIt<FirebaseService>().handleMessage(
          onChangedMessage: _handleMessage,
          onMessageOpenApp: _handleOpenAppMessage,
        );
  }
}
