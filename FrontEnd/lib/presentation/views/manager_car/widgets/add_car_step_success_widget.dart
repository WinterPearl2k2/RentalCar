import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_car/application/utils/colors_utils.dart';


class AddCarStepSuccessWidget extends StatelessWidget {
  const AddCarStepSuccessWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Text(
            "You add car document has \nbeen submitted!",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ColorUtils.primaryColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            "We'll review your car and get back to you as soon as possible. Stay tune for it!",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ColorUtils.textColor,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
