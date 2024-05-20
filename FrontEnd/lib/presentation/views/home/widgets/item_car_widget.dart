import 'package:cached_network_image/cached_network_image.dart';
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
    required this.averageRating,
    required this.reviewCount,
  });

  final String idCar;
  final String imagesCar;
  final String nameCar;
  final double priceCar;
  final double averageRating;
  final int reviewCount;
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
              child: CachedNetworkImage(
                width: 360.w,
                height: 200.h,
                fit: BoxFit.cover,
                imageUrl: imagesCar,
                progressIndicatorBuilder: (_, __, downloadProgress) =>
                    SizedBox(
                      height: 10.h,
                      width: 10.h,
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress),
                    ),
                errorWidget: (_, __, error) => const Icon(Icons.error),
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
                        averageRating.toString(),
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
                        "($reviewCount review)",
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
