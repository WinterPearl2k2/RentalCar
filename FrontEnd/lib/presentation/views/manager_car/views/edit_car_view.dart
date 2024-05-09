import 'dart:convert';

import 'package:cached_memory_image/cached_memory_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_car/application/routes/routes.dart';
import 'package:rental_car/application/utils/colors_utils.dart';
import 'package:rental_car/application/utils/format_utils.dart';
import 'package:rental_car/data/dtos/car_dto.dart';
import 'package:rental_car/domain/model/car.dart';
import 'package:rental_car/presentation/common/base_state_delegate/base_state_delegate.dart';
import 'package:rental_car/presentation/common/enum/car_brand.dart';
import 'package:rental_car/presentation/common/enum/transmission.dart';
import 'package:rental_car/presentation/common/enum/type_fuel.dart';
import 'package:rental_car/presentation/common/widgets/dropdown_form_field.dart';
import 'package:rental_car/presentation/common/widgets/text_button_widget.dart';
import 'package:rental_car/presentation/views/manager_car/notifier/manager_car_notifier.dart';
import 'package:rental_car/presentation/views/manager_car/widgets/add_car_step1_widget.dart';
import 'package:rental_car/presentation/views/manager_car/widgets/add_car_step2_widget.dart';
import 'package:rental_car/presentation/views/manager_car/widgets/add_car_step3_widget.dart';

class EditCarView extends ConsumerStatefulWidget {
  const EditCarView({super.key, required this.car});

  final Car car;

  @override
  BaseStateDelegate<EditCarView, ManagerCarNotifier> createState() =>
      _EditCarState();
}

class _EditCarState extends BaseStateDelegate<EditCarView, ManagerCarNotifier> {
  late final TextEditingController carNameController;
  late final TextEditingController carBrandController;
  late final TextEditingController carDescriptionController;
  late final TextEditingController carColorController;
  late final TextEditingController fuelController;
  late final TextEditingController kilometersController;
  late final TextEditingController seatsController;
  late final TextEditingController transmissionController;
  late final TextEditingController carPriceController;
  late final TextEditingController addressController;
  late final TextEditingController imageController;

  @override
  void initNotifier() {
    notifier = ref.read(managerCarNotifierProvider.notifier);
    carNameController = TextEditingController(text: widget.car.nameCar);
    carBrandController = TextEditingController(text: widget.car.brandCar);
    carDescriptionController =
        TextEditingController(text: widget.car.descriptionCar);
    carColorController = TextEditingController(text: widget.car.colorCar);
    fuelController = TextEditingController(text: widget.car.fuelTypeCar);
    kilometersController = TextEditingController(
      text: FormatUtils.formatNumber(widget.car.kilometersCar),
    );
    seatsController = TextEditingController(
      text: widget.car.seatsCar.toString(),
    );
    transmissionController =
        TextEditingController(text: widget.car.transmissionCar);
    carPriceController = TextEditingController(
      text: FormatUtils.formatNumber(widget.car.priceCar),
    );
    addressController = TextEditingController(text: widget.car.addressCar);
    imageController = TextEditingController(text: widget.car.imagesCar);
    notifier.setUpData(
      carDTO: CarDTO(
        nameCar: widget.car.nameCar,
        priceCar: widget.car.priceCar,
        brandCar: widget.car.brandCar,
        fuelTypeCar: widget.car.fuelTypeCar,
        colorCar: widget.car.colorCar,
        descriptionCar: widget.car.descriptionCar,
        kilometersCar: widget.car.kilometersCar,
        seatsCar: widget.car.seatsCar,
        addressOwner: widget.car.addressCar,
        transmissionCar: widget.car.transmissionCar,
        imagesCar: widget.car.imagesCar,
        statusCar: widget.car.statusCar,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Padding(
          padding:
              const EdgeInsets.only(top: 40, left: 30, right: 30, bottom: 20).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () => Routes.goToPreviousView(context),
                icon: const Icon(Icons.arrow_back_ios),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Edit Car",
                style: TextStyle(
                    color: ColorUtils.primaryColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.h,
              ),
              Expanded(
                flex: 10,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CarNameTextFormFieldWidget(
                        carNameController: carNameController,
                        onChange: (value) => notifier.isCheckNameCarChange(
                            nameCar: carNameController.text),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      DropdownFormFieldCustomWidget<CarBrands>(
                          hint: 'Car Brand',
                          label: "Your car brand",
                          value: CarBrandExtension.fromString(
                              carBrandController.text),
                          items: CarBrands.values
                              .map(
                                (brand) => DropdownMenuItem(
                                  value: brand,
                                  child: Text(brand.brandName),
                                ),
                              )
                              .toList(),
                          onChanged: (brand) {
                            carBrandController.text =
                                brand!.brandName.toString();
                            notifier.isCheckBrandCarChange(
                                brandCar: carBrandController.text);
                          }),
                      SizedBox(
                        height: 20.h,
                      ),
                      CarDescriptionTextFormFieldWidget(
                        carDescriptionController: carDescriptionController,
                        onChange: (value) =>
                            notifier.isCheckDescriptionCarChange(
                                descriptionCar: carDescriptionController.text),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CarColorTextFormFieldWidget(
                        carColorController: carColorController,
                        onChange: (value) => notifier.isCheckColorCarChange(
                            colorCar: carColorController.text),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      DropdownFormFieldCustomWidget<TypeFuel>(
                          hint: 'Fuel',
                          label: "Your fuel",
                          value:
                              TypeFuelExtension.fromString(fuelController.text),
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
                          onChanged: (fuel) {
                            fuelController.text = fuel!.fuelName.toString();
                            notifier.isCheckFuelTypeCarChange(
                                fuelTypeCar: fuelController.text);
                          }),
                      SizedBox(
                        height: 20.h,
                      ),
                      CarKilometersTextFormFieldWidget(
                        kilometersController: kilometersController,
                        onChanged: (value) =>
                            notifier.isCheckKilometersCarChange(
                                kilometersCar: seatsController.text),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CarSeatsTextFormFieldWidget(
                        seatsController: seatsController,
                        onChanged: (value) => notifier.isCheckSeatsCarChange(
                            seatsCar: seatsController.text),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      DropdownFormFieldCustomWidget<Transmission>(
                        hint: 'Transmission',
                        label: "Your transmission",
                        value: TransmissionExtension.fromString(
                          transmissionController.text,
                        ),
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
                        onChanged: (transmission) {
                          transmissionController.text =
                              transmission!.transmissionName.toString();
                          notifier.isCheckTransmissionCarChange(
                            transmissionCar: transmissionController.text,
                          );
                        },
                      ),
                      CarPriceTextFormFieldWidget(
                        carPriceController: carPriceController,
                        onChanged: (value) =>
                            notifier.isCheckPriceCarChange(priceCar: carPriceController.text),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CarAddressTextFormFieldWidget(
                        addressController: addressController,
                        onChanged: (value) =>
                            notifier.isCheckAddressCarChange(addressCar: addressController.text),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Consumer(
                        builder: (_, ref, __) {
                          final imageFile = ref.watch(
                            managerCarNotifierProvider
                                .select((value) => value.imageFile),
                          );
                          return GestureDetector(
                            onTap: () => notifier.pickImageFromGallery(),
                            child: Container(
                              height: 100.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                border: Border.all(color: ColorUtils.textColor),
                              ),
                              child: imageFile.isNotEmpty
                                  ? ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      child: CachedMemoryImage(
                                        uniqueKey: widget.car.idCar,
                                        bytes: const Base64Decoder().convert(
                                          imageController.text,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : const Icon(Icons.add),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Consumer(
                builder: (_, ref, __) {
                  final isEditButton = ref.watch(
                    managerCarNotifierProvider.select(
                      (value) => value.isEditButton,
                    ),
                  );
                  return TextButtonWidget(
                    blockButton: !isEditButton,
                    label: "Edit",
                    onPressed: () => notifier.updateCar(
                        idCar: widget.car.idCar,
                        carDTO: CarDTO(
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
                          addressOwner: addressController.text,
                          transmissionCar: transmissionController.text,
                          statusCar: StatusCar.available.name,
                        )),
                  );
                },
              ),
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
    imageController.dispose();
    super.dispose();
  }
}
