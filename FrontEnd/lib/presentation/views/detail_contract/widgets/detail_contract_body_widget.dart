import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_car/application/utils/colors_utils.dart';
import 'package:rental_car/application/utils/date_time_format_untils.dart';
import 'package:rental_car/application/utils/format_utils.dart';
import 'package:rental_car/data/dtos/rental_contract_dto.dart';
import 'package:rental_car/presentation/views/detail_contract/widgets/tag_name_view.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DetailContractBodyWidget extends StatelessWidget {
  const DetailContractBodyWidget({
    super.key,
    required this.data,
    required this.statusStr,
    required this.statusColors,
  });

  final RentalContractDto data;
  final List<String> statusStr;
  final List<Color> statusColors;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: data.imgCar,
                width: double.infinity,
                height: 200.h,
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
            TagNameWidget(
              label: "Transaction code:",
              title: GestureDetector(
                onLongPress: () => Clipboard.setData(
                  ClipboardData(
                    text: data.transaction,
                  ),
                ),
                child: Text(
                  data.transaction,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: ColorUtils.blueColor,
                    decoration: TextDecoration.underline,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ),
            TagNameWidget(
              label: "Owner:",
              title: Text(
                data.nameOwner,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: ColorUtils.primaryColor,
                  fontSize: 14.sp,
                ),
              ),
            ),
            TagNameWidget(
              label: "Customer:",
              title: Text(
                data.nameCustomer,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: ColorUtils.primaryColor,
                  fontSize: 14.sp,
                ),
              ),
            ),
            TagNameWidget(
              label: "Phone:",
              title: GestureDetector(
                onTap: () {
                  launchUrlString(
                    "tel://${data.phone}",
                  );
                },
                child: Text(
                  data.phone,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: ColorUtils.blueColor,
                    decoration: TextDecoration.underline,
                    decorationColor: ColorUtils.blueColor,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ),
            TagNameWidget(
              label: "Email:",
              title: Text(
                data.email,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: ColorUtils.primaryColor,
                  fontSize: 14.sp,
                ),
              ),
            ),
            TagNameWidget(
              label: "Car name:",
              title: Text(
                data.nameCar,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: ColorUtils.primaryColor,
                  fontSize: 14.sp,
                ),
              ),
            ),
            TagNameWidget(
              label: 'From:',
              title: Text(
                DateTimeFormatUtils.convertDateFormat(
                  format: 'dd/MM/yyyy',
                  inputDate: data.startDate,
                ),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: ColorUtils.primaryColor,
                  fontSize: 14.sp,
                ),
              ),
            ),
            TagNameWidget(
              label: 'To:',
              title: Text(
                DateTimeFormatUtils.convertDateFormat(
                  format: 'dd/MM/yyyy',
                  inputDate: data.endDate,
                ),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: ColorUtils.primaryColor,
                  fontSize: 14.sp,
                ),
              ),
            ),
            TagNameWidget(
              label: "Rental days:",
              title: Text(
                data.rentalDays.toString(),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: ColorUtils.primaryColor,
                  fontSize: 14.sp,
                ),
              ),
            ),
            TagNameWidget(
              label: "Price:",
              title: Text(
                '${FormatUtils.formatNumber(data.rentalPrice)} USD',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: ColorUtils.primaryColor,
                  fontSize: 14.sp,
                ),
              ),
            ),
            TagNameWidget(
              label: "Status:",
              title: Row(
                children: [
                  Text(
                    statusStr[data.statusCar],
                    style: TextStyle(
                      color: ColorUtils.primaryColor,
                      fontSize: 14.sp,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Container(
                    width: 10.w,
                    height: 10.w,
                    margin: EdgeInsets.only(left: 5.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: statusColors[data.statusCar],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
