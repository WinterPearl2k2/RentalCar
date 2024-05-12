import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rental_car/application/utils/assets_utils.dart';
import 'package:rental_car/application/utils/colors_utils.dart';
import 'package:rental_car/presentation/views/home/notifier/home_notifier.dart';

class HeaderHomeWidget extends StatelessWidget {
  const HeaderHomeWidget({
    super.key,
    required this.notifier,
  });
  final HomeNotifier notifier;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.0.w, vertical: 10.0.h),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Your location",
                    style: TextStyle(
                      color: ColorUtils.textColor,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  SvgPicture.asset(
                    colorFilter: ColorFilter.mode(
                      ColorUtils.textColor,
                      BlendMode.srcIn,
                    ),
                    AssetUtils.icArrowDown,
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Consumer(builder: (_, ref, __) {
                final placemarks = ref.watch(
                  homeNotifierProvider.select((value) => value.placemarks),
                );
                return Text(
                  placemarks.isNotEmpty
                      ? "${placemarks[0].locality}, ${placemarks[0].country}"
                      : "Loading...",
                  style: TextStyle(
                      color: ColorUtils.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp),
                );
              })
            ],
          ),
          const Spacer(),
          SvgPicture.asset(
            AssetUtils.icSearch,
            width: 22.w,
          ),
          SizedBox(
            width: 10.w,
          ),
          SvgPicture.asset(
            AssetUtils.icNotification,
            width: 22.w,
          ),
          SizedBox(
            width: 10.w,
          ),
        ],
      ),
    );
  }
}
