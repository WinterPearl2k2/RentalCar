import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_car/application/utils/colors_utils.dart';

class AddCarStep4Widget extends StatelessWidget {
  const AddCarStep4Widget({
    super.key,
    required this.imageController,
  });

  final TextEditingController imageController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Car Image',
            style: TextStyle(
              color: ColorUtils.primaryColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.h),
          Container(
            height: 100.h,
            width: 100.w,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              border: Border.all(color: ColorUtils.textColor),
            ),
            child: const Icon(Icons.add),
            ),
        ],
      ),
    );
  }
}
