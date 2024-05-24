import 'package:rental_car/domain/model/location.dart';
import 'package:rental_car/domain/model/mapbox_location.dart';
import 'package:rental_car/domain/repositories/mapbox_repository.dart';

abstract class IMapboxService {
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

class MapboxServiceImpl implements IMapboxService {
  final IMapboxRepository _mapboxRepository;

  MapboxServiceImpl(this._mapboxRepository);

  @override
  Future<MapboxLocation> getAddressLocation({
    required double latitude,
    required double longitude,
  }) {
    return _mapboxRepository.getAddressLocation(
      latitude: latitude,
      longitude: longitude,
    );
  }

  @override
  Future<List<MapboxLocation>> getListAddressPredict({
    required String location,
  }) {
    return _mapboxRepository.getListAddressPredict(
      location: location,
    );
  }

  @override
  Future<Location> getLatLongLocation({required String placeId}) {
   return _mapboxRepository.getLatLongLocation(placeId: placeId);
  }


}
