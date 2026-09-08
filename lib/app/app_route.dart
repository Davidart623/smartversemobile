import 'package:flutter/material.dart';
import 'package:smartversemobile/feautures/dashboard/presentation/screens/home/presentation/screens/kitchen_screen.dart';
import 'package:smartversemobile/feautures/splash_screen.dart';
import 'package:smartversemobile/feautures/auth/presentation/screens/create_account.dart';
import 'package:smartversemobile/feautures/auth/presentation/screens/create_account_success.dart';
import 'package:smartversemobile/feautures/auth/presentation/screens/login_screen.dart';

import '../feautures/dashboard/dashboard_screen.dart';
import '../feautures/onboarding_screen.dart';

class AppRoute {
  static const String splash = '/';
  static const String onboarding = 'onboarding';
  static const String dashboardScreen = 'dashboardScreen';
  static const String kitchenScreen = 'kitchenScreen';
  static const String createAccount = '/create_account';
  static const String createAccountSuccess = '/create_account_success';
  static const String login = '/login';

  static final routes = <String, Widget Function(BuildContext)>{
   splash: (context) => SplashScreen(
          onOnboardingFinish: () {},
        ),
   onboarding: (context) => OnboardingScreen(onFinish: (BuildContext context) {
     Navigator.pushReplacementNamed(context, AppRoute.createAccount);
   },),
   dashboardScreen: (context) => const DashboardScreen(),
   kitchenScreen: (context) => const KitchenScreen(),
   createAccount: (context) => const CreateAccount(),
   createAccountSuccess: (context) => const CreateAccountSuccess(),
   login: (context) => const LoginScreen(),
  };
}