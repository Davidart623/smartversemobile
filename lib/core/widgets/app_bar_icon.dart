import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';



class AppbarIcon extends StatelessWidget {
  final String assetPath;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final double? imageWidth;
  final double? imageHeight;

  const AppbarIcon({
    super.key,
    this.assetPath = "assets/icons/arrow_left_fill.svg",
    this.onTap,
    this.width,
    this.height,
    this.imageWidth,
    this.imageHeight,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => Navigator.pop(context),
      child: Container(
        width: width ?? 48.w,
        height: height ?? 48.h,
        decoration: BoxDecoration(
          color: Color(0xffF8FAFD),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Center(
          child: SvgPicture.asset(
            assetPath,
            width: imageWidth ?? 24.w,
            height: imageHeight ?? 24.h,
          ),
        ),
      ),
    );
  }
}