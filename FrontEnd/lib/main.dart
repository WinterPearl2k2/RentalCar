import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rental_car/application/di/injection.dart';
import 'package:rental_car/application/services/location_service.dart';
import 'package:rental_car/application/utils/colors_utils.dart';
import 'package:rental_car/presentation/views/auth/auth_view.dart';
import 'package:rental_car/presentation/views/bottom_navigation/bottom_navigaton_view.dart';
import 'package:rental_car/presentation/views/change_password/change_password_view.dart';
import 'package:rental_car/presentation/views/forgot_password/forgot_password_view.dart';
import 'application/routes/routes.dart';
import 'application/routes/routes_name.dart';
import 'application/routes/routes_navigator.dart';
import 'application/services/local_notification_service.dart';
import 'firebase_options.dart';

final injection = Injection();
final navigatorKey = GlobalKey<NavigatorState>();
late List<CameraDescription> cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = GoRouter(
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        name: 'Auth view',
        path: RoutesName.auth,
        builder: (context, state) => const AuthView(),
      ),
      GoRoute(
        name: 'Forgot password',
        path: RoutesName.forgotPassword,
        builder: (context, state) => const ForgotPasswordView(),
      ),
      GoRoute(
        name: 'Bottom nav',
        path: RoutesName.bottomNavigation,
        builder: (context, state) => const BottomNavigationView(),
      ),
      GoRoute(
        name: 'Change password',
        path: RoutesName.changePassword,
        builder: (context, state) => const ChangePasswordView(),
      ),
    ],
  );

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
        // routerConfig:_router,
        navigatorKey: navigatorKey,
        onGenerateRoute: Routes.routeBuilder,
        routes: RoutesNavigator.routes(),
      ),
    );
  }
}
