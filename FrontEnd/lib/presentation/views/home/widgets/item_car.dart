import 'dart:convert';
import 'package:cached_memory_image/cached_memory_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rental_car/application/routes/routes.dart';
import 'package:rental_car/application/utils/assets_utils.dart';
import 'package:rental_car/application/utils/colors_utils.dart';
import 'package:rental_car/application/utils/format_utils.dart';
import 'package:rental_car/data/dtos/top_car_dto.dart';
import 'package:rental_car/presentation/views/home/notifier/home_notifier.dart';

class ItemCarWidget extends StatelessWidget {
  const ItemCarWidget({
    super.key,
    required this.topCarDTO,
    required this.notifier,
  });

  final TopCarDTO topCarDTO;
  final HomeNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Routes.goToCarDetailView(context, topCarDTO.idCar),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.r),
                topLeft: Radius.circular(10.r),
              ),
              child: CachedMemoryImage(
                height: 200.h,
                width: 360.w,
                uniqueKey: topCarDTO.imagesCar,
                bytes: const Base64Decoder().convert(
                  topCarDTO.imagesCar,
                ),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    topCarDTO.nameCar,
                    style: TextStyle(
                      color: ColorUtils.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(height: 5.h),
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
                        "0",
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
                        "(0 review)",
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
                    "${FormatUtils.formatNumber(topCarDTO.priceCar)} USD / day",
                    style: TextStyle(
                      color: ColorUtils.blueColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
