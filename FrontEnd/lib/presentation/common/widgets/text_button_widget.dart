import 'package:flutter/material.dart';

import '../../../application/utils/colors_utils.dart';

class TextButtonWidget extends StatelessWidget {
  final String? label;
  final Function()? onPressed;

  const TextButtonWidget({
    super.key,
    this.label, this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith(
          (states) => ColorUtils.primaryColor,
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
            color: ColorUtils.whiteColor,
          ),
        ),
      ),
    );
  }
}
