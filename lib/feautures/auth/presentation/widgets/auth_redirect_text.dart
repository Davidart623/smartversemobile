import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smartversemobile/app/theme/app_colors.dart';

class AuthRedirectText extends StatelessWidget {
  final String text;
  final String actionText;
  final VoidCallback onTap;

  const AuthRedirectText({
    super.key,
    required this.text,
    required this.actionText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: text,
          style: const TextStyle(color: AppColors.black, fontSize: 16, fontWeight: FontWeight.w500),
          children: [
            TextSpan(
              text: actionText,
              style: const TextStyle(
                color: AppColors.appliancestext2,
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.navColor,
                decorationThickness: 2,
              ),
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
          ],
        ),
      ),
    );
  }
}
