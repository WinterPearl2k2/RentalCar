import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../application/utils/colors_utils.dart';
import '../../../../application/utils/format_utils.dart';
import '../../../../domain/model/car.dart';

class InfoCarDetailWidget extends StatelessWidget {
  const InfoCarDetailWidget({
    super.key,
    required this.car,
  });

  final Car car;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              car.nameCar,
              style: TextStyle(
                color: ColorUtils.primaryColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              '${FormatUtils.formatCurrency(car.priceCar)} VND / day',
              style: TextStyle(
                color: ColorUtils.blueMiddleColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              car.addressCar,
              style: TextStyle(
                color: ColorUtils.primaryColor,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.memory(
            const Base64Decoder().convert(
              car.imagesCar,
            ),
            fit: BoxFit.cover,
            height: 80.h,
            width: 80.w,
          ),
        ),
      ],
    );
  }
}