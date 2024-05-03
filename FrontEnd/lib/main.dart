import 'package:flutter/material.dart';
import 'package:rental_car/application/di/injection.dart';
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
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          fontFamily: 'OpenSans',
          useMaterial3: true,
        ),
        initialRoute: RoutesName.auth,
        onGenerateRoute: Routes.routeBuilder,
      ),
    );
  }
}