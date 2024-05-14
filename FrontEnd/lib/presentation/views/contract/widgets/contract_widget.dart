import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rental_car/presentation/views/contract/notifier/contract_notifier.dart';
import 'package:rental_car/presentation/views/contract/widgets/contract_item_widget.dart';
import 'package:rental_car/presentation/views/contract/widgets/rental_contract_filter_widget.dart';
import '../../../../application/utils/colors_utils.dart';

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
            RentalContractFilterWidget(widget: widget),
            Expanded(
              child: EasyRefresh(
                onRefresh: () => widget.notifier.getRentalContract(),
                onLoad: () => widget.notifier.getMoreRentalContract(),
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
