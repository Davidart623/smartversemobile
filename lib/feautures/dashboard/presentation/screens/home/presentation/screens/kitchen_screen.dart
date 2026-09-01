import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartversemobile/core/widgets/app_bar_icon.dart';
import 'package:smartversemobile/core/widgets/m_text.dart';
import 'package:smartversemobile/core/widgets/search_text_field.dart';

import '../../../../../../../app/theme/app_colors.dart';

class KitchenScreen extends StatefulWidget {
  const KitchenScreen({super.key});

  @override
  State<KitchenScreen> createState() => _KitchenScreenState();
}

class _KitchenScreenState extends State<KitchenScreen> {
  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      body: Column(
        children: [
          SafeArea(
            bottom: false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 55.h),

                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: AppbarIcon(),
                      ),

                      MText(
                        inputText: "KITCHEN",
                        textColor: AppColors.textColor,
                        weight: FontWeight.w600,
                        size: 16.spMin,
                      ),
                    ],
                  ),

                  SizedBox(height: 23.h),

                  SearchTextField(search: search),

                  SizedBox(height: 18.h),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 16.h),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.kitchen,
              ),
              
            ),
          ),
        ],
      ),
    );
  }
}