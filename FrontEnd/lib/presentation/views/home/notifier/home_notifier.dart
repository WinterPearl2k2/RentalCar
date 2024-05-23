import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:rental_car/application/services/car_service.dart';
import 'package:rental_car/application/services/contract_service.dart';
import 'package:rental_car/application/services/firebase_service.dart';
import 'package:rental_car/application/services/mapbox_service.dart';
import 'package:rental_car/application/services/preference_service.dart';
import 'package:rental_car/application/utils/assets_utils.dart';
import 'package:rental_car/application/utils/log_utils.dart';
import 'package:rental_car/data/data_sources/remote/dio/api_exception.dart';
import 'package:rental_car/domain/model/mapbox_location.dart';
import 'package:rental_car/main.dart';
import 'package:rental_car/presentation/common/enum/status.dart';
import 'package:rental_car/presentation/views/home/state/home_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:geocoding/geocoding.dart';

part 'home_notifier.g.dart';

@riverpod
class HomeNotifier extends _$HomeNotifier {
  @override
  HomeState build() => const HomeState();

  PointAnnotation? currentMarker;
  PointAnnotationManager? pointAnnotationManager;
  MapboxMap? mapboxMap;

  Future<void> getListTopCars() async {
    try {
      final listTopCar = await injection.getIt<ICarService>().getTopCar();
      state = state.copyWith(
        listTopCar: listTopCar,
        statusTopCar: Status.success,
      );
      LogUtils.i("get list top car successfully");
    } catch (e) {
      LogUtils.e("get list top car fail $e");
      state = state.copyWith(statusTopCar: Status.error);
    }
  }

  Future<void> getListSearchCars({required String nameCar}) async {
    try {
      state = state.copyWith(
        listSearchCar: [],
      );
      final listSearchCar =
          await injection.getIt<ICarService>().getSearchCar(nameCar: nameCar);
      state = state.copyWith(
        listSearchCar: listSearchCar,
        statusSearch: Status.success,
      );
      LogUtils.i("get list search car successfully");
    } catch (e) {
      LogUtils.e("get list search car fail $e");
      state = state.copyWith(statusSearch: Status.error);
    }
  }

  Future<void> clearSearch() async {
    await Future.delayed(
      const Duration(milliseconds: 1),
    );
    state = state.copyWith(
      isCheckSearch: false,
      listSearchCar: [],
    );
  }

  void isCheckSearch({required String searchController}) {
    final isCheckSearch = searchController.isEmpty ? false : true;
    state = state.copyWith(
      isCheckSearch: isCheckSearch,
      statusSearch: Status.loading,
    );
  }

  Future<void> getListAllCars() async {
    try {
      final listAllCar = await injection.getIt<ICarService>().getAllCar();
      state = state.copyWith(
        listAllCar: listAllCar,
        statusNearCar: Status.success,
      );
      LogUtils.i("get list car near you successfully");
    } catch (e) {
      LogUtils.e("get list car near you fail $e");
      state = state.copyWith(statusNearCar: Status.error);
    }
  }

  Future<void> getLocationUser() async {
    double currentLatitude = PreferenceService.getLocation().latitude;
    double currentLongitude = PreferenceService.getLocation().longitude;
    List<Placemark> placeMarks =
        await placemarkFromCoordinates(currentLatitude, currentLongitude);
    PreferenceService.setNameLocationCurrent("${placeMarks[0].subAdministrativeArea}, ${placeMarks[0].administrativeArea}, ${placeMarks[0].country}");
    setNameLocation(
        nameLocation: placeMarks.isNotEmpty
            ? "${placeMarks[0].subAdministrativeArea}, ${placeMarks[0].administrativeArea}, ${placeMarks[0].country}"
            : "Loading...");
  }

  Future<void> _handleOpenAppMessage(RemoteMessage msg) async {
    await getNumberNotification();
  }

  Future<void> getNumberNotification() async {
    try {
      final count = await injection.getIt<IContractService>().getNotification();
      state = state.copyWith(numberNewNotification: count);
    } on APIException catch (e) {
      LogUtils.e(e.message.toString());
    }
  }

  Future<void> _handleMessage(RemoteMessage msg) async {
    await getNumberNotification();
  }

  Future<void> setListenMessage() async {
    injection.getIt<FirebaseService>().handleMessage(
          onChangedMessage: _handleMessage,
          onMessageOpenApp: _handleOpenAppMessage,
        );
  }

  void resetNumberNotification() {
    state = state.copyWith(numberNewNotification: 0);
  }

  void setNameLocation({required String nameLocation}) =>
      state = state.copyWith(nameLocation: nameLocation);

  Future<void> getAddressLocation({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final addressLocation =
          await injection.getIt<IMapboxService>().getAddressLocation(
                latitude: latitude,
                longitude: longitude,
              );
      setNameLocation(nameLocation: addressLocation.formattedAddress);
      LogUtils.i("get address location successfully");
    } catch (e) {
      LogUtils.e("get address location fail $e");
    }
  }

  Future<List<MapboxLocation>> getListAddressPredict({
    required String location,
  }) async {
    try {
      final listAddressPredict = await injection
          .getIt<IMapboxService>()
          .getListAddressPredict(location: location);
      state = state.copyWith(
          listAddressPredict:
              listAddressPredict.isEmpty ? [] : listAddressPredict);
      LogUtils.i("get list address predict successfully");
      return listAddressPredict;
    } catch (e) {
      LogUtils.e("get list address predict fail $e");
      return [];
    }
  }

  void onMapCreated(
    MapboxMap mapboxMap,
  ) {
    this.mapboxMap = mapboxMap;
    initMarker(
      latitude: PreferenceService.getLocation().latitude,
      longitude: PreferenceService.getLocation().longitude,
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
    getAddressLocation(
      latitude: latitude,
      longitude: longitude,
    );
    PreferenceService.setLocation(
      latCar: latitude,
      longCar: longitude,
    );
  }

  void moveToCurrentLocation() async {
    final location = PreferenceService.getLocationCurrent();
    mapboxMap?.setCamera(
      CameraOptions(
        center: Point(
          coordinates: Position(
            location.longitude,
            location.latitude,
          ),
        ).toJson(),
        zoom: 14.0,
      ),
    );
    marker(
      latitude: location.latitude,
      longitude: location.longitude,
    );
  }
}
