import 'package:rental_car/domain/model/location.dart';
import 'package:rental_car/domain/model/mapbox_location.dart';

abstract class IMapboxRepository {
  Future<MapboxLocation> getAddressLocation({
    required double latitude,
    required double longitude,
  });

  Future<List<MapboxLocation>> getListAddressPredict({
    required String location,
  });

  Future<Location> getLatLongLocation({
    required String placeId,
  });
}
