import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:rental_car/application/routes/routes.dart';
import 'package:rental_car/application/utils/colors_utils.dart';
import 'package:rental_car/presentation/views/home/notifier/home_notifier.dart';
import 'package:rental_car/presentation/views/home/state/home_state.dart';
import 'package:rental_car/presentation/views/home/widgets/item_vehicle_widget.dart';

class ListTopVehicleWidget extends StatelessWidget {
  const ListTopVehicleWidget({super.key, required this.notifier});

  final HomeNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        final status = ref.watch(
          homeNotifierProvider.select((value) => value.status),
        );
        final listCar = ref.watch(
          homeNotifierProvider.select((value) => value.listTopCar),
        );
        switch (status) {
          case Status.loading:
            return Center(
              child: JumpingDots(
                color: ColorUtils.primaryColor,
              ),
            );
          case Status.success:
            return listCar.isNotEmpty
                ? ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 7.0.w),
                    scrollDirection: Axis.horizontal,
                    itemCount: listCar.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () => Routes.goToCarDetailView(
                          context, listCar[index].idCar),
                      child: ItemVehicleWidget(
                        idCar: listCar[index].imagesCar,
                        imageFile: const Base64Decoder().convert(
                          listCar[index].imagesCar,
                        ),
                        title: listCar[index].nameCar,
                        star: listCar[index].starCar,
                        countReview: listCar[index].countReviewCar,
                        priceCar: listCar[index].priceCar,
                      ),
                    ),
                  )
                : const Center(
                    child: Text(
                        "There are no vehicles in the top category of vehicles"),
                  );
        }
      },
    );
  }
}
