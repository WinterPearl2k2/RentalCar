import 'dart:convert';
import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rental_car/application/services/car_service.dart';
import 'package:rental_car/application/utils/log_utils.dart';
import 'package:rental_car/data/data_sources/remote/dio/api_exception.dart';
import 'package:rental_car/data/dtos/car_dto.dart';
import 'package:rental_car/main.dart';
import 'package:rental_car/presentation/views/add_car/state/add_car_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_car_notifier.g.dart';

@riverpod
class AddCarNotifier extends _$AddCarNotifier {
  @override
  AddCarState build() => AddCarState();

  void changeForwardView() {
    switch (state.addCarStep) {
      case AddCarStep.step0:
        break;
      case AddCarStep.step1:
          state = state.copyWith(addCarStep: AddCarStep.step2);
        break;
      case AddCarStep.step2:
          state = state.copyWith(addCarStep: AddCarStep.step3);
        break;
      case AddCarStep.step3:
          state = state.copyWith(addCarStep: AddCarStep.step4);
        break;
      case AddCarStep.step4:
        state = state.copyWith(addCarStep: AddCarStep.success);
        break;
      case AddCarStep.success:
        break;
    }
  }

  void changeBackwardView() {
    switch (state.addCarStep) {
      case AddCarStep.step0:
        break;
      case AddCarStep.step1:
        state = state.copyWith(addCarStep: AddCarStep.step0);
        break;
      case AddCarStep.step2:
        state = state.copyWith(addCarStep: AddCarStep.step1);
        break;
      case AddCarStep.step3:
        state = state.copyWith(addCarStep: AddCarStep.step2);
        break;
      case AddCarStep.step4:
        state = state.copyWith(addCarStep: AddCarStep.step3);
        break;
      case AddCarStep.success:
        state = state.copyWith(addCarStep: AddCarStep.step4);
        break;
    }
  }

  Future<void> createCar({
    required String nameCar,
    required double priceCar,
    required String brandCar,
    required String fuelTypeCar,
    required String colorCar,
    required String descriptionCar,
    required double kilometersCar,
    required int seatsCar,
    required String addressOwner,
    required String transmissionCar,
    required String statusCar,
  }) async {
    final carDTO = CarDTO(
      nameCar: nameCar,
      priceCar: priceCar,
      fuelTypeCar: fuelTypeCar,
      colorCar: colorCar,
      brandCar: brandCar,
      descriptionCar: descriptionCar,
      kilometersCar: kilometersCar,
      seatsCar: seatsCar,
      addressOwner: addressOwner,
      transmissionCar: transmissionCar,
      imagesCar: await convertImageToBase64(File(state.imageFile)),
      statusCar: statusCar,
    );
    try {
      await injection.getIt<ICarService>().createCar(carDTO: carDTO);
      Fluttertoast.showToast(msg: "Tạo xe thành công");
    } on APIException catch (e) {
      LogUtils.e(e.message.toString());
      Fluttertoast.showToast(msg: e.message.toString());
    }
  }

  void isCheckNameCar({required String nameCar}) {
    if (nameCar.isEmpty) {
      state = state.copyWith(isCheckNameCar: false);
    } else {
      state = state.copyWith(isCheckNameCar: true);
    }
  }

  void isCheckColorCar({required String colorCar}) {
    if (colorCar.isEmpty) {
      state = state.copyWith(isCheckColorCar: false);
    } else {
      state = state.copyWith(isCheckColorCar: true);
    }
  }

  void isCheckKilometers({required String kilometers}) {
    if (kilometers.isEmpty) {
      state = state.copyWith(isCheckKilometers: false);
    } else {
      state = state.copyWith(isCheckKilometers: true);
    }
  }

  void isCheckSeatsCar({required String seatsCar}) {
    if (seatsCar.isEmpty) {
      state = state.copyWith(isCheckSeatsCar: false);
    } else {
      state = state.copyWith(isCheckSeatsCar: true);
    }
  }

  void isCheckAddressCar({required String addressCar}) {
    if (addressCar.isEmpty) {
      state = state.copyWith(isCheckAddressCar: false);
    } else {
      state = state.copyWith(isCheckAddressCar: true);
    }
  }

  void isCheckPriceCar({required String priceCar}) {
    if (priceCar.isEmpty) {
      state = state.copyWith(isCheckPriceCar: false);
    } else {
      state = state.copyWith(isCheckPriceCar: true);
    }
  }

  Future<String> convertImageToBase64(File imageFile) async {
    List<int> imageBytes = await imageFile.readAsBytes();
    String base64Image = base64Encode(imageBytes);
    return base64Image;
  }

  Future pickImageFromCamera() async {
    final pickedFile = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 20)
        .onError((error, stackTrace) {
      return null;
    });
    state = state.copyWith(
      imageFile: pickedFile?.path ?? "",
    );
  }
}
