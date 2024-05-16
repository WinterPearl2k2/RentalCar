import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rental_car/application/utils/assets_utils.dart';
import 'package:rental_car/application/utils/colors_utils.dart';
import 'package:rental_car/application/utils/format_utils.dart';
import 'package:rental_car/presentation/common/widgets/text_button_outline_widget.dart';
import 'package:rental_car/presentation/common/widgets/text_button_widget.dart';

class ItemManagerCarLoadingWidget extends StatelessWidget {
  const ItemManagerCarLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: ColorUtils.textColor.withOpacity(.3),
              blurRadius: 9,
              spreadRadius: 3),
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
                child: Image.asset(
                  AssetUtils.imgLoading,
                  height: 200.h,
                  width: 360.w,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Loading...",
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
                          "(${0} review)",
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
                      "${FormatUtils.formatNumber(0)} USD / day",
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
                              onPressed: () {},
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
                              onPressed: () {},
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
        ],
      ),
    );
  }
}
