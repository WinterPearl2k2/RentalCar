import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rental_car/application/routes/routes.dart';
import 'package:rental_car/presentation/views/home/notifier/home_notifier.dart';
import 'package:rental_car/presentation/views/home/widgets/item_vehicle_widget.dart';

class ListTopVehicleWidget extends StatelessWidget {
  const ListTopVehicleWidget({super.key, required this.notifier});

  final HomeNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        final listCar = ref.watch(
          homeNotifierProvider.select((value) => value.listTopCar),
        );
        return listCar.isNotEmpty
            ? Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: listCar.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () =>
                        Routes.goToCarDetailView(context, listCar[index].idCar),
                    child: ItemVehicleWidget(
                      idCar: listCar[index].idCar,
                      imageFile: const Base64Decoder().convert(
                        listCar[index].imagesCar,
                      ),
                      title: listCar[index].nameCar,
                      star: listCar[index].starCar,
                      countReview: listCar[index].countReviewCar,
                    ),
                  ),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
