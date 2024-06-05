import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_car/application/di/injection.dart';
import 'package:rental_car/application/services/location_service.dart';
import 'package:rental_car/application/utils/colors_utils.dart';
import 'package:rental_car/domain/model/environment.dart';
import 'application/services/local_notification_service.dart';
import 'firebase_options.dart';
import 'application/routes/routes.dart';
import 'application/routes/routes_navigator.dart';

final injection = Injection();
final navigatorKey = GlobalKey<NavigatorState>();
late List<CameraDescription> cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: Environment.fileName);
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  injection.configDependencies();
  await LocalNotificationService().init();
  await LocationService().init();
  cameras = await availableCameras();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Rental Car',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: ColorUtils.whiteColor,
          ),
          fontFamily: 'OpenSans',
          useMaterial3: true,
        ),
        navigatorKey: navigatorKey,
        onGenerateRoute: Routes.routeBuilder,
        routes: RoutesNavigator.routes(),
      ),
    );
  }
}
