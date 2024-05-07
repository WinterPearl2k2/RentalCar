import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rental_car/application/utils/assets_utils.dart';
import 'package:rental_car/application/utils/colors_utils.dart';
import 'package:rental_car/domain/model/car.dart';


class BodyDetailWidget extends StatelessWidget {
  const BodyDetailWidget({
    super.key, required this.car,
  });
  final Car car;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            car.nameCar,
            style: TextStyle(
              color: ColorUtils.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 17.sp,
            ),
          ),
          Text(
            car.descriptionCar,
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
          buildDetailRow(title: "Fuel", attribute: car.fuelTypeCar),
          buildDetailRow(title: "Interior Color", attribute: car.colorCar),
          buildDetailRow(title: "Kilometers", attribute: car.kilometersCar.toString()),
          buildDetailRow(title: "Seats", attribute: car.seatsCar.toString()),
          buildDetailRow(title: "Transmission", attribute: car.transmissionCar),
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
                children: [
                  Text(
                    "Tran Quan",
                    style: TextStyle(
                      color: ColorUtils.primaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(
                    height: 4.0.h,
                  ),
                  Text(
                    "Thị trưởng",
                    style: TextStyle(
                      color: ColorUtils.textColor,
                      fontSize: 14.sp,
                    ),
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
                "0.0",
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
            "REVIEW (0)",
            style: TextStyle(
              color: ColorUtils.primaryColor,
              fontWeight: FontWeight.w700,
              fontSize: 13.sp,
            ),
          ),
        ],
      ),
    );
  }
}
Padding buildDetailRow({required String title, required String attribute}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 5.0.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: ColorUtils.textColor,
            fontSize: 14.sp,
          ),
        ),
        Text(
          attribute,
          style: TextStyle(
            color: ColorUtils.primaryColor,
            fontWeight: FontWeight.w700,
            fontSize: 14.sp,
          ),
        ),
      ],
    ),
  );

}