import 'package:flutter/material.dart';
import 'package:smartversemobile/app/theme/app_colors.dart';

class SheetOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SheetOutlinedButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Color(0xFF2D5A9E)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: onPressed,
        child: Text(text, style: const TextStyle(color: AppColors.black, fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
