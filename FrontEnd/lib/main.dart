import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_car/application/di/injection.dart';
import 'package:rental_car/application/utils/colors_utils.dart';

import 'application/routes/routes.dart';
import 'application/routes/routes_name.dart';

Injection injection = Injection();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  injection.configDependencies();
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
        initialRoute: RoutesName.auth,
        onGenerateRoute: Routes.routeBuilder,
      ),
    );
  }
}
