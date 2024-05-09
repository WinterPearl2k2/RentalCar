import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_car/presentation/common/widgets/dropdown_form_field.dart';
import 'package:rental_car/presentation/views/add_car/enum/car_brand.dart';
import 'package:rental_car/presentation/views/add_car/notifier/add_car_notifier.dart';
import '../../../common/widgets/text_form_field.dart';

class AddCarStep1Widget extends StatelessWidget {
  const AddCarStep1Widget({
    super.key,
    required this.carNameController,
    required this.carBrandController,
    required this.carDescriptionController,
    required this.carColorController,
    required this.notifier,
  });

  final TextEditingController carNameController;
  final TextEditingController carBrandController;
  final TextEditingController carDescriptionController;
  final TextEditingController carColorController;
  final AddCarNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Consumer(
            builder: (_, ref, __) {
              return TextFormFieldCustomWidget(
                hint: 'Car Name',
                label: "Your car name",
                inputAction: TextInputAction.next,
                controller: carNameController,
                onChanged: (value) =>
                    notifier.isCheckNameCar(nameCar: carNameController.text),
              );
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          DropdownFormFieldCustomWidget<CarBrands>(
            hint: 'Car Brand',
            label: "Your car brand",
            value: CarBrands.values.first,
            items: CarBrands.values
                .map(
                  (brand) => DropdownMenuItem(
                    value: brand,
                    child: Text(brand.brandName),
                  ),
                )
                .toList(),
            onChanged: (brand) =>
                carBrandController.text = brand!.brandName.toString(),
          ),
          SizedBox(
            height: 20.h,
          ),
          TextFormFieldCustomWidget(
            hint: 'Car Description',
            label: "Your car description",
            inputAction: TextInputAction.next,
            controller: carDescriptionController,
          ),
          SizedBox(
            height: 20.h,
          ),
          Consumer(
            builder: (_, ref, __) {
              return TextFormFieldCustomWidget(
                hint: 'Car Color',
                label: "Your car color",
                inputAction: TextInputAction.next,
                controller: carColorController,
                onChanged: (value) =>
                    notifier.isCheckColorCar(colorCar: carColorController.text),
              );
            },
          ),
        ],
      ),
    );
  }
}
