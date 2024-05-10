import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../application/utils/colors_utils.dart';

class TextRenterInfo extends StatelessWidget {
  final String? title;
  final String? label;
  const TextRenterInfo({
    super.key,
    this.title,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title??'',
          style: TextStyle(
            color: ColorUtils.textColor,
            fontSize: 14.sp,
          ),
        ),
        Text(
          label??'',
          style: TextStyle(
              color: ColorUtils.primaryColor,
              fontSize: 14.sp,
          ),
        ),
      ],
    );
  }
}