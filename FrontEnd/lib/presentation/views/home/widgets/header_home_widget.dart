import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rental_car/application/routes/routes.dart';
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
                  // SvgPicture.asset(
                  //   colorFilter: ColorFilter.mode(
                  //     ColorUtils.textColor,
                  //     BlendMode.srcIn,
                  //   ),
                  //   AssetUtils.icArrowDown,
                  // ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Consumer(builder: (_, ref, __) {
                final placeMarks = ref.watch(
                  homeNotifierProvider.select((value) => value.placeMarks),
                );
                return SizedBox(
                  width: 250.w,
                  child: Text(
                    placeMarks.isNotEmpty
                        ? "${placeMarks[0].subAdministrativeArea}, ${placeMarks[0].administrativeArea}, ${placeMarks[0].country}"
                        : "Loading...",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: ColorUtils.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                );
              })
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => Routes.goToSearchCarView(context),
            child: SvgPicture.asset(
              AssetUtils.icSearch,
              width: 22.w,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          GestureDetector(
            onTap: () => Routes.goToNotificationView(context),
            child: SvgPicture.asset(
              AssetUtils.icNotification,
              width: 22.w,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
        ],
      ),
    );
  }
}
