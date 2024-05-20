import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rental_car/application/utils/assets_utils.dart';
import 'package:rental_car/application/utils/colors_utils.dart';
import 'package:rental_car/application/utils/format_utils.dart';

class ItemVehicleWidget extends StatelessWidget {
  const ItemVehicleWidget({
    super.key,
    required this.idCar,
    required this.imageFile,
    required this.title,
    required this.star,
    required this.countReview,
    required this.priceCar,
    this.width,
    this.distance,
  });

  final String idCar;
  final String imageFile;
  final String title;
  final double star;
  final int countReview;
  final double priceCar;
  final double? width;
  final double? distance;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.0.w),
      child: Stack(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14.r),
              child:  CachedNetworkImage(
                width: width ?? 200.w,
                height: 120.h,
                fit: BoxFit.cover,
                imageUrl: imageFile,
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
            SizedBox(height: 5.h),
            Text(
              "${FormatUtils.formatNumber(priceCar)} USD / day",
              style: TextStyle(
                color: ColorUtils.blueColor,
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
              ),
            ),
          ]),
          distance != null
              ? Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                    decoration: BoxDecoration(
                      color: ColorUtils.whiteColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Text(
                      FormatUtils.formatDistance(distance ?? 0),
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
