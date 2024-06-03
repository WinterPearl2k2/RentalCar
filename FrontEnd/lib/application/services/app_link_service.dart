import 'package:app_links/app_links.dart';
import 'package:rental_car/application/services/navigation_service.dart';
import 'package:rental_car/application/routes/routes_name.dart';
import 'package:rental_car/application/utils/log_utils.dart';
import 'package:rental_car/main.dart';

class AppLinkService {
  AppLinkService._privateConstructor() {
    _initDeepLinkListener();
  }
  static final AppLinkService _instance = AppLinkService._privateConstructor();

  factory AppLinkService() {
    return _instance;
  }

  final AppLinks _appLinks = AppLinks();

  void _initDeepLinkListener() {
    _appLinks.uriLinkStream.listen((uri) {
      final idCar = uri.queryParameters['idCar'];
      if (uri.pathSegments.first == 'carRental' && idCar != null) {
        injection.getIt<NavigationService>().navigatorKey.currentState?.pushNamed(
          RoutesName.carDetailView,
          arguments: {
            'idCar' : idCar
          }
        );
      }
        }, onError: (err) {
      LogUtils.e('Error listening for deep links: $err');
    });
  }

  static void initialize() {
    _instance._initDeepLinkListener();
  }
}
