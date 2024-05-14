import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rental_car/presentation/views/contract/notifier/contract_notifier.dart';
import '../../../../application/utils/colors_utils.dart';
import 'contract_item_widget.dart';
import 'lease_contract_filter_widget.dart';

class LeaseContractWidget extends StatefulWidget {
  final ContractNotifier notifier;

  const LeaseContractWidget({super.key, required this.notifier});

  @override
  State<LeaseContractWidget> createState() => _ContractWidgetState();
}

class _ContractWidgetState extends State<LeaseContractWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    widget.notifier.getLeaseContract();
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
            (value) => value.leaseContracts,
          ),
        );
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LeaseContractFilterWidget(widget: widget),
            Expanded(
              child: EasyRefresh(
                onRefresh: () => widget.notifier.getLeaseContract(),
                onLoad: () => widget.notifier.getMoreLeaseContract(),
                child: rentalContracts.isNotEmpty
                    ? ListView.builder(
                        itemCount: rentalContracts.length,
                        itemBuilder: (context, index) {
                          return ContractItemWidget(
                            rentalContracts: rentalContracts,
                            statusStr: statusStr,
                            statusColors: statusColors,
                            index: index,
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
