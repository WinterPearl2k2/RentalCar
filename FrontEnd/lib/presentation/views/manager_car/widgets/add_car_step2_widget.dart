import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_car/presentation/common/enum/transmission.dart';
import 'package:rental_car/presentation/common/enum/type_fuel.dart';
import 'package:rental_car/presentation/common/widgets/dropdown_form_field.dart';
import 'package:rental_car/presentation/views/manager_car/notifier/manager_car_notifier.dart';

import '../../../common/widgets/text_form_field.dart';

class AddCarStep2Widget extends StatelessWidget {
  const AddCarStep2Widget({
    super.key,
    required this.fuelController,
    required this.kilometersController,
    required this.seatsController,
    required this.transmissionController,
    required this.notifier,
  });

  final TextEditingController fuelController;
  final TextEditingController kilometersController;
  final TextEditingController seatsController;
  final TextEditingController transmissionController;
  final ManagerCarNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownFormFieldCustomWidget<TypeFuel>(
            hint: 'Fuel',
            label: "Your fuel",
            value: TypeFuel.values.first,
            items: TypeFuel.values
                .map(
                  (typeFuel) => DropdownMenuItem(
                    value: typeFuel,
                    child: Text(
                      typeFuel.fuelName.toString(),
                    ),
                  ),
                )
                .toList(),
            onChanged: (typeFuel) =>
                fuelController.text = typeFuel!.fuelName.toString(),
          ),
          SizedBox(
            height: 20.h,
          ),
          CarKilometersTextFormFieldWidget(
            kilometersController: kilometersController,
            onChanged: (value) => notifier.isCheckKilometersEmpty(
              kilometers: kilometersController.text,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          CarSeatsTextFormFieldWidget(
            seatsController: seatsController,
            onChanged: (value) =>
                notifier.isCheckSeatsCarEmpty(seatsCar: seatsController.text),
          ),
          SizedBox(
            height: 20.h,
          ),
          DropdownFormFieldCustomWidget<Transmission>(
            hint: 'Transmission',
            label: "Your transmission",
            value: Transmission.values.first,
            items: Transmission.values
                .map(
                  (transmission) => DropdownMenuItem(
                    value: transmission,
                    child: Text(
                      transmission.transmissionName.toString(),
                    ),
                  ),
                )
                .toList(),
            onChanged: (transmission) => transmissionController.text =
                transmission!.transmissionName.toString(),
          ),
        ],
      ),
    );
  }
}

class CarSeatsTextFormFieldWidget extends StatelessWidget {
  const CarSeatsTextFormFieldWidget({
    super.key,
    required this.seatsController,
    required this.onChanged,
  });

  final TextEditingController seatsController;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        return TextFormFieldCustomWidget(
          hint: 'Seats',
          label: "Your seats",
          inputAction: TextInputAction.next,
          controller: seatsController,
          textInputType: TextInputType.number,
          onChanged: onChanged,
        );
      },
    );
  }
}

class CarKilometersTextFormFieldWidget extends StatelessWidget {
  const CarKilometersTextFormFieldWidget({
    super.key,
    required this.kilometersController,
    required this.onChanged,
  });

  final TextEditingController kilometersController;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        return TextFormFieldCustomWidget(
          hint: 'Kilometers',
          label: "Your kilometers",
          inputFormatters: true,
          inputAction: TextInputAction.next,
          controller: kilometersController,
          suffixIcon: Padding(
            padding: const EdgeInsets.all(12.0).r,
            child: const Text('km'),
          ),
          textInputType: TextInputType.number,
          onChanged: onChanged,
        );
      },
    );
  }
}
