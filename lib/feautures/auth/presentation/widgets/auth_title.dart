import 'package:flutter/material.dart';
import 'package:smartversemobile/app/theme/app_colors.dart';
import 'package:smartversemobile/core/widgets/m_text.dart';

class AuthTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const AuthTitle({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MText(
          inputText: title,
          size: 28,
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 5),
        MText(
          inputText: subtitle,
          size: 14,
          textColor: AppColors.black2,
          weight: FontWeight.w400,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
