import 'package:flutter/material.dart';

import '../../../application/utils/colors_utils.dart';

class TextButtonWidget extends StatelessWidget {
  final String? label;
  final Function()? onPressed;
  final bool? blockButton;
  final Color? colorButton;
  final Color? textColor;

  const TextButtonWidget({
    super.key,
    this.label,
    this.onPressed,
    this.blockButton,
    this.colorButton,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: blockButton ?? false ? null : onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith(
          (states) => blockButton ?? false
              ? ColorUtils.textColor
              : colorButton??ColorUtils.primaryColor,
        ),
        minimumSize: MaterialStateProperty.resolveWith(
          (states) => const Size(double.infinity, 60),
        ),
        shape: MaterialStateProperty.resolveWith(
          (states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      child: Center(
        child: Text(
          label ?? '',
          style: TextStyle(
            color: textColor ?? ColorUtils.whiteColor,
          ),
        ),
      ),
    );
  }
}
