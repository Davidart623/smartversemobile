import 'package:flutter/material.dart';
import 'package:smartversemobile/feautures/dashboard/presentation/screens/home/presentation/screens/kitchen_screen.dart';
import 'package:smartversemobile/feautures/splash_screen.dart';

import '../feautures/dashboard/dashboard_screen.dart';
import '../feautures/onboarding_screen.dart';

class AppRoute {
  static const String splash = '/';
  static const String onboarding = 'onboarding';
  static const String dashboardScreen = 'dashboardScreen';
  static const String kitchenScreen = 'kitchenScreen';


  static final routes = <String, Widget Function(BuildContext)>{
   splash: (context) => SplashScreen(
          onOnboardingFinish: () {},
        ),
   onboarding: (context) => OnboardingScreen(onFinish: (BuildContext context) {
     Navigator.pushReplacementNamed(context, AppRoute.dashboardScreen);
   },),
   dashboardScreen: (context) => const DashboardScreen(),
    kitchenScreen: (context) => const KitchenScreen(),
  };
}