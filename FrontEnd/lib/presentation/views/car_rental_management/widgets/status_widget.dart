import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_car/data/dtos/user_car_rental_dto.dart';

import '../../../../application/utils/colors_utils.dart';

class StatusWidget extends StatelessWidget {
  const StatusWidget({
    super.key,
    required this.statusStr,
    required this.user,
    required this.statusColors,
    required this.index,
  });

  final List<String> statusStr;
  final List<UserCarRentalDto> user;
  final List<Color> statusColors;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Status: ${statusStr[user[index].statusCar]}',
          style: TextStyle(
            color:
            ColorUtils.primaryColor,
            fontSize: 12.sp,
          ),
          overflow:
          TextOverflow.ellipsis,
        ),
        Container(
          width: 10.w,
          height: 10.w,
          margin: EdgeInsets.only(
              left: 5.w),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: statusColors[
            user[index].statusCar],
          ),
        ),
      ],
    );
  }
}