import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:rental_car/application/utils/popup_utils.dart';
import 'package:rental_car/presentation/views/manager_car/notifier/manager_car_notifier.dart';

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
  final ManagerCarNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarPriceTextFormFieldWidget(
            carPriceController: carPriceController,
            onChanged: (value) => notifier.isCheckPriceCarEmpty(
                priceCar: carPriceController.text),
          ),
          SizedBox(
            height: 20.h,
          ),
          CarAddressTextFormFieldWidget(
            addressController: addressController,
            onChanged: (value) => notifier.isCheckAddressCarEmpty(
                addressCar: addressController.text),
            notifier: notifier,
          ),
        ],
      ),
    );
  }
}

class CarAddressTextFormFieldWidget extends StatelessWidget {
  const CarAddressTextFormFieldWidget({
    super.key,
    required this.addressController,
    required this.onChanged,
    required this.notifier,
  });

  final TextEditingController addressController;
  final Function(String)? onChanged;
  final ManagerCarNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        final addressCar = ref.watch(
          managerCarNotifierProvider.select((value) => value.addressCar),
        );
        return TextFormFieldCustomWidget(
          hint: 'Car Address',
          label: addressCar,
          inputAction: TextInputAction.next,
          controller: addressController,
          onChanged: onChanged,
          suffixIcon: IconButton(
            icon: const Icon(Icons.location_on_rounded),
            onPressed: () => PopupUtils.showBottomSheetDialog(
              context: context,
              dialog: OpenStreetMapSearchAndPick(
                buttonTextStyle:
                    const TextStyle(fontSize: 18, fontStyle: FontStyle.normal),
                buttonColor: Colors.blue,
                buttonText: 'Set Current Location',
                onPicked: (pickedData) {
                  notifier.changeAddressCar(addressCar: pickedData.addressName);
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class CarPriceTextFormFieldWidget extends StatelessWidget {
  const CarPriceTextFormFieldWidget({
    super.key,
    required this.carPriceController,
    required this.onChanged,
  });

  final TextEditingController carPriceController;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        return TextFormFieldCustomWidget(
          hint: 'Car Price',
          label: "Your car price",
          inputFormatters: true,
          inputAction: TextInputAction.next,
          controller: carPriceController,
          textInputType: TextInputType.number,
          suffixIcon: Padding(
            padding: const EdgeInsets.all(12.0).r,
            child: const Text('VND / Day'),
          ),
          onChanged: onChanged,
        );
      },
    );
  }
}
