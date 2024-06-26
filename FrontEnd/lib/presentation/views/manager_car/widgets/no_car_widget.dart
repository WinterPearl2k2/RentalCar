import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rental_car/application/utils/assets_utils.dart';
import 'package:rental_car/application/utils/colors_utils.dart';

class NoCarWidget extends StatelessWidget {
  const NoCarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 100.h,
          ),
          SvgPicture.asset(
            AssetUtils.imgEmpty,
          ),
          Text(
            "Currently, you don't have any cars!",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ColorUtils.primaryColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "You can add more cars below.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ColorUtils.textColor,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(
            height: 100.h,
          ),
        ],
      ),
    );
  }
}
