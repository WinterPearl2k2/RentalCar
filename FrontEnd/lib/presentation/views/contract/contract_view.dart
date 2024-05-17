import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_car/presentation/common/base_state_delegate/base_state_delegate.dart';
import 'package:rental_car/presentation/views/contract/notifier/contract_notifier.dart';
import 'package:rental_car/presentation/views/contract/widgets/contract_widget.dart';
import 'package:rental_car/presentation/views/contract/widgets/lease_contract_widget.dart';

import '../../../application/utils/colors_utils.dart';

class ContractView extends ConsumerStatefulWidget {
  const ContractView({super.key});

  @override
  BaseStateDelegate<ContractView, ContractNotifier> createState() =>
      _ContractViewState();
}

class _ContractViewState
    extends BaseStateDelegate<ContractView, ContractNotifier>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initNotifier() {
    notifier = ref.read(contractNotifierProvider.notifier);
    notifier.setUpData();
    notifier.setListenMessage();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.primaryBackgroundColor,
      appBar: AppBar(
        backgroundColor: ColorUtils.primaryBackgroundColor,
        title: Text(
          'Contracts',
          style: TextStyle(
            color: ColorUtils.primaryColor,
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          TabBar(
            controller: _controller,
            physics: const NeverScrollableScrollPhysics(),
            labelColor: ColorUtils.primaryColor,
            unselectedLabelColor: ColorUtils.textColor,
            indicatorColor: ColorUtils.primaryColor,
            tabs: const [
              Tab(
                text: "Rental contract",
              ),
              Tab(
                text: "Lease contract",
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _controller,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                RentalContractWidget(notifier: notifier),
                LeaseContractWidget(notifier: notifier)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
