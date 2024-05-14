import 'dart:convert';

import 'package:cached_memory_image/cached_memory_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
  final RentalContractDto data;

  const DetailContractView({super.key, required this.data});

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
            'assets/icons/ic_arrow_back.svg',
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            onPressed: () => Routes.goToCarDetailView(
              context,
              widget.data.idCar,
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
                  uniqueKey: widget.data.transaction,
                  bytes: const Base64Decoder().convert(widget.data.imgCar),
                  fit: BoxFit.cover,
                ),
              ),
              TagNameWidget(
                label: "Transaction code:",
                title: GestureDetector(
                  onLongPress: () => Clipboard.setData(
                    ClipboardData(
                      text: widget.data.transaction,
                    ),
                  ),
                  child: Text(
                    widget.data.transaction,
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
                  widget.data.nameOwner,
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
                      "tel://${widget.data.phone}",
                    );
                  },
                  child: Text(
                    widget.data.phone,
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
                  widget.data.email,
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
                  widget.data.nameCar,
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
                    inputDate: widget.data.startDate,
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
                    inputDate: widget.data.endDate,
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
                  widget.data.rentalDays.toString(),
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
                  '${FormatUtils.formatNumber(widget.data.rentalPrice)} VND',
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
                      statusStr[widget.data.statusCar],
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
                        color: statusColors[widget.data.statusCar],
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
