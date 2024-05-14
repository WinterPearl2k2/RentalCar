import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../application/utils/colors_utils.dart';

class TagNameWidget extends StatelessWidget {
  final String? label;
  final Widget? title;

  const TagNameWidget({
    super.key,
    this.label,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: BorderDirectional(
                top: BorderSide(color: ColorUtils.primaryColor),
                start: BorderSide(color: ColorUtils.primaryColor),
                bottom: BorderSide(color: ColorUtils.primaryColor),
              ),
            ),
            child: Text(
              label.toString(),
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: ColorUtils.textColor,
                fontSize: 14.sp,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: BorderDirectional(
                top: BorderSide(color: ColorUtils.primaryColor),
                end: BorderSide(color: ColorUtils.primaryColor),
                bottom: BorderSide(color: ColorUtils.primaryColor),
              ),
            ),
            child: title,
          ),
        ),
      ],
    );
  }
}
