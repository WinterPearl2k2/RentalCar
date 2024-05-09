import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_car/presentation/views/add_car/notifier/add_car_notifier.dart';

import '../../../common/widgets/text_form_field.dart';

class AddCarStep3Widget extends StatelessWidget {
  const AddCarStep3Widget({
    super.key,
    required this.carPriceController,
    required this.addressController,
    required this.notifier,
  });

  final TextEditingController carPriceController;
  final TextEditingController addressController;
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
                hint: 'Car Price',
                label: "Your car price",
                inputFormatters: true,
                inputAction: TextInputAction.next,
                controller: carPriceController,
                textInputType: TextInputType.number,
                suffixIcon:  Padding(
                  padding: const EdgeInsets.all(12.0).r,
                  child: const Text('VND / Day'),
                ),
                onChanged: (value) =>
                    notifier.isCheckPriceCar(priceCar: carPriceController.text),
              );
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          Consumer(
            builder: (_, ref, __) {
              return TextFormFieldCustomWidget(
                hint: 'Car Address',
                label: "Your car address",
                inputAction: TextInputAction.next,
                controller: addressController,
                onChanged: (value) =>
                    notifier.isCheckAddressCar(addressCar: addressController.text),
              );
            },
          ),
        ],
      ),
    );
  }
}
