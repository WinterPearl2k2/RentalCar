import 'dart:typed_data';

import 'package:cached_memory_image/cached_memory_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rental_car/application/utils/assets_utils.dart';
import 'package:rental_car/application/utils/colors_utils.dart';

class ItemVehicleWidget extends StatelessWidget {
  const ItemVehicleWidget({
    super.key,
    required this.idCar,
    required this.imageFile,
    required this.title,
    required this.star,
    required this.countReview,
  });
  final String idCar;
  final Uint8List imageFile;
  final String title;
  final double star;
  final int countReview;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14.r),
            child: CachedMemoryImage(
              uniqueKey: idCar,
              bytes: imageFile,
              height: 120.h,
              width: 200.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 5.0.h,
          ),
          Text(
            title,
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
                star.toString(),
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
                "($countReview review)",
                style: TextStyle(
                  color: ColorUtils.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
