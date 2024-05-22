import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rental_car/presentation/common/enum/status.dart';
import 'package:rental_car/presentation/common/widgets/error_custom_widget.dart';
import 'package:rental_car/presentation/common/widgets/loading_widget.dart';
import 'package:rental_car/presentation/views/contract/notifier/contract_notifier.dart';
import 'package:rental_car/presentation/views/contract/widgets/contract_item_loading_widget.dart';
import 'package:rental_car/presentation/views/contract/widgets/empty_contract_widget.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LeaseContractFilterWidget(widget: widget),
        Consumer(
          builder: (context, ref, child) {
            final rentalContracts = ref.watch(
              contractNotifierProvider.select(
                (value) => value.leaseContracts,
              ),
            );
            final status = ref.watch(
              contractNotifierProvider.select(
                (value) => value.status,
              ),
            );
            switch (status) {
              case Status.loading:
                return Expanded(
                  child: Stack(
                    children: [
                      ListView.builder(
                        itemCount: 5,
                        itemBuilder: (_, __) {
                          return const ContractItemLoadingWidget();
                        },
                      ),
                      const LoadingWidget()
                    ],
                  ),
                );
              case Status.success:
                return Expanded(
                  child: EasyRefresh(
                    onRefresh: () => widget.notifier.getLeaseContract(),
                    // onLoad: () => widget.notifier.getMoreLeaseContract(),
                    child: rentalContracts.isNotEmpty
                        ? ListView.builder(
                            itemCount: rentalContracts.length,
                            itemBuilder: (context, index) {
                              if((index == rentalContracts.length - 10)) {
                                widget.notifier.getMoreLeaseContract();
                              }
                              return ContractItemWidget(
                                rentalContracts: rentalContracts,
                                statusStr: statusStr,
                                statusColors: statusColors,
                                index: index,
                              );
                            },
                          )
                        : const EmptyContractWidget(),
                  ),
                );
              case Status.error:
                return const ErrorCustomWidget();
            }
          },
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
