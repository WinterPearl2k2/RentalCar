import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_car/application/utils/colors_utils.dart';
import 'package:rental_car/domain/model/car.dart';
import 'package:rental_car/presentation/common/widgets/text_button_widget.dart';
import 'package:rental_car/presentation/views/add_car/notifier/add_car_notifier.dart';
import 'package:rental_car/presentation/views/add_car/state/add_car_state.dart';
import 'package:rental_car/presentation/views/add_car/widgets/add_car_step1_widget.dart';
import 'package:rental_car/presentation/views/add_car/widgets/add_car_step2_widget.dart';
import 'package:rental_car/presentation/views/add_car/widgets/add_car_step3_widget.dart';
import 'package:rental_car/presentation/views/add_car/widgets/add_car_step4_widget.dart';
import 'package:rental_car/presentation/views/add_car/widgets/add_car_step_success_widget.dart';
import 'package:rental_car/presentation/views/add_car/enum/car_brand.dart'
    as car_brands;
import 'package:rental_car/presentation/views/add_car/enum/transmission.dart'
    as transmission;
import 'package:rental_car/presentation/views/add_car/enum/type_fuel.dart'
    as type_fuel;
import '../../../application/routes/routes.dart';
import '../../common/base_state_delegate/base_state_delegate.dart';

class AddCarView extends ConsumerStatefulWidget {
  const AddCarView({super.key});

  @override
  BaseStateDelegate<AddCarView, AddCarNotifier> createState() =>
      _AuthViewState();
}

class _AuthViewState extends BaseStateDelegate<AddCarView, AddCarNotifier> {
  final TextEditingController carNameController = TextEditingController();
  final TextEditingController carBrandController =
      TextEditingController(text: car_brands.CarBrands.toyota.brandName);
  final TextEditingController carDescriptionController =
      TextEditingController();
  final TextEditingController carColorController = TextEditingController();

  final TextEditingController fuelController =
      TextEditingController(text: type_fuel.TypeFuel.dieselFuel.fuelName);
  final TextEditingController kilometersController = TextEditingController();
  final TextEditingController seatsController = TextEditingController();
  final TextEditingController transmissionController = TextEditingController(
      text: transmission.Transmission.automatic.transmissionName);

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
              Consumer(
                builder: (_, WidgetRef ref, __) {
                  final stateView = ref.watch(
                    addCarNotifierProvider.select((value) => value.addCarStep),
                  );
                  if (stateView == AddCarStep.step0) {
                    WidgetsBinding.instance.addPostFrameCallback(
                      (_) {
                        Routes.goToPreviousView(context);
                      },
                    );
                    if (stateView == AddCarStep.success) {
                      return const SizedBox();
                    }
                  }
                  return IconButton(
                    onPressed: () => notifier.changeBackwardView(),
                    icon: const Icon(Icons.arrow_back_ios),
                  );
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Add car",
                style: TextStyle(
                    color: ColorUtils.primaryColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.h,
              ),
              Consumer(
                builder: (_, WidgetRef ref, __) {
                  final stateView = ref.watch(
                    addCarNotifierProvider.select((value) => value.addCarStep),
                  );
                  if (stateView == AddCarStep.success) {
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
                      addCarNotifierProvider
                          .select((value) => value.addCarStep),
                    );
                    switch (stateView) {
                      case AddCarStep.step0:
                      case AddCarStep.step1:
                        return AddCarStep1Widget(
                          carNameController: carNameController,
                          carBrandController: carBrandController,
                          carDescriptionController: carDescriptionController,
                          carColorController: carColorController,
                          notifier: notifier,
                        );
                      case AddCarStep.step2:
                        return AddCarStep2Widget(
                          fuelController: fuelController,
                          kilometersController: kilometersController,
                          seatsController: seatsController,
                          transmissionController: transmissionController,
                          notifier: notifier,
                        );
                      case AddCarStep.step3:
                        return AddCarStep3Widget(
                          carPriceController: carPriceController,
                          addressController: addressController,
                          notifier: notifier,
                        );
                      case AddCarStep.step4:
                        return AddCarStep4Widget(
                          notifier: notifier,
                          imageController: imageController,
                        );
                      case AddCarStep.success:
                        return const AddCarStepSuccessWidget();
                    }
                  },
                ),
              ),
              const Spacer(),
              Consumer(
                builder: (_, WidgetRef ref, __) {
                  final stateView = ref.watch(
                    addCarNotifierProvider.select((value) => value.addCarStep),
                  );
                  if (stateView == AddCarStep.success) {
                    notifier.createCar(
                      nameCar: carNameController.text,
                      priceCar: double.parse(carPriceController.text),
                      brandCar: carBrandController.text,
                      fuelTypeCar: fuelController.text,
                      colorCar: carColorController.text,
                      descriptionCar: carDescriptionController.text,
                      kilometersCar: int.parse(kilometersController.text),
                      seatsCar: int.parse(kilometersController.text),
                      addressOwner: addressController.text,
                      transmissionCar: transmissionController.text,
                      statusCar: StatusCar.available.name,
                    );
                    return TextButtonWidget(
                      label: "Back to homepage",
                      onPressed: () => Routes.goToPreviousView(context),
                    );
                  }
                  return TextButtonWidget(
                    label: "Continue",
                    onPressed: () => notifier.changeForwardView(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
