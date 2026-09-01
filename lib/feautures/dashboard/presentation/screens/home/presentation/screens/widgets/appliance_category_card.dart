import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../app/theme/app_colors.dart';
import '../../../../../../../../core/widgets/m_text.dart';

class ApplianceCategoryCard extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String subtitle;

  const ApplianceCategoryCard({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.appliancesContainer,
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(color: const Color(0x1A2D5A9E), width: 1.1.w),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 28.w,
              height: 28.h,
              child: Image.asset(imageAsset, fit: BoxFit.contain),
            ),
            SizedBox(height: 6.h),
            MText(
              inputText: title,
              textColor: AppColors.appliancestext,
              weight: FontWeight.w700,
              size: 14.spMin,
              family: "Montserrat",
            ),
            SizedBox(height: 4.h),
            MText(
              inputText: subtitle,
              textColor: AppColors.appliancestext2,
              weight: FontWeight.w400,
              size: 13.spMin,
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
