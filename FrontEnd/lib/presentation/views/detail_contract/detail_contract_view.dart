import 'dart:convert';

import 'package:cached_memory_image/cached_memory_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rental_car/application/utils/assets_utils.dart';
import 'package:rental_car/data/dtos/rental_contract_dto.dart';
import 'package:rental_car/presentation/common/base_state_delegate/base_state_delegate.dart';
import 'package:rental_car/presentation/views/detail_contract/notifier/detail_contract_notifier.dart';
import 'package:rental_car/presentation/views/detail_contract/widgets/tag_name_view.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../application/routes/routes.dart';
import '../../../application/utils/colors_utils.dart';
import '../../../application/utils/date_time_format_untils.dart';
import '../../../application/utils/format_utils.dart';

class DetailContractView extends ConsumerStatefulWidget {
  const DetailContractView({super.key});

  @override
  BaseStateDelegate<DetailContractView, DetailContractNotifier> createState() =>
      _DetailContractViewState();
}

class _DetailContractViewState
    extends BaseStateDelegate<DetailContractView, DetailContractNotifier> {
  @override
  void initNotifier() {
    notifier = ref.read(
      detailContractNotifierProvider.notifier,
    );
  }

  final statusStr = [
    'Processing',
    'Active',
    'Canceled',
    'Expired',
  ];
  final statusColors = [
    ColorUtils.yellowColor,
    ColorUtils.greenColor,
    ColorUtils.redColor,
    ColorUtils.blueColor,
  ];

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, RentalContractDto>;
    final data =  args['rental'] ?? const RentalContractDto();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Contract',
          style: TextStyle(
            color: ColorUtils.primaryColor,
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: SvgPicture.asset(
            AssetUtils.icBack,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            onPressed: () => Routes.goToCarDetailView(
              context,
              data.idCar,
            ),
            icon: SvgPicture.asset(
              'assets/icons/ic_foot.svg',
              colorFilter: ColorFilter.mode(
                ColorUtils.primaryColor,
                BlendMode.srcIn,
              ),
              height: 20.h,
              width: 20.w,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: CachedMemoryImage(
                  uniqueKey: data.transaction,
                  bytes: const Base64Decoder().convert(data.imgCar),
                  fit: BoxFit.cover,
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
      ),
    );
  }
}
