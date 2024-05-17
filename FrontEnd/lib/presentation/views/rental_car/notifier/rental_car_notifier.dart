import 'package:fluttertoast/fluttertoast.dart';
import 'package:rental_car/application/services/auth_service.dart';
import 'package:rental_car/application/services/car_service.dart';
import 'package:rental_car/application/utils/date_time_format_untils.dart';
import 'package:rental_car/data/dtos/car_rental_dto.dart';
import 'package:rental_car/main.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../application/utils/log_utils.dart';
import '../../../../data/data_sources/remote/dio/api_exception.dart';
import '../../../../data/dtos/car_detail_dto.dart';
import '../state/rental_car_state.dart';

part 'rental_car_notifier.g.dart';

@riverpod
class RentalCarNotifier extends _$RentalCarNotifier {
  @override
  RentalCarState build() => const RentalCarState();

  Future<void> setUpData(CarDetailDTO carData) async {
    try {
      final user = await injection.getIt<IAuthService>().getUser();
      final dateTimeDto = await injection.getIt<ICarService>().getDateTimeCar(
            idCar: carData.idCar,
          );
      DateTime dateTime = DateTimeFormatUtils.stringToDateFormat(
        date: DateTimeFormatUtils.dateToFormat(
          date: DateTime.now(),
          format: 'dd/MM/yyyy',
        ),
        format: 'dd/MM/yyyy',
      );
      final days = dateTime.difference(dateTime).inDays + 1;
      final total = carData.priceCar * days;
      for (var date in dateTimeDto) {
        while (true) {
          final isInsideRange = dateTime.isAfter(
                DateTime.parse(date.startDate).add(
                  const Duration(days: -1),
                ),
              ) &&
              dateTime.isBefore(
                DateTime.parse(date.endDate),
              );
          print(dateTime.isAfter(DateTime.parse(date.startDate)));
          print(dateTime.isAfter(DateTime.parse(date.endDate)));
          print(dateTime);
          print(DateTime.parse(date.startDate));
          print(DateTime.parse(date.endDate));
          if (isInsideRange) {
            dateTime = dateTime.add(const Duration(days: 1));
            print(dateTime);
          } else {
            break;
          }
        }
      }
      print(dateTime);
      state = state.copyWith(
        user: user,
        car: carData,
        // isSelectRental: false,
        startDate: DateTimeFormatUtils.dateToFormat(
          date: dateTime,
          format: 'dd/MM/yyyy',
        ),
        endDate: DateTimeFormatUtils.dateToFormat(
          date: dateTime,
          format: 'dd/MM/yyyy',
        ),
        numberDays: days,
        total: total,
        dates: dateTimeDto,
      );
      LogUtils.e(state.user.toString());
    } on APIException catch (e) {
      LogUtils.e(e.message.toString());
      Fluttertoast.showToast(msg: e.message.toString());
    }
    state = state.copyWith(loading: true);
  }

  void bookDay({
    required DateTime? startDay,
    required DateTime? endDay,
  }) {
    if (startDay == null || endDay == null) return;
    final days = endDay.difference(startDay).inDays + 1;
    final total = state.car.priceCar * days;
    state = state.copyWith(
      startDate: DateTimeFormatUtils.dateToFormat(
        date: startDay,
        format: 'dd/MM/yyyy',
      ),
      endDate: DateTimeFormatUtils.dateToFormat(
        date: endDay,
        format: 'dd/MM/yyyy',
      ),
      numberDays: days,
      total: total,
    );
  }

  Future<void> rentalCar() async {
    state = state.copyWith(loading: false);
    try {
      final startDate = DateTimeFormatUtils.stringToDateFormat(
        date: state.startDate,
        format: 'dd/MM/yyyy',
      ).toString();
      final endDate = DateTimeFormatUtils.stringToDateFormat(
        date: state.endDate,
        format: 'dd/MM/yyyy',
      ).toString();
      final carRentalDto = CarRentalDto(
        idCar: state.car.idCar,
        rentalDays: state.numberDays,
        rentalPrice: state.total,
        startDate: startDate,
        endDate: endDate,
      );
      await injection.getIt<ICarService>().rentalCar(
            carRentalDto: carRentalDto,
          );
      state = state.copyWith(
        statusView: RentalCarStatus.rentalSuccess,
      );
      LogUtils.e('Success');
      Fluttertoast.showToast(msg: 'Rental success');
    } on APIException catch (e) {
      LogUtils.e(e.message.toString());
      Fluttertoast.showToast(msg: e.message.toString());
    }
    state = state.copyWith(loading: true);
  }

  void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    final selectedStartDate = args.value.startDate;
    final selectedEndDate = args.value.endDate;
    bool isSelectRental = true;
    if (selectedStartDate == null || selectedEndDate == null) return;
    for (var dateTimeDto in state.dates) {
      final startDate = DateTime.parse(dateTimeDto.startDate);
      final endDate = DateTime.parse(dateTimeDto.endDate);
      if (selectedStartDate.isBefore(startDate) &&
          selectedEndDate.isAfter(endDate)) {
        isSelectRental = false;
        break;
      }
    }
    state = state.copyWith(isSelectRental: isSelectRental);
  }

  bool selectableDayPredicate(DateTime date) {
    for (var dateTimeDto in state.dates) {
      final startDate = DateTime.parse(dateTimeDto.startDate);
      final endDate = DateTime.parse(dateTimeDto.endDate);
      if (date.isAfter(
            startDate.subtract(
              const Duration(days: 1),
            ),
          ) &&
          date.isBefore(
            endDate.add(
              const Duration(days: 0),
            ),
          )) {
        return false;
      }
    }
    return true;
  }
}
