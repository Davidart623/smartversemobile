import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app/app_route.dart';
import 'core/network/token_storage.dart';

import 'feautures/dashboard/data/repository/appliance_repository.dart';
import 'feautures/dashboard/data/repository/calculation_repository.dart';
import 'feautures/dashboard/presentation/bloc/appliance_cubit.dart';
import 'feautures/dashboard/presentation/bloc/calculation_cubit.dart';

void main() {

  TokenStorage.instance.setTokens(
    accessToken:  "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJheW9vbGFvZHVsYWphQGdtYWlsLmNvbSIsImlhdCI6MTc4OTQxMjkwMSwiZXhwIjoxNzg5NDk5MzAxfQ.HsNoJSl9hd9Fi3qrdcKPvBzYD6UiE8XDXptrp9X5LocTf4CXuEBCRLFxEB7ThoY10ClwN2PhppxcFIIYUXKHuQ",
    refreshToken:"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJheW9vbGFvZHVsYWphQGdtYWlsLmNvbSIsImlhdCI6MTc4OTQxMjkwMSwiZXhwIjoxNzkwMDE3NzAxfQ.vdnSswZwi9OBkDjH4qOXVPph-9gVGTSBX84M5jaxczlXXuT3jTZ6uikZhoYC67TZP9QrKjExL0tqxmNtvZp3MA",
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers:[
      BlocProvider(create: (_) => ApplianceCubit(ApplianceRepository())..loadAppliances(),),
      BlocProvider(create: (_) => CalculationCubit(CalculationRepository())),
      ],
      child: ScreenUtilInit(
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
      ),
    );
  }
}