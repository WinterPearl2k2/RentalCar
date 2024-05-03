import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_car/application/utils/colors_utils.dart';
import 'package:rental_car/presentation/common/widgets/text_button_widget.dart';
import 'package:rental_car/presentation/views/add_car/notifier/add_car_notifier.dart';
import 'package:rental_car/presentation/views/add_car/state/add_car_state.dart';
import 'package:rental_car/presentation/views/add_car/widgets/add_car_step1_widget.dart';
import 'package:rental_car/presentation/views/add_car/widgets/add_car_step2_widget.dart';
import 'package:rental_car/presentation/views/add_car/widgets/add_car_step3_widget.dart';
import 'package:rental_car/presentation/views/add_car/widgets/add_car_step4_widget.dart';
import 'package:rental_car/presentation/views/add_car/widgets/add_car_step_success_widget.dart';

import '../../common/base_state_delegate/base_state_delegate.dart';

class AddCarView extends ConsumerStatefulWidget {
  const AddCarView({super.key});

  @override
  BaseStateDelegate<AddCarView, AddCarNotifier> createState() =>
      _AuthViewState();
}

class _AuthViewState extends BaseStateDelegate<AddCarView, AddCarNotifier> {
  final TextEditingController carNameController = TextEditingController();
  final TextEditingController carBrandController = TextEditingController();
  final TextEditingController carDescriptionController =
      TextEditingController();
  final TextEditingController carColorController = TextEditingController();

  final TextEditingController fuelController = TextEditingController();
  final TextEditingController kilometersController = TextEditingController();
  final TextEditingController seatsController = TextEditingController();
  final TextEditingController transmissionController = TextEditingController();

  final TextEditingController carPriceController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  final TextEditingController imageController = TextEditingController();

  @override
  void initNotifier() {
    notifier = ref.read(addCarNotifierProvider.notifier);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Container(
          margin:
              const EdgeInsets.only(top: 40, left: 30, right: 30, bottom: 20).r,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () => notifier.changeBackwardView(),
                icon: const Icon(Icons.arrow_back_ios),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Add car",
                style: TextStyle(
                  color: ColorUtils.primaryColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Consumer(
                builder: (_, WidgetRef ref, __) {
                  final stateView = ref.watch(
                    addCarNotifierProvider.select((value) => value.addCarStep),
                  );
                  if(stateView == AddCarStep.success) {
                    return const SizedBox();
                  }
                    return Text(
                    "STEP ${stateView.index} OF 4",
                    style: TextStyle(
                      color: ColorUtils.primaryColor,
                      fontSize: 10.sp,
                    ),
                  );
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                flex: 10,
                child: Consumer(
                  builder: (_, ref, __) {
                    final stateView = ref.watch(
                      addCarNotifierProvider.select((value) => value.addCarStep),
                    );
                    switch (stateView) {
                      case AddCarStep.step0:
                        return const SizedBox();
                      case AddCarStep.step1:
                        return AddCarStep1Widget(
                          carNameController: carNameController,
                          carBrandController: carBrandController,
                          carDescriptionController: carDescriptionController,
                          carColorController: carColorController,
                        );
                      case AddCarStep.step2:
                        return AddCarStep2Widget(
                          fuelController: fuelController,
                          kilometersController: kilometersController,
                          seatsController: seatsController,
                          transmissionController: transmissionController,
                        );
                      case AddCarStep.step3:
                        return AddCarStep3Widget(
                          carPriceController: carPriceController,
                          addressController: addressController,
                        );
                      case AddCarStep.step4:
                        return AddCarStep4Widget(
                          imageController: imageController,
                        );
                      case AddCarStep.success:
                        return const AddCarStepSuccessWidget();
                    }
                  },
                ),
              ),
              const Spacer(),
              TextButtonWidget(
                label: "Continue",
                onPressed: () => notifier.changeForwardView(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
