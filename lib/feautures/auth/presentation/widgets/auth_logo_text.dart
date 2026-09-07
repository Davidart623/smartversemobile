import 'package:flutter/material.dart';
import 'package:smartversemobile/app/theme/app_colors.dart';

class AuthLogoText extends StatelessWidget {
  const AuthLogoText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        "Smartvert",
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: AppColors.appliancestext,
        ),
      ),
    );
  }
}
