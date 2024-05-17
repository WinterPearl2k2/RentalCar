import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_car/application/services/preference_service.dart';
import 'package:rental_car/application/utils/colors_utils.dart';
import 'package:rental_car/application/utils/format_utils.dart';
import 'package:rental_car/presentation/common/base_state_delegate/base_state_delegate.dart';
import 'package:rental_car/presentation/common/enum/status.dart';
import 'package:rental_car/presentation/common/widgets/error_custom_widget.dart';
import 'package:rental_car/presentation/common/widgets/loading_widget.dart';
import 'package:rental_car/presentation/common/widgets/text_button_widget.dart';
import 'package:rental_car/presentation/views/car_detail/notifier/car_detail_notifier.dart';
import 'package:rental_car/presentation/views/car_detail/widgets/body_detail_loading_widget.dart';
import 'package:rental_car/presentation/views/car_detail/widgets/body_detail_widget.dart';
import 'package:rental_car/presentation/views/car_detail/widgets/header_car_detail_loading_widget.dart';
import 'package:rental_car/presentation/views/car_detail/widgets/header_car_detail_widget.dart';
import 'package:rental_car/presentation/views/car_detail/widgets/not_found_car_widget.dart';

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
              return Stack(
                children: [
                  Column(
                    children: [
                      const HeaderCarDetailLoadingWidget(),
                      const BodyDetailLoadingWidget(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          children: [
                            _priceWidget(
                              price: "Loading...",
                              nameCar: "Loading...",
                            ),
                            const Spacer(),
                            SizedBox(
                              width: 150.w,
                              child: const TextButtonWidget(
                                label: "Rental Car",
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                  const LoadingWidget(),
                ],
              );
            case Status.success:
              return carDetail.idCar.isNotEmpty
                  ? Stack(
                      children: [
                        Column(
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
                              notifier: notifier,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Row(
                                children: [
                                  _priceWidget(
                                    nameCar: carDetail.nameCar,
                                    price: FormatUtils.formatNumber(
                                        carDetail.priceCar),
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
                        ),
                      ],
                    )
                  : const NotFoundCarWidget();
            case Status.error:
              return const ErrorCustomWidget();
          }
        },
      ),
    );
  }

  Column _priceWidget({required String nameCar, required String price}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          nameCar,
          style: TextStyle(
            color: ColorUtils.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 17.sp,
          ),
        ),
        Text(
          "$price USD / day",
          style: TextStyle(
            color: ColorUtils.blueColor,
            fontWeight: FontWeight.bold,
            fontSize: 15.sp,
          ),
        )
      ],
    );
  }
}
