import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_car/application/routes/routes.dart';
import 'package:rental_car/presentation/common/enum/status.dart';
import 'package:rental_car/presentation/common/widgets/error_custom_widget.dart';
import 'package:rental_car/presentation/views/home/notifier/home_notifier.dart';
import 'package:rental_car/presentation/views/home/widgets/item_vehicle_loading_widget.dart';
import 'package:rental_car/presentation/views/home/widgets/item_vehicle_widget.dart';

class ListVehicleNearYouWidget extends StatelessWidget {
  const ListVehicleNearYouWidget({super.key, required this.notifier, required this.scrollController});

  final HomeNotifier notifier;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        final status = ref.watch(
          homeNotifierProvider.select((value) => value.statusNearCar),
        );
        final listAllCar = ref.watch(
          homeNotifierProvider.select((value) => value.listAllCar),
        );
        switch (status) {
          case Status.loading:
            return GridView.builder(
              controller: scrollController,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15.0.h,
                childAspectRatio: 188.w / 220.h,
              ),
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 7.0.w),
              itemCount: listAllCar.length,
              itemBuilder: (context, index) => ItemVehicleLoadingWidget(
                width: 155.w,
              ),
            );
          case Status.success:
            if (listAllCar.isNotEmpty) {
              return GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15.0.h,
                  childAspectRatio: 188.w / 220.h,
                ),
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 7.0.w),
                itemCount: listAllCar.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => Routes.goToCarDetailView(
                    context,
                    listAllCar[index].idCar,
                    listAllCar[index].distanceCar,
                    listAllCar[index].latCar,
                    listAllCar[index].longCar,
                  ),
                  child: ItemVehicleWidget(
                    width: 155.w,
                    idCar: listAllCar[index].imagesCar,
                    imageFile: listAllCar[index].imagesCar,
                    title: listAllCar[index].nameCar,
                    star: listAllCar[index].averageRating,
                    countReview: listAllCar[index].reviewCount,
                    priceCar: listAllCar[index].priceCar,
                    distance: listAllCar[index].distanceCar,
                  ),
                ),
              );
            } else {
              return const Center(
                child: Text("There are no vehicles near you"),
              );
            }
          case Status.error:
            return const ErrorCustomWidget();
        }
      },
    );
  }
}
