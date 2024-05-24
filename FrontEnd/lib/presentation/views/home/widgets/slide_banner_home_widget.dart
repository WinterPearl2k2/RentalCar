import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_car/application/utils/assets_utils.dart';

class SlideBannerHomeWidget extends StatelessWidget {
  const SlideBannerHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List imageList = [
      {"id": 1, "image_path": AssetUtils.imgHondaBrV},
      {"id": 2, "image_path": AssetUtils.imgHondaCity},
      {"id": 3, "image_path": AssetUtils.imgHondaCivic}
    ];
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 14.0.w,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: SizedBox(
          height: 220.h,
          width: 360.w,
          child: CarouselSlider(
            items: imageList
                .map(
                  (item) => Image.asset(
                    item['image_path'],
                    fit: BoxFit.cover,
                    width: 360.w,
                  ),
                )
                .toList(),
            options: CarouselOptions(
              scrollPhysics: const AlwaysScrollableScrollPhysics(),
              autoPlay: true,
              aspectRatio: 3.6.w / 2.2.h,
              viewportFraction: 1,
            ),
          ),
        ),
      ),
    );
  }
}
