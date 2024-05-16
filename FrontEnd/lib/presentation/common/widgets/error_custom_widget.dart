import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_car/application/utils/colors_utils.dart';

class ErrorCustomWidget extends StatelessWidget {
  const ErrorCustomWidget({
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
          // Image.asset(
          //   AssetUtils.imgError,
          // ),
          Text(
            "There are currently some unknown errors",
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
            "Please try again later",
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
