import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/widgets/text_form_field.dart';

class AddCarStep1Widget extends StatelessWidget {
  const AddCarStep1Widget({
    super.key,
    required this.carNameController,
    required this.carBrandController,
    required this.carDescriptionController,
    required this.carColorController,
  });

  final TextEditingController carNameController;
  final TextEditingController carBrandController;
  final TextEditingController carDescriptionController;
  final TextEditingController carColorController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormFieldCustomWidget(
            hint: 'Car Name',
            label: "Your car name",
            inputAction: TextInputAction.next,
            controller: carNameController,
          ),
          SizedBox(
            height: 20.h,
          ),
          TextFormFieldCustomWidget(
            hint: 'Car Brand',
            label: "Your car brand",
            inputAction: TextInputAction.next,
            controller: carBrandController,
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
          TextFormFieldCustomWidget(
            hint: 'Car Color',
            label: "Your car color",
            inputAction: TextInputAction.next,
            controller: carColorController,
          ),
        ],
      ),
    );
  }
}
