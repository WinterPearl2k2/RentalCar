import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rental_car/application/routes/routes.dart';
import 'package:rental_car/application/utils/assets_utils.dart';
import 'package:rental_car/application/utils/colors_utils.dart';
import 'package:rental_car/application/utils/format_utils.dart';
import 'package:rental_car/data/dtos/car_detail_dto.dart';
import 'package:rental_car/presentation/views/car_detail/notifier/car_detail_notifier.dart';

class HeaderCarDetailWidget extends StatelessWidget {
  const HeaderCarDetailWidget({
    super.key,
    required this.carDetail,
    this.distance,
    this.latCar,
    this.longCar,
    required this.carDetailNotifier,
  });

  final CarDetailDTO carDetail;
  final double? latCar;
  final double? longCar;
  final double? distance;
  final CarDetailNotifier carDetailNotifier;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          width: 360.w,
          height: 200.h,
          fit: BoxFit.cover,
          imageUrl: carDetail.imagesCar,
          progressIndicatorBuilder: (_, __, downloadProgress) =>
              SizedBox(
                height: 10.h,
                width: 10.h,
                child: CircularProgressIndicator(
                    value: downloadProgress.progress),
              ),
          errorWidget: (_, __, error) => const Icon(Icons.error),
        ),
        Positioned(
          left: 10,
          child: SafeArea(
            child: IconButton(
              onPressed: () => Routes.goToPreviousView(context),
              icon: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: ColorUtils.whiteColor,
              ),
            ),
          ),
        ),
        latCar != 0.0
            ? Positioned(
              right: 10,
              child: SafeArea(
                child: GestureDetector(
                    onTap: () async => await carDetailNotifier.launchMap(
                        latCar: latCar ?? 10.0, longCar: longCar ?? 10.0),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                      decoration: BoxDecoration(
                        color: ColorUtils.whiteColor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            FormatUtils.formatDistance(distance ?? 0),
                          ),
                          SvgPicture.asset(
                            AssetUtils.icDirect,
                            colorFilter: ColorFilter.mode(
                              ColorUtils.primaryColor,
                              BlendMode.srcIn,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
              ),
            )
            : const SizedBox()
      ],
    );
  }
}
