import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:rental_car/application/services/preference_service.dart';
import 'package:rental_car/application/utils/colors_utils.dart';
import 'package:rental_car/presentation/common/widgets/text_button_widget.dart';
import 'package:rental_car/presentation/views/bottom_navigation/state/bottom_navigation_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../application/routes/routes.dart';

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
}
