import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rental_car/data/dtos/all_car_dto.dart';
import 'package:rental_car/data/dtos/top_car_dto.dart';
import 'package:rental_car/domain/model/mapbox_location.dart';
import 'package:rental_car/presentation/common/enum/status.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<TopCarDTO> listTopCar,
    @Default([]) List<AllCarDTO> listAllCar,
    @Default([]) List<AllCarDTO> listSearchCar,
    @Default(0) double instanceCar,
    @Default(0) int currentPage,
    @Default(2) int pageSize,
    @Default(0) int numberNewNotification,
    @Default(false) bool isLoadingMore,
    @Default(Status.loading) Status statusTopCar,
    @Default(Status.loading) Status statusNearCar,
    @Default(Status.loading) Status statusSearch,
    @Default(false) bool isCheckSearch,
    @Default('') String nameLocation,
    @Default([]) List<MapboxLocation> listAddressPredict,
  }) = _HomeState;
}

