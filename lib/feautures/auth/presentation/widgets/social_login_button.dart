import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartversemobile/app/theme/app_colors.dart';

class SocialLoginButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final Color backgroundColor;

  const SocialLoginButton({
    super.key,
    required this.onTap,
    required this.text,
    this.backgroundColor = AppColors.googleBgCreate,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 58,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.primary),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icons/google.svg', height: 24, width: 24),
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.black),
            ),
          ],
        ),
      ),
    );
  }
}
