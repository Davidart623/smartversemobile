import 'package:flutter/material.dart';
import 'package:smartversemobile/app/theme/app_colors.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: AppColors.textColor2, thickness: 1)),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text("Or   Email", style: TextStyle(color: AppColors.grey, fontSize: 14)),
        ),
        const Expanded(child: Divider(color: AppColors.textColor2, thickness: 1)),
      ],
    );
  }
}
