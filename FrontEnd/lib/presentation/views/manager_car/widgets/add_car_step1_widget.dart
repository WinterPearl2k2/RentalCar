import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_car/presentation/common/enum/car_brand.dart';
import 'package:rental_car/presentation/common/widgets/dropdown_form_field.dart';
import 'package:rental_car/presentation/views/manager_car/notifier/manager_car_notifier.dart';
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
  final ManagerCarNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarNameTextFormFieldWidget(
            carNameController: carNameController,
            onChange: (value) =>
                notifier.isCheckNameCarEmpty(nameCar: carNameController.text),
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
          CarDescriptionTextFormFieldWidget(
            carDescriptionController: carDescriptionController,
            onChange: (value) => notifier.isCheckDescriptionCarEmpty(
                descriptionCar: carDescriptionController.text),
          ),
          SizedBox(
            height: 20.h,
          ),
          CarColorTextFormFieldWidget(
            carColorController: carColorController,
            onChange: (value) => notifier.isCheckColorCarEmpty(
                colorCar: carColorController.text),
          ),
        ],
      ),
    );
  }
}

class CarColorTextFormFieldWidget extends StatelessWidget {
  const CarColorTextFormFieldWidget({
    super.key,
    required this.carColorController,
    required this.onChange,
  });

  final TextEditingController carColorController;
  final Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        return TextFormFieldCustomWidget(
          hint: 'Car Color',
          label: "Your car color",
          inputAction: TextInputAction.next,
          controller: carColorController,
          onChanged: onChange,
        );
      },
    );
  }
}

class CarDescriptionTextFormFieldWidget extends StatelessWidget {
  const CarDescriptionTextFormFieldWidget({
    super.key,
    required this.carDescriptionController,
    required this.onChange,
  });

  final TextEditingController carDescriptionController;
  final Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        return TextFormFieldCustomWidget(
          hint: 'Car Description',
          label: "Your car description",
          inputAction: TextInputAction.next,
          controller: carDescriptionController,
          onChanged: onChange,
        );
      },
    );
  }
}

class CarNameTextFormFieldWidget extends StatelessWidget {
  const CarNameTextFormFieldWidget({
    super.key,
    required this.carNameController,
    required this.onChange,
  });

  final TextEditingController carNameController;
  final Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        return TextFormFieldCustomWidget(
          hint: 'Car Name',
          label: "Your car name",
          inputAction: TextInputAction.next,
          controller: carNameController,
          onChanged: onChange,
        );
      },
    );
  }
}
