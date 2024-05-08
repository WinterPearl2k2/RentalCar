import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_car/application/utils/colors_utils.dart';
import 'package:rental_car/application/utils/format_utils.dart';
import 'package:rental_car/presentation/common/base_state_delegate/base_state_delegate.dart';
import 'package:rental_car/presentation/common/widgets/text_button_widget.dart';
import 'package:rental_car/presentation/views/car_detail/notifier/car_detail_notifier.dart';
import 'package:rental_car/presentation/views/car_detail/widgets/body_detail_widget.dart';
import 'package:rental_car/presentation/views/car_detail/widgets/header_car_detail_widget.dart';

class CarDetailView extends ConsumerStatefulWidget {
  const CarDetailView({super.key, required this.idCar});

  final String idCar;

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
          final car = ref.watch(
            carDetailNotifierProvider.select((value) => value.car),
          );
          return car.idCar.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderCarDetailWidget(
                      car: car,
                    ),
                    BodyDetailWidget(
                      car: car,
                    ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                car.nameCar,
                                style: TextStyle(
                                  color: ColorUtils.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.sp,
                                ),
                              ),
                              Text(
                                "${FormatUtils.formatCurrency(car.priceCar)}VND / day",
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
                            child: const TextButtonWidget(
                              label: "Rental Car",
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0.h,
                    )
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
