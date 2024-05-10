import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_car/presentation/views/rental_car/widgets/text_renter_info.dart';

import '../../../../application/utils/colors_utils.dart';
import '../../../../application/utils/format_utils.dart';
import '../../../common/widgets/text_button_widget.dart';
import '../notifier/rental_car_notifier.dart';
import 'book_days_widget.dart';
import 'info_car_detail_widget.dart';

class RentalCarWidget extends StatelessWidget {
  const RentalCarWidget({
    super.key,
    required this.notifier,
  });

  final RentalCarNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Car detail'.toUpperCase(),
            style: TextStyle(
              color: ColorUtils.primaryColor,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Consumer(
            builder: (_, ref, __) {
              final car = ref.watch(
                rentalCarNotifierProvider.select(
                      (value) => value.car,
                ),
              );
              return InfoCarDetailWidget(car: car);
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'Renter information'.toUpperCase(),
            style: TextStyle(
              color: ColorUtils.primaryColor,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Consumer(
            builder: (_, ref, __) {
              final user = ref.watch(
                rentalCarNotifierProvider.select(
                      (value) => value.user,
                ),
              );
              return Column(
                children: [
                  TextRenterInfo(
                    title: 'Full name',
                    label: user.name,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextRenterInfo(
                    title: 'Phone number',
                    label: user.phone,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextRenterInfo(
                    title: 'Email address',
                    label: user.email,
                  ),
                ],
              );
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorUtils.whiteColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: ColorUtils.textColor.withOpacity(.5),
                  spreadRadius: 3,
                  blurRadius: 5,
                ),
              ],
            ),
            child: BookDaysWidget(notifier: notifier),
          ),
          SizedBox(height: 10.h),
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Consumer(
                  builder: (context, ref, child) {
                    final days = ref.watch(
                      rentalCarNotifierProvider.select(
                            (value) => value.numberDays,
                      ),
                    );
                    return Text(
                      'Total days: $days',
                      style: TextStyle(
                        color: ColorUtils.blueMiddleColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
                SizedBox(height: 10.h),
                Consumer(
                  builder: (context, ref, child) {
                    final price = ref.watch(
                      rentalCarNotifierProvider.select(
                            (value) => value.total,
                      ),
                    );
                    return Text(
                      'Total price: ${FormatUtils.formatNumber(price)} VND',
                      style: TextStyle(
                        color: ColorUtils.blueMiddleColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                )
              ],
            ),
          ),
          SizedBox(height: 20.h),
          TextButtonWidget(
            label: 'Rental',
            onPressed: () => notifier.rentalCar(),
          )
        ],
      ),
    );
  }
}
