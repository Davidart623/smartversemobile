import 'package:flutter/material.dart';
import 'app/app_route.dart';
import 'feautures/splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(357, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Smartvert',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorSchemeSeed: const Color(0xFFF2790A),
          useMaterial3: true,
        ),
        initialRoute: AppRoute.splash,
        routes: AppRoute.routes,
      ),
    );
  }
}