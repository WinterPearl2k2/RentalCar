
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../application/utils/colors_utils.dart';
import 'lease_contract_widget.dart';

class LeaseContractFilterWidget extends StatelessWidget {
  const LeaseContractFilterWidget({
    super.key,
    required this.widget,
  });

  final LeaseContractWidget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.w, top: 10.h),
      child: DefaultTabController(
        length: 3,
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
          borderColor: ColorUtils.primaryColor,
          borderWidth: 1,
          unselectedBorderColor: ColorUtils.primaryColor,
          radius: 15,
          onTap: widget.notifier.filterLease,
          tabs: const [
            Tab(
              text: "  All  ",
            ),
            Tab(
              text: "Active",
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