import 'dart:convert';

import 'package:cached_memory_image/cached_memory_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../application/routes/routes.dart';
import '../../../../application/utils/colors_utils.dart';
import '../../../../application/utils/date_time_format_untils.dart';
import '../../../../data/dtos/rental_contract_dto.dart';

class ContractItemWidget extends StatelessWidget {
  const ContractItemWidget({
    super.key,
    required this.rentalContracts,
    required this.statusStr,
    required this.statusColors,
    required this.index,
  });

  final List<RentalContractDto> rentalContracts;
  final List<String> statusStr;
  final List<Color> statusColors;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Routes.goToDetailContractView(
        context,
        rentalContracts[index],
      ),
      child: Container(
        margin: EdgeInsets.only(
          right: 10.w,
          left: 10.w,
          top: 10.h,
          bottom: index == (rentalContracts.length - 1) ? 30.h : 5.h,
        ),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: ColorUtils.primaryColor,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedMemoryImage(
                uniqueKey: rentalContracts[index].transaction,
                bytes: const Base64Decoder()
                    .convert(rentalContracts[index].imgCar),
                fit: BoxFit.cover,
                height: 50.h,
                width: 50.w,
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    rentalContracts[index].nameCar,
                    style: TextStyle(
                      color: ColorUtils.primaryColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'From: ${DateTimeFormatUtils.convertDateFormat(
                      format: 'dd/MM/yyyy',
                      inputDate: rentalContracts[index].startDate,
                    )}',
                    style: TextStyle(
                      color: ColorUtils.primaryColor,
                      fontSize: 12.sp,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'To: ${DateTimeFormatUtils.convertDateFormat(
                      format: 'dd/MM/yyyy',
                      inputDate: rentalContracts[index].endDate,
                    )}',
                    style: TextStyle(
                      color: ColorUtils.primaryColor,
                      fontSize: 12.sp,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  'Status: ${statusStr[rentalContracts[index].statusCar]}',
                  style: TextStyle(
                    color: ColorUtils.primaryColor,
                    fontSize: 12.sp,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Container(
                  width: 10.w,
                  height: 10.w,
                  margin: EdgeInsets.only(left: 5.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: statusColors[rentalContracts[index].statusCar],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
