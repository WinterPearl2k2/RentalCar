import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../application/utils/colors_utils.dart';

class TextInformationWidget extends StatelessWidget {
  const TextInformationWidget({
    super.key,
    required this.label, required this.title,
  });

  final String label;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                color: ColorUtils.primaryColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: ColorUtils.textColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.end,
                overflow: TextOverflow.fade,
              ),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 10.h),
          decoration: BoxDecoration(
            border: Border.all(
              color: ColorUtils.textColor.withOpacity(.5),
              width: 1,
            ),
          ),
        ),
      ],
    );
  }
}
