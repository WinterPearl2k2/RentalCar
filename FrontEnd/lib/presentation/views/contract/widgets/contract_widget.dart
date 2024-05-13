import 'dart:convert';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:cached_memory_image/cached_memory_image.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rental_car/application/routes/routes.dart';
import 'package:rental_car/presentation/views/contract/notifier/contract_notifier.dart';

import '../../../../application/utils/colors_utils.dart';
import '../../../../application/utils/date_time_format_untils.dart';

class ContractWidget extends StatefulWidget {
  final ContractNotifier notifier;

  const ContractWidget({super.key, required this.notifier});

  @override
  State<ContractWidget> createState() => _ContractWidgetState();
}

class _ContractWidgetState extends State<ContractWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    widget.notifier.getRentalContract();
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
    super.build(context);
    return Consumer(
      builder: (_, ref, __) {
        final rentalContracts = ref.watch(
          contractNotifierProvider.select(
                (value) => value.rentalContracts,
          ),
        );
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: rentalContracts.isNotEmpty,
              child: DefaultTabController(
                length: 5,
                child: ButtonsTabBar(
                  backgroundColor: ColorUtils.primaryColor,
                  unselectedBackgroundColor: ColorUtils.whiteColor,
                  labelStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelStyle: TextStyle(
                    color: ColorUtils.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  borderWidth: 1,
                  unselectedBorderColor: ColorUtils.primaryColor,
                  radius: 15,
                  onTap: widget.notifier.filterRental,
                  tabs: const [
                    Tab(
                      text: "  All  ",
                    ),
                    Tab(
                      text: "Processing",
                    ),
                    Tab(
                      text: "Active",
                    ),
                    Tab(
                      text: "Canceled",
                    ),
                    Tab(
                      text: "Expired",
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: EasyRefresh(
                onRefresh: () => widget.notifier.getRentalContract(),
                onLoad: () => widget.notifier.getMoreRentalContract(),
                child: rentalContracts.isNotEmpty
                    ? ListView.builder(
                  itemCount: rentalContracts.length,
                  itemBuilder: (context, index) {
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
                          bottom: index == (rentalContracts.length - 1)
                              ? 30.h
                              : 5.h,
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
                                uniqueKey:
                                rentalContracts[index].transaction,
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
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
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
                                      inputDate:
                                      rentalContracts[index].startDate,
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
                                      inputDate:
                                      rentalContracts[index].endDate,
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
                                    color: statusColors[
                                    rentalContracts[index].statusCar],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
                    : SingleChildScrollView(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 100.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/img_empty.svg',
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10.h),
                            child: Text(
                              'You don\'t have any current contract data!',
                              style: TextStyle(
                                color: ColorUtils.textColor,
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
