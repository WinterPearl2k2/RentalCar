import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_car/presentation/common/widgets/text_button_outline_widget.dart';
import 'package:rental_car/presentation/common/widgets/text_button_widget.dart';

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
    this.isRentalContract,
  });

  final List<RentalContractDto> rentalContracts;
  final List<String> statusStr;
  final List<Color> statusColors;
  final int index;
  final bool? isRentalContract;

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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child:  CachedNetworkImage(
                    width: 360.w,
                    height: 200.h,
                    fit: BoxFit.cover,
                    imageUrl: rentalContracts[index].imgCar,
                    progressIndicatorBuilder: (_, __, downloadProgress) =>
                        SizedBox(
                          height: 10.h,
                          width: 10.h,
                          child: CircularProgressIndicator(
                              value: downloadProgress.progress),
                        ),
                    errorWidget: (_, __, error) => const Icon(Icons.error),
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
            if (rentalContracts[index].statusCar == 3 && (isRentalContract ?? false)) ...[
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 40.h,
                    width: 130.w,
                    child: TextButtonWidget(
                      onPressed: () => Routes.goToCarReviewView(
                        context,
                        idCar: rentalContracts[index].idCar,
                        imgCar: rentalContracts[index].imgCar,
                        nameCar: rentalContracts[index].nameCar,
                      ),
                      label: 'Write review',
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                    width: 130.w,
                    child: const TextButtonOutlineWidget(
                      label: 'Booking again',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
            ]
          ],
        ),
      ),
    );
  }
}
