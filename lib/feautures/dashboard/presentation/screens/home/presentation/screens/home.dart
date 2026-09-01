import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartversemobile/app/app_route.dart';
import 'package:smartversemobile/app/theme/app_colors.dart';
import 'package:smartversemobile/core/widgets/m_text.dart';
import 'package:smartversemobile/core/widgets/search_text_field.dart';
import 'package:smartversemobile/feautures/dashboard/presentation/screens/home/presentation/screens/widgets/appliance_category_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 69.h),
                MText(
                  inputText: "Build Your Load",
                  size: 16.spMin,
                  weight: FontWeight.w600,
                  textColor: AppColors.textColor,
                ),
                SizedBox(height: 24.h),
                SearchTextField(search: search),
                SizedBox(height: 24.h),
                Container(
                  width: 361.w,
                  height: 118.h,
                  decoration: BoxDecoration(
                    color: AppColors.appliancestext2,
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                ),
                SizedBox(height: 24.h),
                Container(
                  width: 176.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: Center(
                    child: MText(
                      inputText: "ALL APPLIANCES",
                      size: 16.spMin,
                      weight: FontWeight.w700,
                      textColor: AppColors.main,
                    ),
                  ),
                ),
                SizedBox(height: 17.h),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 22.w,
                  mainAxisSpacing: 33.h,
                  childAspectRatio: 170 / 150,
                  children: [
                    const ApplianceCategoryCard(imageAsset: "assets/images/🛋️.png", title: "Living Room", subtitle: "TV, fans, decoder…",),
                    GestureDetector(
                        onTap: (){
                               Navigator.pushNamed(context, AppRoute.kitchenScreen);
                        },
                        child: const ApplianceCategoryCard(imageAsset: "assets/images/🍳.png", title: "Kitchen", subtitle: "Fridge, microwave, iron...",)),
                    const ApplianceCategoryCard(imageAsset: "assets/images/🛏️.png", title: "Bedroom", subtitle: "Fan, bulbs, laptop...",),
                    const ApplianceCategoryCard(imageAsset: "assets/images/💼.png", title: "Office", subtitle: "AC, PC, printer...",),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
