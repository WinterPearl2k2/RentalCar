import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_car/domain/model/car.dart';
import 'package:rental_car/presentation/views/manager_car/notifier/manager_car_notifier.dart';
import 'package:rental_car/presentation/views/manager_car/widgets/item_manager_car_widget.dart';

class ListManagerCarWidget extends StatelessWidget {
  const ListManagerCarWidget({
    super.key,
    required this.listCarUser,
    required this.notifier,
  });

  final List<Car> listCarUser;
  final ManagerCarNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listCarUser.length,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(bottom: 20.h),
        child: ItemManagerCarWidget(
          notifier: notifier,
          car: listCarUser[index],
        ),
      ),
    );
  }
}
