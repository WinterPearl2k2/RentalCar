import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:rental_car/application/utils/colors_utils.dart';
import 'package:rental_car/application/utils/popup_utils.dart';
import 'package:rental_car/presentation/views/manager_car/notifier/manager_car_notifier.dart';

import '../../../common/widgets/text_form_field.dart';

class AddCarStep3Widget extends StatelessWidget {
  const AddCarStep3Widget({
    super.key,
    required this.carPriceController,
    required this.addressController,
    required this.latController,
    required this.longController,
    required this.notifier,
  });

  final TextEditingController carPriceController;
  final TextEditingController addressController;
  final TextEditingController latController;
  final TextEditingController longController;
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
            latController: latController,
            longController: longController,
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
    required this.latController,
    required this.longController,
    required this.notifier,
  });

  final TextEditingController addressController;
  final TextEditingController latController;
  final TextEditingController longController;
  final ManagerCarNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        return TextFormFieldCustomWidget(
          hint: 'Choose car Address',
          label: "Your car address",
          readOnly: true,
          controller: addressController,
          inputAction: TextInputAction.next,
          suffixIcon: IconButton(
            icon: const Icon(Icons.location_on_rounded),
            onPressed: () => PopupUtils.showBottomSheetDialog(
              context: context,
              dialog: OpenStreetMapSearchAndPick(
                buttonTextStyle:
                    const TextStyle(fontSize: 18, fontStyle: FontStyle.normal),
                buttonColor: ColorUtils.primaryColor,
                locationPinIconColor: Colors.redAccent,
                buttonText: 'Set Current Location',
                onPicked: (pickedData) {
                  addressController.text = pickedData.addressName;
                  latController.text = pickedData.latLong.latitude.toString();
                  longController.text = pickedData.latLong.longitude.toString();
                  notifier.isCheckAddressCarEmpty(
                      addressCar: addressController.text);
                  notifier.isCheckAddressImageChange(
                      imageCar: addressController.text);
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
            child: const Text('USD / Day'),
          ),
          onChanged: onChanged,
        );
      },
    );
  }
}
