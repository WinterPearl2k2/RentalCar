import 'package:rental_car/application/services/preference_service.dart';
import 'package:rental_car/data/data_sources/remote/api/end_point.dart';
import 'package:rental_car/data/data_sources/remote/api/network_api.dart';
import 'package:rental_car/domain/model/location.dart';
import 'package:rental_car/domain/model/mapbox_location.dart';
import 'package:rental_car/domain/repositories/mapbox_repository.dart';

class MapboxRepositoryImpl extends NetworkApi implements IMapboxRepository {
  final apikey = PreferenceService.getApiKeyGoong();

  @override
  Future<MapboxLocation> getAddressLocation(
      {required double latitude, required double longitude}) {
    return getMapbox<MapboxLocation>(
      url:
          '${EndPoint.restUrlGoong}/Geocode?latlng=$latitude,$longitude&api_key=$apikey',
      mapper: (response) =>
          MapboxLocation.fromJson(response.data['results'][0]),
    );
  }

  @override
  Future<List<MapboxLocation>> getListAddressPredict(
      {required String location}) {
    return getMapbox<List<MapboxLocation>>(
      url:
          '${EndPoint.restUrlGoong}/Place/AutoComplete?api_key=$apikey&input=$location',
      mapper: (response) {
        return (response.data['predictions'] as List)
            .map(
              (json) => MapboxLocation.fromJson(json),
            )
            .toList();
      },
    );
  }

  @override
  Future<Location> getLatLongLocation({required String placeId}) {
    return getMapbox<Location>(
      url:
          '${EndPoint.restUrlGoong}/Place/Detail?place_id=$placeId&api_key=$apikey',
      mapper: (response) =>
          Location.fromJson(response.data['result']['geometry']['location']),
    );
  }
}
