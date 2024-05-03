import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/widgets/text_form_field.dart';

class AddCarStep2Widget extends StatelessWidget {
  const AddCarStep2Widget({
    super.key,
    required this.fuelController,
    required this.kilometersController,
    required this.seatsController,
    required this.transmissionController,
  });

  final TextEditingController fuelController;
  final TextEditingController kilometersController;
  final TextEditingController seatsController;
  final TextEditingController transmissionController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormFieldCustomWidget(
            hint: 'Fuel',
            label: "Your fuel",
            inputAction: TextInputAction.next,
            controller: fuelController,
          ),
          SizedBox(
            height: 20.h,
          ),
          TextFormFieldCustomWidget(
            hint: 'Kilometers',
            label: "Your kilometers",
            inputAction: TextInputAction.next,
            controller: kilometersController,
          ),
          SizedBox(
            height: 20.h,
          ),
          TextFormFieldCustomWidget(
            hint: 'Seats',
            label: "Your seats",
            inputAction: TextInputAction.next,
            controller: seatsController,
          ),
          SizedBox(
            height: 20.h,
          ),
          TextFormFieldCustomWidget(
            hint: 'Transmission',
            label: "Your transmission",
            inputAction: TextInputAction.next,
            controller: transmissionController,
          ),
        ],
      ),
    );
  }
}
