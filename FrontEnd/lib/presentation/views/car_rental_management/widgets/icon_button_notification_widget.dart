import 'package:flutter/material.dart';

import '../../../../application/utils/colors_utils.dart';

class IconButtonNotificationWidget extends StatelessWidget {
  final Widget icon;
  final Function()? onPressed;

  const IconButtonNotificationWidget({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith(
          (states) => ColorUtils.whiteColor,
        ),
        shadowColor: MaterialStateProperty.resolveWith(
          (states) => Colors.transparent,
        ),
        overlayColor: MaterialStateProperty.resolveWith(
          (states) => ColorUtils.blueDartLightColor,
        ),
        elevation: MaterialStateProperty.resolveWith<double>(
          (states) => 0,
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.all(0),
        ),
        minimumSize: MaterialStateProperty.resolveWith<Size>(
          (states) => const Size(50, 30),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        tapTargetSize: MaterialTapTargetSize.padded,
      ),
      onPressed: onPressed,
      child: icon,
    );
  }
}
