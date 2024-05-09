import 'dart:typed_data';

import 'package:cached_memory_image/cached_memory_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rental_car/application/routes/routes.dart';
import 'package:rental_car/application/utils/assets_utils.dart';
import 'package:rental_car/application/utils/colors_utils.dart';
import 'package:rental_car/application/utils/format_utils.dart';
import 'package:rental_car/application/utils/popup_utils.dart';
import 'package:rental_car/presentation/common/widgets/text_button_outline_widget.dart';
import 'package:rental_car/presentation/common/widgets/text_button_widget.dart';
import 'package:rental_car/presentation/views/manager_car/notifier/manager_car_notifier.dart';

class ItemManagerCarWidget extends StatelessWidget {
  const ItemManagerCarWidget({
    super.key,
    required this.idCar,
    required this.imageFile,
    required this.title,
    required this.star,
    required this.countReview,
    required this.price, 
    required this.notifier,
  });

  final String idCar;
  final Uint8List imageFile;
  final String title;
  final double star;
  final int countReview;
  final double price;
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
                  uniqueKey: idCar,
                  bytes: imageFile,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
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
                      "${FormatUtils.formatCurrency(price)} VND / day",
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
                                  Routes.goToCarDetailView(context, idCar),
                              label: "Xem chi tiết",
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
                              onPressed: () {},
                              label: "Chỉnh sửa",
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
                    icon: AssetUtils.icSearch,
                    title: "Bạn có chắc chắn muốn xóa xe này không?",
                    onTap: () {
                      notifier.deleteCar(idCar: idCar);
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
