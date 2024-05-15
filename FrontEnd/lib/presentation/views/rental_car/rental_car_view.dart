import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rental_car/application/utils/assets_utils.dart';
import 'package:rental_car/presentation/common/base_state_delegate/base_state_delegate.dart';
import 'package:rental_car/presentation/views/rental_car/state/rental_car_state.dart';
import 'package:rental_car/presentation/views/rental_car/widgets/rental_car_widget.dart';
import 'package:rental_car/presentation/views/rental_car/widgets/rental_success_widget.dart';
import '../../../application/utils/colors_utils.dart';
import '../../../data/dtos/car_detail_dto.dart';
import '../../common/widgets/loading_widget.dart';
import 'notifier/rental_car_notifier.dart';

class RentalCarView extends ConsumerStatefulWidget {
  const RentalCarView({super.key, required this.carData});

  final CarDetailDTO carData;

  @override
  BaseStateDelegate<RentalCarView, RentalCarNotifier> createState() =>
      _RentalCarViewState();
}

class _RentalCarViewState
    extends BaseStateDelegate<RentalCarView, RentalCarNotifier> {
  @override
  void initNotifier() {
    notifier = ref.read(rentalCarNotifierProvider.notifier);
    notifier.setUpData(widget.carData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            AssetUtils.icBack,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: PopScope(
        onPopInvoked: (didPop) async {
          if (didPop) {
            return;
          }
          Navigator.pop(context);
        },
        canPop: false,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Check out',
                    style: TextStyle(
                      color: ColorUtils.primaryColor,
                      fontSize: 26.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Consumer(
                    builder: (_, ref, __) {
                      final status = ref.watch(
                        rentalCarNotifierProvider.select(
                          (value) => value.statusView,
                        ),
                      );
                      switch (status) {
                        case RentalCarStatus.rentalCar:
                          return RentalCarWidget(notifier: notifier);
                        case RentalCarStatus.rentalSuccess:
                          return RentalSuccessWidget(notifier: notifier);
                      }
                    },
                  ),
                ],
              ),
            ),
            Consumer(
              builder: (context, ref, child) {
                final isWaiting = ref.watch(
                  rentalCarNotifierProvider.select(
                    (value) => value.loading,
                  ),
                );
                return isWaiting ? const SizedBox() : const LoadingWidget();
              },
            ),
          ],
        ),
      ),
    );
  }
}
