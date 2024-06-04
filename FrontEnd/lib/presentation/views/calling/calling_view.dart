import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_car/application/utils/colors_utils.dart';
import 'package:rental_car/presentation/common/base_state_delegate/base_state_delegate.dart';
import 'package:rental_car/presentation/views/calling/notifier/calling_notifier.dart';

class CallingView extends ConsumerStatefulWidget {
  const CallingView({super.key});

  @override
  BaseStateDelegate<CallingView, CallingNotifier> createState() => _CallingViewState();
}

class _CallingViewState extends BaseStateDelegate<CallingView, CallingNotifier> {
  late StreamSubscription fcmListener;
  @override
  void initNotifier() {
    notifier = ref.read(callingNotifierProvider.notifier);
    fcmListener = FirebaseMessaging.onMessage.listen(notifier.handleMessage);
  }

  @override
  void dispose() {
    super.dispose();
    fcmListener.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    final calling = arguments['calling'];
    return Scaffold(
      backgroundColor: ColorUtils.blueLightColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            calling.userName,
            style: TextStyle(
              color: ColorUtils.primaryColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () => notifier.join(calling),
                child: Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: ColorUtils.greenColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.phone,
                    color: ColorUtils.whiteColor,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => notifier.hangUpToUser(calling.mainUser),
                child: Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: ColorUtils.redColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.phone_disabled,
                    color: ColorUtils.whiteColor,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
