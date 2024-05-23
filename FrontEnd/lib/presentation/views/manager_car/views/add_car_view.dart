import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_car/application/routes/routes.dart';
import 'package:rental_car/application/services/preference_service.dart';
import 'package:rental_car/application/utils/colors_utils.dart';
import 'package:rental_car/application/utils/format_utils.dart';
import 'package:rental_car/domain/model/car.dart';
import 'package:rental_car/presentation/common/base_state_delegate/base_state_delegate.dart';
import 'package:rental_car/presentation/common/enum/car_brand.dart';
import 'package:rental_car/presentation/common/enum/transmission.dart';
import 'package:rental_car/presentation/common/enum/type_fuel.dart';
import 'package:rental_car/presentation/common/widgets/text_button_widget.dart';
import 'package:rental_car/presentation/views/manager_car/notifier/manager_car_notifier.dart';
import 'package:rental_car/presentation/views/manager_car/state/manager_car_state.dart';
import 'package:rental_car/presentation/views/manager_car/widgets/add_car_step1_widget.dart';
import 'package:rental_car/presentation/views/manager_car/widgets/add_car_step2_widget.dart';
import 'package:rental_car/presentation/views/manager_car/widgets/add_car_step3_widget.dart';
import 'package:rental_car/presentation/views/manager_car/widgets/add_car_step4_widget.dart';
import 'package:rental_car/presentation/views/manager_car/widgets/add_car_step_success_widget.dart';

class AddCarView extends ConsumerStatefulWidget {
  const AddCarView({super.key});

  @override
  BaseStateDelegate<AddCarView, ManagerCarNotifier> createState() =>
      _AddCarState();
}

class _AddCarState extends BaseStateDelegate<AddCarView, ManagerCarNotifier> {
  final TextEditingController carNameController = TextEditingController();
  final TextEditingController carBrandController =
      TextEditingController(text: CarBrands.toyota.brandName);
  final TextEditingController carDescriptionController =
      TextEditingController();
  final TextEditingController carColorController = TextEditingController();

  final TextEditingController fuelController =
      TextEditingController(text: TypeFuel.dieselFuel.fuelName);
  final TextEditingController kilometersController = TextEditingController();
  final TextEditingController seatsController = TextEditingController();
  final TextEditingController transmissionController =
      TextEditingController(text: Transmission.automatic.transmissionName);

  final TextEditingController carPriceController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController latController = TextEditingController(
      text: PreferenceService.getLocation().latitude.toString());
  final TextEditingController longController = TextEditingController(
      text: PreferenceService.getLocation().longitude.toString());

  @override
  void initNotifier() {
    notifier = ref.read(managerCarNotifierProvider.notifier);
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
                    managerCarNotifierProvider
                        .select((value) => value.addCarStep),
                  );
                  if (stateView == AddCarStep.success) {
                    return const SizedBox();
                  }
                  if (stateView == AddCarStep.step1) {
                    return IconButton(
                      onPressed: () {
                        Routes.goToPreviousView(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                    );
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
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Consumer(
                builder: (_, WidgetRef ref, __) {
                  final stateView = ref.watch(
                    managerCarNotifierProvider
                        .select((value) => value.addCarStep),
                  );
                  if (stateView == AddCarStep.success) {
                    return const SizedBox();
                  }
                  return Text(
                    "STEP ${stateView.index + 1} OF 4",
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
                      managerCarNotifierProvider
                          .select((value) => value.addCarStep),
                    );
                    switch (stateView) {
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
                          latController: latController,
                          longController: longController,
                          notifier: notifier,
                        );
                      case AddCarStep.step4:
                        return AddCarStep4Widget(
                          notifier: notifier,
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
                    managerCarNotifierProvider.select(
                      (value) => value.addCarStep,
                    ),
                  );
                  final isCheckNameCar = ref.watch(
                    managerCarNotifierProvider
                        .select((value) => value.isCheckNameCar),
                  );
                  final isCheckColorCar = ref.watch(
                    managerCarNotifierProvider
                        .select((value) => value.isCheckColorCar),
                  );
                  final isCheckKilometers = ref.watch(
                    managerCarNotifierProvider
                        .select((value) => value.isCheckKilometers),
                  );
                  final isCheckSeatsCar = ref.watch(
                    managerCarNotifierProvider
                        .select((value) => value.isCheckSeatsCar),
                  );
                  final isCheckPriceCar = ref.watch(
                    managerCarNotifierProvider
                        .select((value) => value.isCheckPriceCar),
                  );
                  final isCheckAddressCar = ref.watch(
                    managerCarNotifierProvider
                        .select((value) => value.isCheckAddressCar),
                  );
                  final isCheckImageFile = ref.watch(
                    managerCarNotifierProvider
                        .select((value) => value.imageFile),
                  );
                  final isContinueButtonEnabled = ref.watch(
                    managerCarNotifierProvider
                        .select((value) => value.isContinueButtonEnabled),
                  );

                  switch (stateView) {
                    case AddCarStep.step1:
                      notifier.isContinueButtonEnabled(
                        isContinue: !(isCheckNameCar && isCheckColorCar),
                      );
                      break;
                    case AddCarStep.step2:
                      notifier.isContinueButtonEnabled(
                        isContinue: !(isCheckKilometers && isCheckSeatsCar),
                      );
                      break;
                    case AddCarStep.step3:
                      notifier.isContinueButtonEnabled(
                        isContinue: !(isCheckPriceCar && isCheckAddressCar),
                      );
                      break;
                    case AddCarStep.step4:
                      notifier.isContinueButtonEnabled(
                        isContinue: isCheckImageFile.isEmpty,
                      );
                      break;
                    default:
                      break;
                  }
                  if (stateView == AddCarStep.success) {
                    notifier.createCar(
                      nameCar: carNameController.text,
                      priceCar: double.parse(
                        FormatUtils.removeDot(carPriceController.text),
                      ),
                      brandCar: carBrandController.text,
                      fuelTypeCar: fuelController.text,
                      colorCar: carColorController.text,
                      descriptionCar: carDescriptionController.text,
                      kilometersCar: double.parse(
                        FormatUtils.removeDot(kilometersController.text),
                      ),
                      seatsCar: int.parse(seatsController.text),
                      addressCar: addressController.text,
                      latCar: double.parse(latController.text),
                      longCar: double.parse(longController.text),
                      transmissionCar: transmissionController.text,
                      statusCar: StatusCar.available.name,
                    );
                    return TextButtonWidget(
                      label: "Back to homepage",
                      onPressed: () {
                        Routes.goToPreviousView(context);
                        notifier.changeForwardView();
                        notifier.clearImage();
                        notifier.isContinueButtonEnabled(
                          isContinue: true,
                        );
                      },
                    );
                  }
                  return TextButtonWidget(
                    blockButton: isContinueButtonEnabled,
                    label: "Continue",
                    onPressed: () => notifier.changeForwardView(),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    carNameController.dispose();
    carBrandController.dispose();
    carDescriptionController.dispose();
    carColorController.dispose();
    fuelController.dispose();
    kilometersController.dispose();
    seatsController.dispose();
    transmissionController.dispose();
    carPriceController.dispose();
    addressController.dispose();
    latController.dispose();
    longController.dispose();
    notifier.isContinueButtonEnabled(
      isContinue: true,
    );
    super.dispose();
  }
}
