import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:rental_car/application/routes/routes.dart';
import 'package:rental_car/application/services/calling_service.dart';
import 'package:rental_car/application/services/car_service.dart';
import 'package:rental_car/application/services/preference_service.dart';
import 'package:rental_car/application/utils/log_utils.dart';
import 'package:rental_car/data/dtos/car_detail_dto.dart';
import 'package:rental_car/main.dart';
import 'package:rental_car/presentation/common/enum/status.dart';
import 'package:rental_car/presentation/views/car_detail/state/car_detail_state.dart';
import 'package:rental_car/presentation/views/room_call/room_call_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../data/data_sources/remote/dio/api_client.dart';
import '../../../../data/data_sources/remote/dio/api_exception.dart';

part 'car_detail_notifier.g.dart';

@riverpod
class CarDetailNotifier extends _$CarDetailNotifier {
  @override
  CarDetailState build() => const CarDetailState();
  int currentPage = 1;
  final int pageSize = 2;

  Future<void> getCarById({required String idCar}) async {
    try {
      if (state.isLoadingMore) return;
      await Future.delayed(
        const Duration(milliseconds: 1),
      );
      state = state.copyWith(isLoadingMore: true);

      final carDetail = await injection
          .getIt<ICarService>()
          .getCarById(idCar: idCar, page: currentPage, pageSize: pageSize);

      if (currentPage == 1) {
        state = state.copyWith(carDetail: carDetail, status: Status.success);
      } else {
        final updatedComments = [
          ...state.carDetail.comments,
          ...carDetail.comments
        ];
        final updatedCarDetail = carDetail.copyWith(comments: updatedComments);

        state =
            state.copyWith(carDetail: updatedCarDetail, status: Status.success);
      }

      LogUtils.i("get Car oke");
      currentPage++;
      state = state.copyWith(isLoadingMore: false);
    } catch (e) {
      state = state.copyWith(isLoadingMore: false);
      LogUtils.i(e.toString());
      state =
          state.copyWith(carDetail: const CarDetailDTO(), status: Status.error);
    }
  }

  void rentingCar(context) {
    Routes.goToRentalCarView(context, state.carDetail);
  }

  Future<void> launchMap(
      {required double latCar, required double longCar}) async {
    double currentLatitude = PreferenceService.getLocation().latitude;
    double currentLongitude = PreferenceService.getLocation().longitude;
    MapLauncher.showDirections(
        mapType: MapType.google,
        destination: Coords(latCar, longCar),
        origin: Coords(currentLatitude, currentLongitude));
  }

  Future<void> createCalling() async {
    try {
      await injection.getIt<ICallingService>().getKeyCall().then((value) => {
            if (value.isNotEmpty)
              {
                Navigator.push(
                  navigatorKey.currentState!.context,
                  MaterialPageRoute(
                    builder: (context) => RoomCallView(
                      meetingId: value,
                      token: ApiClient.instance.token,
                      userOwner: state.carDetail.idUser,
                      type: true,
                    ),
                  ),
                ),
              }
          });
    } on APIException catch (e) {
      LogUtils.e(e.message.toString());
      Fluttertoast.showToast(msg: e.message.toString());
      state = state.copyWith(status: Status.error);
    }
  }
}
