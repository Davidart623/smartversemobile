import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';



class MText extends StatelessWidget {
  const MText({
    super.key,
    required this.inputText, this.family, this.size, this.weight, this.textColor, this.textAlign, this.textStyle,
  });

  final String inputText;
  final String? family;
  final double? size;
  final FontWeight? weight;
  final Color? textColor;
  final TextAlign  ? textAlign;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(inputText,
      textAlign: textAlign??.center,
      style: textStyle ?? TextStyle(fontSize: size ?? 32, fontWeight: weight ?? FontWeight.w700, color: textColor ?? AppColors.textColor, fontFamily: family ?? "Inter",),);
  }
}