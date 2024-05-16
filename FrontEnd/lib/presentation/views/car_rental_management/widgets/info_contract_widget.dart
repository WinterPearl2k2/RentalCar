import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../application/utils/colors_utils.dart';
import '../../../../application/utils/date_time_format_untils.dart';
import '../../../../application/utils/format_utils.dart';
import '../../../../data/dtos/user_car_rental_dto.dart';

class InfoContractWidget extends StatelessWidget {
  const InfoContractWidget({
    super.key,
    required this.user, required this.index,
  });

  final List<UserCarRentalDto> user;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          user[index].nameUser,
          style: TextStyle(
            color: ColorUtils.primaryColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'From: ${DateTimeFormatUtils.convertDateFormat(
            format: 'dd/MM/yyyy',
            inputDate: user[index].startDate,
          )}',
          style: TextStyle(
            color: ColorUtils.textColor,
            fontSize: 12.sp,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          'To: ${DateTimeFormatUtils.convertDateFormat(
            format: 'dd/MM/yyyy',
            inputDate: user[index].endDate,
          )}',
          style: TextStyle(
            color: ColorUtils.textColor,
            fontSize: 12.sp,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          'Rental Date: ${user[index].rentalDays}',
          style: TextStyle(
            color: ColorUtils.textColor,
            fontSize: 12.sp,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          'Rental Fee: ${FormatUtils.formatNumber(
            user[index].rentalPrice,
          )} USD',
          style: TextStyle(
            color: ColorUtils.textColor,
            fontSize: 12.sp,
            overflow: TextOverflow.fade,
          ),
        ),
      ],
    );
  }
}
