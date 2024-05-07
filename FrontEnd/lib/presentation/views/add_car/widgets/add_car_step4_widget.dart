import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_car/application/utils/colors_utils.dart';
import 'package:rental_car/presentation/views/add_car/notifier/add_car_notifier.dart';

class AddCarStep4Widget extends StatelessWidget {
  const AddCarStep4Widget({
    super.key,
    required this.imageController,
    required this.notifier
  });

  final TextEditingController imageController;
  final AddCarNotifier notifier;

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
          Consumer(
            builder: (_, ref, __) {
              final imageFile = ref.watch(
                addCarNotifierProvider.select((value) => value.imageFile),
              );
             return GestureDetector(
                onTap:  () => notifier.pickImageFromCamera(),
                child: Container(
                  height: 100.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    border: Border.all(color: ColorUtils.textColor),
                  ),
                  child: imageFile.isNotEmpty
                      ? Image.file(
                    File(imageFile),
                    fit: BoxFit.cover,
                  )
                      : const Icon(Icons.add),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
