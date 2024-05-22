import 'package:freezed_annotation/freezed_annotation.dart';

part 'mapbox_location.freezed.dart';
part 'mapbox_location.g.dart';

@freezed
class MapboxLocation with _$MapboxLocation{
  const factory MapboxLocation({
    @JsonKey(name: 'place_name') @Default('') String placeName,
    @Default([]) List<double> center,
  }) = _MapboxLocation;

  factory MapboxLocation.fromJson(Map<String, dynamic> json) => _$MapboxLocationFromJson(json);
}
