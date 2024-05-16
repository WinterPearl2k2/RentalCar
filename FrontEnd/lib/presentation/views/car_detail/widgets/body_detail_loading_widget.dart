import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rental_car/application/utils/assets_utils.dart';
import 'package:rental_car/application/utils/colors_utils.dart';

class BodyDetailLoadingWidget extends StatelessWidget {
  const BodyDetailLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Loading...",
                style: TextStyle(
                  color: ColorUtils.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 17.sp,
                ),
              ),
              Text(
                "Loading...",
                style: TextStyle(
                  color: ColorUtils.textColor,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(
                height: 15.0.h,
              ),
              Text(
                "CAR DETAIL",
                style: TextStyle(
                  color: ColorUtils.primaryColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 13.sp,
                ),
              ),
              buildDetailRow(title: "Fuel", attribute: "Loading..."),
              buildDetailRow(
                  title: "Interior Color", attribute: "Loading..."),
              buildDetailRow(
                title: "Kilometers",
                attribute:
                "Loading...",
              ),
              buildDetailRow(
                  title: "Seats", attribute: "Loading..."),
              buildDetailRow(
                  title: "Transmission", attribute: "Loading..."),
              buildDetailRow(
                  title: "Address Car", attribute: "Loading..."),
              SizedBox(
                height: 10.0.h,
              ),
              Text(
                "HOST DETAIL",
                style: TextStyle(
                  color: ColorUtils.primaryColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 13.sp,
                ),
              ),
              SizedBox(
                height: 10.0.h,
              ),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0.r),
                    child: Image.asset(
                      AssetUtils.imgHondaCivic,
                      height: 50.h,
                      width: 50.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 10.0.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Loading...",
                        style: TextStyle(
                          color: ColorUtils.primaryColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(
                        height: 4.0.h,
                      ),
                    ],
                  ),
                  const Spacer(),
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
                    "Loading...",
                    style: TextStyle(
                      color: ColorUtils.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.0.h,
              ),
              Text(
                "REVIEW (Loading...)",
                style: TextStyle(
                  color: ColorUtils.primaryColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 13.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildDetailRow({required String title, required String attribute}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: ColorUtils.textColor,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(
            width: 200.w,
            child: Text(
              textAlign: TextAlign.right,
              attribute,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: ColorUtils.primaryColor,
                fontWeight: FontWeight.w700,
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}