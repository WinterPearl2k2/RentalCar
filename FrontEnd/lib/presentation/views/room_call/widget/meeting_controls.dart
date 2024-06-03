import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../application/utils/colors_utils.dart';

class MeetingControls extends StatelessWidget {
  final void Function() onToggleMicButtonPressed;
  final void Function() onToggleCameraButtonPressed;
  final void Function() onLeaveButtonPressed;

  const MeetingControls({
    super.key,
    required this.onToggleMicButtonPressed,
    required this.onToggleCameraButtonPressed,
    required this.onLeaveButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: onToggleMicButtonPressed,
          child: Container(
            padding: const EdgeInsets.all(25),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              'assets/icons/ic_rotate.svg',
              colorFilter: ColorFilter.mode(
                ColorUtils.primaryColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: onLeaveButtonPressed,
          child: Container(
            padding: const EdgeInsets.all(25),
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              'assets/icons/ic_phone.svg',
              colorFilter: ColorFilter.mode(
                ColorUtils.whiteColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: onToggleCameraButtonPressed,
          child: Container(
            padding: const EdgeInsets.all(25),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              'assets/icons/ic_camera_hide.svg',
              colorFilter: ColorFilter.mode(
                ColorUtils.primaryColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
