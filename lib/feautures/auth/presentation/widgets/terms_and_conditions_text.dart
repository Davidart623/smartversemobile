import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smartversemobile/app/theme/app_colors.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: "By continuing, you agree to our ",
          style: const TextStyle(color: AppColors.grey700, fontSize: 14),
          children: [
            TextSpan(
              text: "Terms of\nService",
              style: const TextStyle(color: AppColors.primary),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
            const TextSpan(text: " and "),
            TextSpan(
              text: "Privacy Policy",
              style: const TextStyle(color: AppColors.primary),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
            const TextSpan(text: "."),
          ],
        ),
      ),
    );
  }
}
