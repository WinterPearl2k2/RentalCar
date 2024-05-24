import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart' as image_picker;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rental_car/application/services/car_service.dart';
import 'package:rental_car/application/services/mapbox_service.dart';
import 'package:rental_car/application/services/preference_service.dart';
import 'package:rental_car/application/utils/assets_utils.dart';
import 'package:rental_car/application/utils/log_utils.dart';
import 'package:rental_car/data/data_sources/remote/dio/api_exception.dart';
import 'package:rental_car/data/dtos/car_dto.dart';
import 'package:rental_car/domain/model/location.dart' as location;
import 'package:rental_car/domain/model/mapbox_location.dart';
import 'package:rental_car/main.dart';
import 'package:rental_car/presentation/views/manager_car/state/manager_car_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/enum/status.dart';

part 'manager_car_notifier.g.dart';

@riverpod
class ManagerCarNotifier extends _$ManagerCarNotifier {
  @override
  ManagerCarState build() => const ManagerCarState();
  PointAnnotation? currentMarker;
  PointAnnotationManager? pointAnnotationManager;
  MapboxMap? mapboxMap;

  Future<void> getListCarByIdUser() async {
    try {
      final listCarUser =
          await injection.getIt<ICarService>().getAllCarByIdUser(
                idUser: PreferenceService.getUUID(),
              );
      state = state.copyWith(
        listCarUser: listCarUser,
        status: Status.success,
      );
      LogUtils.i("get list car successfully");
    } catch (e) {
      LogUtils.e("get list car fail $e");
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
      LogUtils.i("delete successfully");
      state = state.copyWith(status: Status.success);
    } catch (e) {
      Fluttertoast.showToast(msg: "Delete failed, Car is rented");
      LogUtils.e("Delete failed $e");
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
              imagesCar: state.imageFile,
              statusCar: statusCar,
            ),
          );
      state = state.copyWith(status: Status.success);
      getListCarByIdUser();
      Fluttertoast.showToast(msg: "Edited successfully");
      LogUtils.i("Edited successfully");
    } catch (e) {
      Fluttertoast.showToast(msg: "Edited failed");
      LogUtils.e("Edited failed $e");
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
      imagesCar: state.imageFile,
      statusCar: statusCar,
    );
    try {
      await injection.getIt<ICarService>().createCar(carDTO: carDTO);
      Fluttertoast.showToast(msg: "Create a successful car");
      getListCarByIdUser();
      state = state.copyWith(status: Status.success);
      LogUtils.i("Create a successful car");
    } on APIException catch (e) {
      LogUtils.e(e.message.toString());
      Fluttertoast.showToast(msg: e.message.toString());
      state = state.copyWith(status: Status.error);
    }
  }

  void isCheckNameCarEmpty({required String nameCar}) {
    final isCheckNameCar = nameCar.isEmpty ? false : true;
    state = state.copyWith(isCheckNameCar: isCheckNameCar);
  }

  void isCheckDescriptionCarEmpty({required String descriptionCar}) {
    final isCheckDescriptionCar = descriptionCar.isEmpty ? false : true;
    state = state.copyWith(isCheckDescriptionCar: isCheckDescriptionCar);
  }

  void isCheckColorCarEmpty({required String colorCar}) {
    final isCheckColorCar = colorCar.isEmpty ? false : true;
    state = state.copyWith(isCheckColorCar: isCheckColorCar);
  }

  void isCheckKilometersEmpty({required String kilometers}) {
    final isCheckKilometers = kilometers.isEmpty ? false : true;
    state = state.copyWith(isCheckKilometers: isCheckKilometers);
  }

  void isCheckSeatsCarEmpty({required String seatsCar}) {
    final isCheckSeatsCar = seatsCar.isEmpty ? false : true;
    state = state.copyWith(isCheckSeatsCar: isCheckSeatsCar);
  }

  void isCheckAddressCarEmpty({required String addressCar}) {
    final isCheckAddressCar = addressCar.isEmpty ? false : true;
    state = state.copyWith(isCheckAddressCar: isCheckAddressCar);
  }

  void isCheckPriceCarEmpty({required String priceCar}) {
    final isCheckPriceCar = priceCar.isEmpty ? false : true;
    state = state.copyWith(isCheckPriceCar: isCheckPriceCar);
  }

  void isCheckNameCarChange({required String nameCar}) {
    final isEditButton =
        nameCar != state.carDTO.nameCar && nameCar.isNotEmpty ? true : false;
    state = state.copyWith(isEditButton: isEditButton);
  }

  void isCheckBrandCarChange({required String brandCar}) {
    final isEditButton =
        brandCar != state.carDTO.brandCar && brandCar.isNotEmpty ? true : false;
    state = state.copyWith(isEditButton: isEditButton);
  }

  void isCheckDescriptionCarChange({required String descriptionCar}) {
    final isEditButton = descriptionCar != state.carDTO.descriptionCar &&
            descriptionCar.isNotEmpty
        ? true
        : false;
    state = state.copyWith(isEditButton: isEditButton);
  }

  void isCheckColorCarChange({required String colorCar}) {
    final isEditButton =
        colorCar != state.carDTO.colorCar && colorCar.isNotEmpty ? true : false;
    state = state.copyWith(isEditButton: isEditButton);
  }

  void isCheckFuelTypeCarChange({required String fuelTypeCar}) {
    final isEditButton =
        fuelTypeCar != state.carDTO.fuelTypeCar && fuelTypeCar.isNotEmpty
            ? true
            : false;
    state = state.copyWith(isEditButton: isEditButton);
  }

  void isCheckKilometersCarChange({required String kilometersCar}) {
    final isEditButton =
        kilometersCar != state.carDTO.kilometersCar.toString() &&
                kilometersCar.isNotEmpty
            ? true
            : false;
    state = state.copyWith(isEditButton: isEditButton);
  }

  void isCheckSeatsCarChange({required String seatsCar}) {
    final isEditButton =
        seatsCar != state.carDTO.seatsCar.toString() && seatsCar.isNotEmpty
            ? true
            : false;
    state = state.copyWith(isEditButton: isEditButton);
  }

  void isCheckTransmissionCarChange({required String transmissionCar}) {
    final isEditButton = transmissionCar != state.carDTO.transmissionCar &&
            transmissionCar.isNotEmpty
        ? true
        : false;
    state = state.copyWith(isEditButton: isEditButton);
  }

  void isCheckPriceCarChange({required String priceCar}) {
    final isEditButton =
        priceCar != state.carDTO.priceCar.toString() && priceCar.isNotEmpty
            ? true
            : false;
    state = state.copyWith(isEditButton: isEditButton);
  }

  void isCheckAddressCarChange({required String addressCar}) {
    final isEditButton =
        addressCar != state.carDTO.addressCar && addressCar.isNotEmpty
            ? true
            : false;
    state = state.copyWith(isEditButton: isEditButton);
  }

  void isCheckAddressImageChange({required String imageCar}) {
    final isEditButton =
        imageCar != state.carDTO.imagesCar && imageCar.isNotEmpty
            ? true
            : false;
    state = state.copyWith(isEditButton: isEditButton);
  }

  Future<void> isContinueButtonEnabled({required bool isContinue}) async {
    await Future.delayed(
      const Duration(milliseconds: 1),
    );
    state = state.copyWith(isContinueButtonEnabled: isContinue);
  }

  Future<ByteData> convertImageToBase64(File imageFile) async {
    ByteData bytes = await rootBundle.load(imageFile.path);

    return bytes;
  }

  Future<void> pickImageFromGallery() async {
    PermissionStatus permission = await Permission.camera.request();
    if (permission.isGranted) {
      final pickedFile = await image_picker.ImagePicker()
          .pickImage(source: image_picker.ImageSource.gallery, imageQuality: 20)
          .onError((error, stackTrace) {
        return null;
      });
      state = state.copyWith(isLoadingImg: true);
      final image = await MultipartFile.fromFile(pickedFile?.path ?? "");
      final imageFile =
          await injection.getIt<ICarService>().uploadImage(imageFile: image);
      state = state.copyWith(
        imageFile: imageFile.url,
        isEditButton: true,
        isLoadingImg: false,
      );
    } else if (permission.isDenied) {
      Fluttertoast.showToast(msg: "Gallery access has not been granted");
    }
  }

  Future<void> pickImageFromCamera() async {
    PermissionStatus permission = await Permission.camera.request();
    if (permission.isGranted) {
      final pickedFile = await image_picker.ImagePicker()
          .pickImage(source: image_picker.ImageSource.camera, imageQuality: 20)
          .onError((error, stackTrace) {
        return null;
      });
      state = state.copyWith(isLoadingImg: true);
      final image = await MultipartFile.fromFile(pickedFile?.path ?? "");
      final imageFile =
          await injection.getIt<ICarService>().uploadImage(imageFile: image);
      state = state.copyWith(
        imageFile: imageFile.url,
        isEditButton: true,
        isLoadingImg: false,
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

  Future<String> getAddressLocation({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final addressLocation =
          await injection.getIt<IMapboxService>().getAddressLocation(
                latitude: latitude,
                longitude: longitude,
              );
      LogUtils.i("get address location successfully");
      return addressLocation.formattedAddress;
    } catch (e) {
      LogUtils.e("get address location fail $e");
      return '';
    }
  }

  Future<List<MapboxLocation>> getListAddressPredict({
    required String location,
  }) async {
    try {
      final listAddressPredict = await injection
          .getIt<IMapboxService>()
          .getListAddressPredict(location: location);
      LogUtils.i("get list address predict successfully");
      return listAddressPredict;
    } catch (e) {
      LogUtils.e("get list address predict fail $e");
      return [];
    }
  }

  Future<location.Location> getLatLongAddress({
    required String placeId,
  }) async {
    try {
      final latLong = await injection
          .getIt<IMapboxService>()
          .getLatLongLocation(placeId: placeId);
      LogUtils.i("get latLong successfully");
      return latLong;
    } catch (e) {
      LogUtils.e("get list address predict fail $e");
      return const location.Location(latitude: 0, longitude: 0);
    }
  }

  void onMapCreated({
    required double latitude,
    required double longitude,
    required MapboxMap mapboxMap,
  }) {
    this.mapboxMap = mapboxMap;
    initMarker(
      latitude: latitude,
      longitude: longitude,
    );
  }

  Future<void> initMarker({
    required double latitude,
    required double longitude,
  }) async {
    final ByteData bytes = await rootBundle.load(AssetUtils.imgLocation);
    final Uint8List list = bytes.buffer.asUint8List();
    pointAnnotationManager =
        await mapboxMap?.annotations.createPointAnnotationManager();
    final options = PointAnnotationOptions(
      geometry: Point(
        coordinates: Position(longitude, latitude),
      ).toJson(),
      image: list,
    );
    mapboxMap?.setCamera(
      CameraOptions(
        center: Point(
          coordinates: Position(
            longitude,
            latitude,
          ),
        ).toJson(),
        zoom: 14.0,
      ),
    );
    currentMarker = await pointAnnotationManager?.create(options);
  }

  Future<void> marker({
    required double latitude,
    required double longitude,
  }) async {
    final ByteData bytes = await rootBundle.load(AssetUtils.imgLocation);
    final Uint8List list = bytes.buffer.asUint8List();
    final options = PointAnnotationOptions(
      geometry: Point(
        coordinates: Position(longitude, latitude),
      ).toJson(),
      image: list,
    );

    if (currentMarker != null) {
      pointAnnotationManager?.delete(currentMarker!);
    }
    mapboxMap?.flyTo(
      CameraOptions(
        center: Point(
          coordinates: Position(
            longitude,
            latitude,
          ),
        ).toJson(),
        zoom: 14.0,
      ),
      MapAnimationOptions(
        duration: 1500,
      ),
    );
    currentMarker = await pointAnnotationManager?.create(options);
  }

  void setLocation({
    required double latitude,
    required double longitude,
  }) {
    getAddressLocation(
      latitude: latitude,
      longitude: longitude,
    );
  }

  void moveToCurrentLocation({
    required double longitude,
    required double latitude,
  }) async {
    mapboxMap?.flyTo(
      CameraOptions(
        center: Point(
          coordinates: Position(
            longitude,
            latitude,
          ),
        ).toJson(),
        zoom: 14.0,
      ),
      MapAnimationOptions(
        duration: 1500,
      ),
    );
    marker(
      latitude: latitude,
      longitude: longitude,
    );
  }
}
