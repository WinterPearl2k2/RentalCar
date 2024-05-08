import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_car/domain/model/car.dart';
import 'package:rental_car/presentation/views/manager_car/widgets/item_manager_car_widget.dart';

class ListManagerCarWidget extends StatelessWidget {
  const ListManagerCarWidget({
    super.key,
    required this.listCarUser,
  });

  final List<Car> listCarUser;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listCarUser.length,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(bottom: 20.h),
        child: ItemManagerCarWidget(
          idCar: listCarUser[index].idCar,
          imageFile: const Base64Decoder().convert(
            listCarUser[index].imagesCar,
          ),
          title: listCarUser[index].nameCar,
          star: 0,
          countReview: 0,
          price: listCarUser[index].priceCar,
        ),
      ),
    );
  }
}