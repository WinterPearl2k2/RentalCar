import 'package:flutter/material.dart';

import '../../../../application/utils/colors_utils.dart';

class IconButtonWidget extends StatelessWidget {
  final Widget? icon;
  const IconButtonWidget({
    super.key, this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorUtils.textColor,
            width: 1,
          ),
          shape: BoxShape.circle,
        ),
        child: icon,
      ),
    );
  }
}
