import 'dart:convert';
import 'package:cached_memory_image/cached_memory_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rental_car/application/routes/routes.dart';
import 'package:rental_car/application/utils/assets_utils.dart';
import 'package:rental_car/application/utils/colors_utils.dart';
import 'package:rental_car/application/utils/format_utils.dart';
import 'package:rental_car/presentation/views/home/notifier/home_notifier.dart';

class ItemCarWidget extends StatelessWidget {
  const ItemCarWidget({
    super.key,
    required this.notifier,
    required this.idCar,
    required this.imagesCar,
    required this.nameCar,
    required this.priceCar,
  });

  final String idCar;
  final String imagesCar;
  final String nameCar;
  final double priceCar;
  final HomeNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Routes.goToCarDetailView(context, idCar),
      child: Container(
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: ColorUtils.textColor.withOpacity(.3),
                blurRadius: 9,
                spreadRadius: 3
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
                uniqueKey: imagesCar,
                bytes: const Base64Decoder().convert(
                  imagesCar,
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
                    nameCar,
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
                    "${FormatUtils.formatNumber(priceCar)} USD / day",
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
