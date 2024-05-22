import 'package:rental_car/data/data_sources/remote/api/end_point.dart';
import 'package:rental_car/data/data_sources/remote/api/network_api.dart';
import 'package:rental_car/domain/model/mapbox_location.dart';
import 'package:rental_car/domain/repositories/mapbox_repository.dart';

class MapBoxRepositoryImpl extends NetworkApi implements IMapboxRepository {
  final apikey =
      'sk.eyJ1IjoicXVhbnRhdHRzIiwiYSI6ImNsd2cxd2NzdTAwN3QycXJtM21qY3U2Y2IifQ.ztbU0y2xI-sDhHUO0z6xwQ';

  @override
  Future<MapboxLocation> getAddressLocation(
      {required double latitude, required double longitude}) {
    return getMapbox<MapboxLocation>(
      url: '${EndPoint.restUrlMapbox}/$longitude,$latitude.json'
          '?access_token=$apikey',
      mapper: (response) => MapboxLocation.fromJson(response.data),
    );
  }

  @override
  Future<List<MapboxLocation>> getListAddressPredict(
      {required String location}) {
    return getMapbox<List<MapboxLocation>>(
      url: '${EndPoint.restUrlMapbox}/$location.json'
          '?access_token=$apikey&autocomplete=true&language=vi&limit=10',
      mapper: (response) {
        return (response.data as List)
            .map(
              (json) => MapboxLocation.fromJson(json),
            )
            .toList();
      },
    );
  }
}
