import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_car/application/utils/colors_utils.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14.0.w, vertical: 10.0.h),
      height: 8.h,
      width: 25.w,
      decoration: BoxDecoration(
        color: ColorUtils.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
