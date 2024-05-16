import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rental_car/application/services/car_service.dart';
import 'package:rental_car/application/services/preference_service.dart';
import 'package:rental_car/application/utils/log_utils.dart';
import 'package:rental_car/data/data_sources/remote/dio/api_exception.dart';
import 'package:rental_car/data/dtos/car_dto.dart';
import 'package:rental_car/main.dart';
import 'package:rental_car/presentation/views/manager_car/state/manager_car_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/enum/status.dart';

part 'manager_car_notifier.g.dart';

@riverpod
class ManagerCarNotifier extends _$ManagerCarNotifier {
  @override
  ManagerCarState build() => const ManagerCarState();

  Future<void> getListCarByIdUser() async {
    try {
      final listCarUser =
          await injection.getIt<ICarService>().getAllCarByIdUser(
                idUser: PreferenceService.getUUID(),
              );
      state = state.copyWith(status: Status.success);
      if (listCarUser.isNotEmpty) {
        state = state.copyWith(listCarUser: listCarUser);
      } else {
        state = state.copyWith(listCarUser: []);
      }
      LogUtils.i("getList oke");
    } catch (e) {
      LogUtils.i(e.toString());
      state = state.copyWith(status: Status.error);
    }
  }

  Future<void> deleteCar({required String idCar}) async {
    try {
      await injection.getIt<ICarService>().deleteCar(
            idCar: idCar,
          );
      getListCarByIdUser();
      Fluttertoast.showToast(msg: "Deleted successfully");
      LogUtils.i("delete oke");
      state = state.copyWith(status: Status.success);
    } catch (e) {
      Fluttertoast.showToast(msg: "Delete failed, Car is rented");
      LogUtils.i(e.toString());
      state = state.copyWith(status: Status.error);
    }
  }

  Future<void> setUpData({required CarDTO carDTO}) async {
    await Future.delayed(
      const Duration(milliseconds: 1),
    );
    state = state.copyWith(
      carDTO: CarDTO(
        nameCar: carDTO.nameCar,
        priceCar: carDTO.priceCar,
        brandCar: carDTO.brandCar,
        fuelTypeCar: carDTO.fuelTypeCar,
        colorCar: carDTO.colorCar,
        descriptionCar: carDTO.descriptionCar,
        kilometersCar: carDTO.kilometersCar,
        seatsCar: carDTO.seatsCar,
        addressCar: carDTO.addressCar,
        transmissionCar: carDTO.transmissionCar,
        statusCar: carDTO.statusCar,
      ),
      imageFile: carDTO.imagesCar,
      isEditButton: false,
    );
  }

  Future<void> updateCar({
    required String idCar,
    required String nameCar,
    required double priceCar,
    required String brandCar,
    required String fuelTypeCar,
    required String colorCar,
    required String descriptionCar,
    required double kilometersCar,
    required int seatsCar,
    required String addressCar,
    required double latCar,
    required double longCar,
    required String transmissionCar,
    required String statusCar,
  }) async {
    try {
      await injection.getIt<ICarService>().updateCar(
            idCar: idCar,
            carDTO: CarDTO(
              nameCar: nameCar,
              priceCar: priceCar,
              fuelTypeCar: fuelTypeCar,
              colorCar: colorCar,
              brandCar: brandCar,
              descriptionCar: descriptionCar,
              kilometersCar: kilometersCar,
              seatsCar: seatsCar,
              addressCar: addressCar,
              latCar: latCar,
              longCar: longCar,
              transmissionCar: transmissionCar,
              imagesCar: isFileExtension(imageFile: state.imageFile)
                  ? await convertImageToBase64(
                      File(state.imageFile),
                    )
                  : state.carDTO.imagesCar,
              statusCar: statusCar,
            ),
          );
      state = state.copyWith(status: Status.success);
      getListCarByIdUser();
      Fluttertoast.showToast(msg: "Edited successfully");
      LogUtils.i("edit oke");
    } catch (e) {
      Fluttertoast.showToast(msg: "Edited failed");
      LogUtils.i(e.toString());
      state = state.copyWith(status: Status.error);
    }
  }

  void changeForwardView() {
    switch (state.addCarStep) {
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
        state = state.copyWith(addCarStep: AddCarStep.step1);
        break;
    }
  }

  void changeBackwardView() {
    switch (state.addCarStep) {
      case AddCarStep.step1:
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
    required String addressCar,
    required double latCar,
    required double longCar,
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
      addressCar: addressCar,
      latCar: latCar,
      longCar: longCar,
      transmissionCar: transmissionCar,
      imagesCar: await convertImageToBase64(File(state.imageFile)),
      statusCar: statusCar,
    );
    try {
      await injection.getIt<ICarService>().createCar(carDTO: carDTO);
      Fluttertoast.showToast(msg: "Create a successful car");
      getListCarByIdUser();
      state = state.copyWith(status: Status.success);
    } on APIException catch (e) {
      LogUtils.e(e.message.toString());
      Fluttertoast.showToast(msg: e.message.toString());
      state = state.copyWith(status: Status.error);
    }
  }

  void isCheckNameCarEmpty({required String nameCar}) {
    if (nameCar.isEmpty) {
      state = state.copyWith(isCheckNameCar: false);
    } else {
      state = state.copyWith(isCheckNameCar: true);
    }
  }

  void isCheckDescriptionCarEmpty({required String descriptionCar}) {
    if (descriptionCar.isEmpty) {
      state = state.copyWith(isCheckDescriptionCar: false);
    } else {
      state = state.copyWith(isCheckDescriptionCar: true);
    }
  }

  void isCheckColorCarEmpty({required String colorCar}) {
    if (colorCar.isEmpty) {
      state = state.copyWith(isCheckColorCar: false);
    } else {
      state = state.copyWith(isCheckColorCar: true);
    }
  }

  void isCheckKilometersEmpty({required String kilometers}) {
    if (kilometers.isEmpty) {
      state = state.copyWith(isCheckKilometers: false);
    } else {
      state = state.copyWith(isCheckKilometers: true);
    }
  }

  void isCheckSeatsCarEmpty({required String seatsCar}) {
    if (seatsCar.isEmpty) {
      state = state.copyWith(isCheckSeatsCar: false);
    } else {
      state = state.copyWith(isCheckSeatsCar: true);
    }
  }

  void isCheckAddressCarEmpty({required String addressCar}) {
    if (addressCar.isEmpty) {
      state = state.copyWith(isCheckAddressCar: false);
    } else {
      state = state.copyWith(isCheckAddressCar: true);
    }
  }

  void isCheckPriceCarEmpty({required String priceCar}) {
    if (priceCar.isEmpty) {
      state = state.copyWith(isCheckPriceCar: false);
    } else {
      state = state.copyWith(isCheckPriceCar: true);
    }
  }

  void isCheckNameCarChange({required String nameCar}) {
    if (nameCar != state.carDTO.nameCar && nameCar.isNotEmpty) {
      state = state.copyWith(isEditButton: true);
    } else {
      state = state.copyWith(isEditButton: false);
    }
  }

  void isCheckBrandCarChange({required String brandCar}) {
    if (brandCar != state.carDTO.brandCar && brandCar.isNotEmpty) {
      state = state.copyWith(isEditButton: true);
    } else {
      state = state.copyWith(isEditButton: false);
    }
  }

  void isCheckDescriptionCarChange({required String descriptionCar}) {
    if (descriptionCar != state.carDTO.descriptionCar &&
        descriptionCar.isNotEmpty) {
      state = state.copyWith(isEditButton: true);
    } else {
      state = state.copyWith(isEditButton: false);
    }
  }

  void isCheckColorCarChange({required String colorCar}) {
    if (colorCar != state.carDTO.colorCar && colorCar.isNotEmpty) {
      state = state.copyWith(isEditButton: true);
    } else {
      state = state.copyWith(isEditButton: false);
    }
  }

  void isCheckFuelTypeCarChange({required String fuelTypeCar}) {
    if (fuelTypeCar != state.carDTO.fuelTypeCar && fuelTypeCar.isNotEmpty) {
      state = state.copyWith(isEditButton: true);
    } else {
      state = state.copyWith(isEditButton: false);
    }
  }

  void isCheckKilometersCarChange({required String kilometersCar}) {
    if (kilometersCar != state.carDTO.kilometersCar.toString() &&
        kilometersCar.isNotEmpty) {
      state = state.copyWith(isEditButton: true);
    } else {
      state = state.copyWith(isEditButton: false);
    }
  }

  void isCheckSeatsCarChange({required String seatsCar}) {
    if (seatsCar != state.carDTO.seatsCar.toString() && seatsCar.isNotEmpty) {
      state = state.copyWith(isEditButton: true);
    } else {
      state = state.copyWith(isEditButton: false);
    }
  }

  void isCheckTransmissionCarChange({required String transmissionCar}) {
    if (transmissionCar != state.carDTO.transmissionCar &&
        transmissionCar.isNotEmpty) {
      state = state.copyWith(isEditButton: true);
    } else {
      state = state.copyWith(isEditButton: false);
    }
  }

  void isCheckPriceCarChange({required String priceCar}) {
    if (priceCar != state.carDTO.priceCar.toString() && priceCar.isNotEmpty) {
      state = state.copyWith(isEditButton: true);
    } else {
      state = state.copyWith(isEditButton: false);
    }
  }

  void isCheckAddressCarChange({required String addressCar}) {
    if (addressCar != state.carDTO.addressCar &&
        addressCar.toString().isNotEmpty) {
      state = state.copyWith(isEditButton: true);
    } else {
      state = state.copyWith(isEditButton: false);
    }
  }

  void isCheckAddressImageChange({required String imageCar}) {
    if (imageCar != state.carDTO.imagesCar && imageCar.toString().isNotEmpty) {
      state = state.copyWith(isEditButton: true);
    } else {
      state = state.copyWith(isEditButton: false);
    }
  }
  Future<void> isContinueButtonEnabled({required bool isContinue}) async {
    await Future.delayed(
      const Duration(milliseconds: 1),
    );
      state = state.copyWith(isContinueButtonEnabled: isContinue);
  }

  Future<String> convertImageToBase64(File imageFile) async {
    List<int> imageBytes = await imageFile.readAsBytes();
    String base64Image = base64Encode(imageBytes);
    return base64Image;
  }

  Future<void> pickImageFromGallery() async {
    PermissionStatus permission = await Permission.camera.request();
    if (permission.isGranted) {
      final pickedFile = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 20)
          .onError((error, stackTrace) {
        return null;
      });
      state = state.copyWith(
        imageFile: pickedFile?.path ?? "",
        isEditButton: true,
      );
    } else if (permission.isDenied) {
      Fluttertoast.showToast(msg: "Gallery access has not been granted");
    }
  }

  Future<void> pickImageFromCamera() async {
    PermissionStatus permission = await Permission.camera.request();
    if (permission.isGranted) {
      final pickedFile = await ImagePicker()
          .pickImage(source: ImageSource.camera, imageQuality: 20)
          .onError((error, stackTrace) {
        return null;
      });
      state = state.copyWith(
        imageFile: pickedFile?.path ?? "",
        isEditButton: true,
      );
    } else if (permission.isDenied) {
      Fluttertoast.showToast(msg: "Camera access has not been granted");
    }
  }

  Future<void> clearImage() async {
    state = state.copyWith(
      imageFile: "",
    );
  }

  bool isFileExtension({required String imageFile}) {
    String fileExtension = imageFile.split('.').last.toLowerCase();
    if (fileExtension == 'jpg' ||
        fileExtension == 'jpeg' ||
        fileExtension == 'png' ||
        fileExtension == 'gif' ||
        fileExtension == 'bmp' ||
        fileExtension == 'webp' ||
        fileExtension == 'tif' ||
        fileExtension == 'tiff') {
      return true;
    } else {
      return false;
    }
  }

}
