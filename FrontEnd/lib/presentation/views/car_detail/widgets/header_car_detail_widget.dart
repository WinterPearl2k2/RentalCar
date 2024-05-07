import 'dart:convert';

import 'package:cached_memory_image/cached_memory_image.dart';
import 'package:flutter/material.dart';
import 'package:rental_car/application/routes/routes.dart';
import 'package:rental_car/application/utils/colors_utils.dart';
import 'package:rental_car/domain/model/car.dart';

class HeaderCarDetailWidget extends StatelessWidget {
  const HeaderCarDetailWidget({
    super.key,
    required this.car,
  });

  final Car car;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedMemoryImage(
          uniqueKey: car.idCar,
          bytes: const Base64Decoder().convert(car.idCar),
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
