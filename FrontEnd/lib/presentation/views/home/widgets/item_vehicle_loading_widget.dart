import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rental_car/application/utils/assets_utils.dart';
import 'package:rental_car/application/utils/colors_utils.dart';

class ItemVehicleLoadingWidget extends StatelessWidget {
  const ItemVehicleLoadingWidget({
    super.key,
    this.width,
  });
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.0.w),
      child: Stack(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14.r),
              child: Image.asset(
                AssetUtils.imgLoading,
                height: 120.h,
                width: width ?? 200.w,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 5.0.h,
            ),
            Text(
              "Loading...",
              style: TextStyle(
                color: ColorUtils.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
              ),
            ),
            SizedBox(
              height: 5.0.h,
            ),
            Row(
              children: [
                SvgPicture.asset(
                  colorFilter: ColorFilter.mode(
                    ColorUtils.yellowColor,
                    BlendMode.srcIn,
                  ),
                  AssetUtils.icStar,
                ),
                SizedBox(
                  width: 5.0.w,
                ),
                Text(
                  'Loading...',
                  style: TextStyle(
                    color: ColorUtils.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                  ),
                ),
                SizedBox(
                  width: 5.0.w,
                ),
                Text(
                  "(... review)",
                  style: TextStyle(
                    color: ColorUtils.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Text(
              "... USD / day",
              style: TextStyle(
                color: ColorUtils.blueColor,
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
