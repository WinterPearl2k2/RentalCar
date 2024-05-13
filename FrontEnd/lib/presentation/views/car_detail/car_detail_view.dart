import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_car/application/routes/routes.dart';
import 'package:rental_car/application/services/preference_service.dart';
import 'package:rental_car/application/utils/colors_utils.dart';
import 'package:rental_car/application/utils/format_utils.dart';
import 'package:rental_car/presentation/common/base_state_delegate/base_state_delegate.dart';
import 'package:rental_car/presentation/common/widgets/text_button_widget.dart';
import 'package:rental_car/presentation/views/car_detail/notifier/car_detail_notifier.dart';
import 'package:rental_car/presentation/views/car_detail/state/car_detail_state.dart';
import 'package:rental_car/presentation/views/car_detail/widgets/body_detail_widget.dart';
import 'package:rental_car/presentation/views/car_detail/widgets/header_car_detail_widget.dart';

class CarDetailView extends ConsumerStatefulWidget {
  const CarDetailView({
    super.key,
    required this.idCar,
    this.latCar,
    this.longCar,
    this.distance,
  });

  final String idCar;
  final double? latCar;
  final double? longCar;
  final double? distance;

  @override
  BaseStateDelegate<CarDetailView, CarDetailNotifier> createState() =>
      _CarDetailView();
}

class _CarDetailView
    extends BaseStateDelegate<CarDetailView, CarDetailNotifier> {
  @override
  void initNotifier() {
    notifier = ref.read(carDetailNotifierProvider.notifier);
    notifier.getCarById(idCar: widget.idCar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (_, ref, __) {
          final carDetail = ref.watch(
            carDetailNotifierProvider.select((value) => value.carDetail),
          );
          final status = ref.watch(
            carDetailNotifierProvider.select((value) => value.status),
          );
          switch (status) {
            case Status.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case Status.success:
              return carDetail.idCar.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeaderCarDetailWidget(
                          carDetail: carDetail,
                          distance: widget.distance,
                          carDetailNotifier: notifier,
                          latCar: widget.latCar,
                          longCar: widget.longCar,
                        ),
                        BodyDetailWidget(
                          carDetail: carDetail,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    carDetail.nameCar,
                                    style: TextStyle(
                                      color: ColorUtils.primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.sp,
                                    ),
                                  ),
                                  Text(
                                    "${FormatUtils.formatNumber(carDetail.priceCar)}USD / day",
                                    style: TextStyle(
                                      color: ColorUtils.blueColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp,
                                    ),
                                  )
                                ],
                              ),
                              const Spacer(),
                              SizedBox(
                                width: 150.w,
                                child: PreferenceService.getUUID() ==
                                        carDetail.idUser
                                    ? const SizedBox()
                                    : SizedBox(
                                        width: 150.w,
                                        child: TextButtonWidget(
                                          label: "Rental Car",
                                          onPressed: () =>
                                              notifier.rentingCar(context),
                                        ),
                                      ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        )
                      ],
                    )
                  : Center(
                      child: SafeArea(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                onPressed: () =>
                                    Routes.goToPreviousView(context),
                                icon: const Icon(
                                  Icons.arrow_back_ios_new_outlined,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 220.h,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "This vehicle has now been deleted or hidden!",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: ColorUtils.primaryColor,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                GestureDetector(
                                  onTap: () => Routes.goToPreviousView(context),
                                  child: Text(
                                    "Choose another car.",
                                    style: TextStyle(
                                      color: ColorUtils.textColor,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
          }
        },
      ),
    );
  }
}
