import 'package:flutter/material.dart';
import 'package:smartversemobile/app/theme/app_colors.dart';

class PasswordStrengthBar extends StatelessWidget {
  final String password;

  const PasswordStrengthBar({super.key, required this.password});

  int _calculateStrength() {
    int strength = 0;
    if (password.isEmpty) return 0;
    if (password.contains(RegExp(r'[a-zA-Z]'))) strength++;
    if (password.contains(RegExp(r'[0-9]'))) strength++;

    final hasSpecialChar = password.contains(
      RegExp(r'[!@#$%^&*()_+\-=\[\]{};:,.<>/?\\|`~]'),
    ) ||
        password.contains("'") ||
        password.contains('"');
    if (hasSpecialChar) strength++;

    return strength;
  }

  @override
  Widget build(BuildContext context) {
    int activeBars = _calculateStrength();
    if (password.isEmpty) activeBars = 0;

    Color activeColor = AppColors.grey;
    String strengthText = '';

    if (activeBars == 1) {
      activeColor = Colors.red;
      strengthText = 'Weak';
    } else if (activeBars == 2) {
      activeColor = AppColors.primary;
      strengthText = 'Fair';
    } else if (activeBars == 3) {
      activeColor = AppColors.usagePatternContainerText; // #1D7A4E
      strengthText = 'Strong';
    }

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: List.generate(3, (index) {
                return Expanded(
                  child: Container(
                    height: 4,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: index < activeBars ? activeColor : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                );
              }),
            ),
          ),
          SizedBox(
            width: 45,
            child: Text(
              strengthText,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: activeColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
