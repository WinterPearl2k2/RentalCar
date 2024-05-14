import 'package:freezed_annotation/freezed_annotation.dart';

part 'date_time_dto.freezed.dart';

@freezed
class DateTimeDto with _$DateTimeDto {
  const factory DateTimeDto({
    @Default('') String startDate,
    @Default('') String endDate,
  }) = _DateTimeDto;

  factory DateTimeDto.fromJson(Map<String, dynamic> json) {
    return DateTimeDto(
      startDate: json['StartDate'] ?? '',
      endDate: json['EndDate'] ?? '',
    );
  }
}
