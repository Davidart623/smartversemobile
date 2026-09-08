import 'package:flutter/material.dart';
import 'package:smartversemobile/app/theme/app_colors.dart';

class SheetCloseButton extends StatelessWidget {
  const SheetCloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(color: Colors.grey.shade200, shape: BoxShape.circle),
          child: const Icon(Icons.close, size: 20, color: AppColors.black2),
        ),
      ),
    );
  }
}
