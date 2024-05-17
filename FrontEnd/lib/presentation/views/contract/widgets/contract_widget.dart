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
import 'package:rental_car/presentation/views/contract/widgets/contract_item_widget.dart';
import 'package:rental_car/presentation/views/contract/widgets/empty_contract_widget.dart';
import 'package:rental_car/presentation/views/contract/widgets/rental_contract_filter_widget.dart';
import '../../../../application/utils/colors_utils.dart';

class RentalContractWidget extends StatefulWidget {
  final ContractNotifier notifier;

  const RentalContractWidget({super.key, required this.notifier});

  @override
  State<RentalContractWidget> createState() => _RentalContractWidgetState();
}

class _RentalContractWidgetState extends State<RentalContractWidget>
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RentalContractFilterWidget(widget: widget),
        Consumer(
          builder: (context, ref, child) {
            final rentalContracts = ref.watch(
              contractNotifierProvider.select(
                (value) => value.rentalContracts,
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
                                isRentalContract: true,
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
