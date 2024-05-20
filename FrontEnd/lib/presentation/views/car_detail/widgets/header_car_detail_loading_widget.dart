import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_car/application/utils/assets_utils.dart';
import 'package:rental_car/application/utils/colors_utils.dart';

class HeaderCarDetailLoadingWidget extends StatelessWidget {
  const HeaderCarDetailLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AssetUtils.imgLoading,
          width: 360.w,
          height: 200.h,
          fit: BoxFit.cover,
        ),
        Positioned(
          left: 10,
          child: SafeArea(
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
              ),
              color: ColorUtils.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
