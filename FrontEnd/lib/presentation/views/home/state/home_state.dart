import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rental_car/data/dtos/all_car_dto.dart';
import 'package:rental_car/data/dtos/top_car_dto.dart';
import 'package:const_date_time/const_date_time.dart';
import 'package:rental_car/presentation/common/enum/status.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<TopCarDTO> listTopCar,
    @Default([]) List<AllCarDTO> listAllCar,
    @Default([]) List<AllCarDTO> listSearchCar,
    @Default(0) double instanceCar,
    @Default(Status.loading) Status status,
    @Default(Status.loading) Status statusSearch,
    @Default(false) bool isCheckSearch,
    @Default([]) List<Placemark> placeMarks,
    @Default(
      Position(
          longitude: 0.0,
          latitude: 0.0,
          timestamp: ConstDateTime(2024),
          accuracy: 0.0,
          altitude: 0.0,
          altitudeAccuracy: 0.0,
          heading: 0.0,
          headingAccuracy: 0.0,
          speed: 0.0,
          speedAccuracy: 0.0),
    )
    Position position,
    
  }) = _HomeState;
}

