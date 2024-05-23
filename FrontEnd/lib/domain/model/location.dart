import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.freezed.dart';
part 'location.g.dart';

@freezed
class Location with _$Location{
  const factory Location({
    @JsonKey(name: 'lat') @Default(0) double latitude,
    @JsonKey(name: 'lng') @Default(0) double longitude,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
}
