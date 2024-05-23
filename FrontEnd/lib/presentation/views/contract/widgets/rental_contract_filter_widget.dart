import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../application/utils/colors_utils.dart';
import 'contract_widget.dart';

class RentalContractFilterWidget extends StatelessWidget {
  const RentalContractFilterWidget({
    super.key,
    required this.widget,
  });

  final RentalContractWidget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.w, top: 10.h, right: 10.w),
      child: DefaultTabController(
        length: 5,
        child: ButtonsTabBar(
          backgroundColor: ColorUtils.primaryColor,
          unselectedBackgroundColor: ColorUtils.whiteColor,
          labelStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          borderColor: ColorUtils.primaryColor,
          unselectedLabelStyle: TextStyle(
            color: ColorUtils.primaryColor,
            fontWeight: FontWeight.bold,
          ),
          borderWidth: 1,
          unselectedBorderColor: ColorUtils.primaryColor,
          radius: 15,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 12.w,
          ),
          onTap: widget.notifier.filterRental,
          tabs: const [
            Tab(
              text: "All",
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
    );
  }
}
