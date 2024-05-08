import 'package:flutter/material.dart';

import '../../../application/utils/colors_utils.dart';

class TextButtonOutlineWidget extends StatelessWidget {
  final String? label;
  final Function()? onPressed;

  const TextButtonOutlineWidget({
    super.key,
    this.label, this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith(
          (states) => ColorUtils.whiteColor,
        ),
        minimumSize: MaterialStateProperty.resolveWith(
          (states) => const Size(double.infinity, 60),
        ),
        shape: MaterialStateProperty.resolveWith(
              (states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              width: 1.2,
              color: ColorUtils.primaryColor,
            ),
          ),
        ),
      ),
      child: Center(
        child: Text(
          label ?? '',
          style: TextStyle(
            color: ColorUtils.primaryColor,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
