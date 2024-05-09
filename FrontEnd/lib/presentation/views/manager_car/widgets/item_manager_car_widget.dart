import 'dart:convert';
import 'package:cached_memory_image/cached_memory_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rental_car/application/routes/routes.dart';
import 'package:rental_car/application/utils/assets_utils.dart';
import 'package:rental_car/application/utils/colors_utils.dart';
import 'package:rental_car/application/utils/format_utils.dart';
import 'package:rental_car/application/utils/popup_utils.dart';
import 'package:rental_car/domain/model/car.dart';
import 'package:rental_car/presentation/common/widgets/text_button_outline_widget.dart';
import 'package:rental_car/presentation/common/widgets/text_button_widget.dart';
import 'package:rental_car/presentation/views/manager_car/notifier/manager_car_notifier.dart';

class ItemManagerCarWidget extends StatelessWidget {
  const ItemManagerCarWidget({
    super.key,
    required this.car,
    required this.notifier,
  });

  final Car car;
  final ManagerCarNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.r),
                  topLeft: Radius.circular(10.r),
                ),
                child: CachedMemoryImage(
                  uniqueKey: car.idCar,
                  bytes: const Base64Decoder().convert(
                    car.imagesCar,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      car.nameCar,
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
                          "0",
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
                          "(0 review)",
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
                      "${FormatUtils.formatNumber(car.priceCar)} VND / day",
                      style: TextStyle(
                        color: ColorUtils.blueColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 50.h,
                            child: TextButtonWidget(
                              onPressed: () =>
                                  Routes.goToCarDetailView(context, car.idCar),
                              label: "See details",
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 50.h,
                            child: TextButtonOutlineWidget(
                              onPressed: () => Routes.goToEditCarView(context, car),
                              label: "Edit",
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          Positioned(
              top: 0.h,
              right: 0.h,
              child: IconButton(
                onPressed: () {
                  PopupUtils.showPopup(
                    context,
                    icon: AssetUtils.icDelete,
                    title: "Bạn có chắc chắn muốn xóa xe này không?",
                    onTap: () {
                      notifier.deleteCar(idCar: car.idCar);
                      Navigator.pop(context);
                    },
                  );
                },
                icon: const Icon(
                  Icons.dangerous,
                  color: Colors.redAccent,
                ),
              ))
        ],
      ),
    );
  }
}
