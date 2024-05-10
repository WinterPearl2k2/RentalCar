import 'dart:convert';

import 'package:cached_memory_image/cached_memory_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_car/application/routes/routes.dart';
import 'package:rental_car/application/utils/colors_utils.dart';
import 'package:rental_car/data/dtos/car_detail_dto.dart';

class HeaderCarDetailWidget extends StatelessWidget {
  const HeaderCarDetailWidget({
    super.key,
    required this.carDetail,
  });

  final CarDetailDTO carDetail;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedMemoryImage(
          width: 360.w,
          height: 200.h,
          uniqueKey: carDetail.imagesCar,
          fit: BoxFit.cover,
          bytes: const Base64Decoder().convert(carDetail.imagesCar),
        ),
        Positioned(
          top: 30,
          left: 15,
          child: IconButton(
            onPressed: () => Routes.goToPreviousView(context),
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: ColorUtils.whiteColor,
            ),
          ),
        )
      ],
    );
  }
}
