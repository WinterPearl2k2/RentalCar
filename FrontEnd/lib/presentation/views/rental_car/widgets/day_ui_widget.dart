import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../application/utils/colors_utils.dart';

class DayUIWidget extends StatelessWidget {
  final String? time;
  final String? title;

  const DayUIWidget({
    super.key,
    this.time,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: ColorUtils.blueMiddleColor.withOpacity(.4),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            'assets/icons/ic_calender.svg',
            colorFilter: ColorFilter.mode(
              ColorUtils.primaryColor,
              BlendMode.srcIn,
            ),
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
        Column(
          children: [
            Row(
              children: [
                Text(
                  title??'',
                  style: TextStyle(
                    color: ColorUtils.textColor,
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                SvgPicture.asset(
                  'assets/icons/ic_arrow_bottom.svg',
                  width: 15,
                  colorFilter: ColorFilter.mode(
                    ColorUtils.textColor,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
            Text(
              time??'',
              style: TextStyle(
                color: ColorUtils.primaryColor,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
