import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/widgets/text_form_field.dart';

class AddCarStep3Widget extends StatelessWidget {
  const AddCarStep3Widget({
    super.key,
    required this.carPriceController,
    required this.addressController,
  });

  final TextEditingController carPriceController;
  final TextEditingController addressController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormFieldCustomWidget(
            hint: 'Car Price',
            label: "Your car price",
            inputAction: TextInputAction.next,
            controller: carPriceController,
          ),
          SizedBox(
            height: 20.h,
          ),
          TextFormFieldCustomWidget(
            hint: 'Car Address',
            label: "Your car address",
            inputAction: TextInputAction.next,
            controller: addressController,
          ),
        ],
      ),
    );
  }
}
