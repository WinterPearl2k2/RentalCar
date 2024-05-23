import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rental_car/application/services/preference_service.dart';

class LocationService {
  LocationService._();

  static final LocationService _instance = LocationService._();

  factory LocationService() => _instance;

  Future<void> init() async {
    PermissionStatus permission = await Permission.location.request();
    if (permission.isGranted) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      PreferenceService.setLocation(
          latCar: position.latitude, longCar: position.longitude);

      PreferenceService.setLocationCurrent(
          latCar: position.latitude, longCar: position.longitude);
    }
  }
}
