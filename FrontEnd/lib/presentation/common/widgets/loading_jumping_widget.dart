import 'package:flutter/material.dart';
import 'package:jumping_dot/jumping_dot.dart';
import '../../../application/utils/colors_utils.dart';

class LoadingJumpingWidget extends StatelessWidget {
  const LoadingJumpingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      bottom: 0,
      child: JumpingDots(
        color: ColorUtils.primaryColor,
      )
    );
  }
}
