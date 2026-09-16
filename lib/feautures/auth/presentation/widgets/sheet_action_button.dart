import 'package:flutter/material.dart';
import 'package:smartversemobile/app/theme/app_colors.dart';

class SheetActionButton extends StatelessWidget {
  final String text;
  final Widget? icon;
  final VoidCallback onPressed;

  const SheetActionButton({super.key, required this.text, this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: onPressed,
        child: icon != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon!,
                  const SizedBox(width: 8),
                  Text(text, style: const TextStyle(color: AppColors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              )
            : Text(text, style: const TextStyle(color: AppColors.white, fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
