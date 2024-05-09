import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rental_car/application/routes/routes_name.dart';
import 'package:rental_car/presentation/common/widgets/text_button_widget.dart';

import '../../../../application/utils/colors_utils.dart';
import '../notifier/rental_car_notifier.dart';

class RentalSuccessWidget extends StatelessWidget {
  const RentalSuccessWidget({
    super.key,
    required this.notifier,
  });

  final RentalCarNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/images/img_booking_car.svg'),
                Text(
                  'Your booking success!',
                  style: TextStyle(
                    color: ColorUtils.primaryColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Congratulation your booking has been made.',
                  style: TextStyle(
                    color: ColorUtils.textColor,
                    fontSize: 12.sp,
                  ),
                ),
                Text(
                  'Thanks for trusting us!',
                  style: TextStyle(
                    color: ColorUtils.textColor,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
          TextButtonWidget(
            label: 'Back to homepage',
            onPressed: () => Navigator.popUntil(
              context,
              ModalRoute.withName(
                RoutesName.bottomNavigation,
              ),
            ),
          ),
          SizedBox(
            height: 40.h,
          )
        ],
      ),
    );
  }
}
