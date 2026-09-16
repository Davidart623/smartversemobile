import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartversemobile/app/theme/app_colors.dart';

import 'package:smartversemobile/feautures/auth/presentation/widgets/sheet_action_button.dart';
import 'package:smartversemobile/feautures/auth/presentation/widgets/sheet_close_button.dart';
import 'package:smartversemobile/feautures/auth/presentation/widgets/sheet_outlined_button.dart';

import 'forgot_password_sheet.dart';

class IncorrectPasswordSheet extends StatelessWidget {
  final String email;

  const IncorrectPasswordSheet({super.key, required this.email});

  static void show(BuildContext context, {required String email}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => IncorrectPasswordSheet(email: email),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SheetCloseButton(),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(color: Colors.red.withOpacity(0.15), blurRadius: 25, spreadRadius: 5),
              ],
            ),
            child: SvgPicture.asset('assets/images/incorrect_password_box.svg', height: 120, width: 120),
          ),
          const SizedBox(height: 15),
          const Text("Incorrect password", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.black)),
          const SizedBox(height: 10),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: const TextStyle(fontSize: 14, color: AppColors.black2),
              children: [
                const TextSpan(text: "The password you entered for "),
                TextSpan(text: email, style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w500)),
                const TextSpan(text: " is\nincorrect."),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.circle, size: 8, color: Colors.red),
              const SizedBox(width: 4),
              Icon(Icons.circle, size: 8, color: Colors.grey.shade400),
              const SizedBox(width: 4),
              Icon(Icons.circle, size: 8, color: Colors.grey.shade400),
              const SizedBox(width: 4),
              Icon(Icons.circle, size: 8, color: Colors.grey.shade400),
              const SizedBox(width: 4),
              Icon(Icons.circle, size: 8, color: Colors.grey.shade400),
              const SizedBox(width: 10),
              const Text("4 attempts left", style: TextStyle(color: AppColors.primary, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFD),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFF2D5A9E).withOpacity(0.3)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.check_circle_outline, size: 16, color: Color(0xFF2D5A9E)),
                    const SizedBox(width: 8),
                    const Text("Common causes", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2D5A9E), fontSize: 13)),
                  ],
                ),
                const SizedBox(height: 8),
                _buildCause("Caps Lock is on"),
                _buildCause("You used a different password for this email"),
                _buildCause("There's a typo in your password"),
              ],
            ),
          ),
          const SizedBox(height: 25),
          SheetActionButton(text: "Try Again", onPressed: () => Navigator.pop(context)),
          const SizedBox(height: 15),
          SheetOutlinedButton(
            text: "Reset Password",
            onPressed: () {
              Navigator.pop(context);
              ForgotPasswordSheet.show(context, initialEmail: email);
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildCause(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(" · ", style: TextStyle(color: Color(0xFF2D5A9E), fontWeight: FontWeight.bold)),
          Expanded(child: Text(text, style: const TextStyle(color: Color(0xFF2D5A9E), fontSize: 12))),
        ],
      ),
    );
  }
}
