import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../application/utils/colors_utils.dart';

class TextButtonNotificationWidget extends StatelessWidget {
  final String label;
  final Function()? onPressed;
  final Color? backgroundColor;
  final Color? textColor;

  const TextButtonNotificationWidget({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith(
          (states) => backgroundColor ?? ColorUtils.primaryColor,
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
          const EdgeInsets.symmetric(
            horizontal: 5,
          ),
        ),
        minimumSize: MaterialStateProperty.resolveWith<Size>(
          (states) => const Size(80, 30),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          color: textColor ?? ColorUtils.whiteColor,
          fontSize: 12.sp,
        ),
      ),
    );
  }
}
