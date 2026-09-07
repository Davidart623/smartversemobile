import 'package:flutter/material.dart';
import 'package:smartversemobile/app/theme/app_colors.dart';

import 'package:smartversemobile/feautures/auth/presentation/widgets/sheet_action_button.dart';
import 'package:smartversemobile/feautures/auth/presentation/widgets/sheet_close_button.dart';

class ForgotPasswordSheet extends StatelessWidget {
  const ForgotPasswordSheet({super.key});

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: const ForgotPasswordSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SheetCloseButton(),
          const SizedBox(height: 10),
          const Text(
            "Forgot your password?",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.black),
          ),
          const SizedBox(height: 15),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "No problem. Enter your email and we'll send a reset\nlink valid for 15 minutes.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: AppColors.grey700),
            ),
          ),
          const SizedBox(height: 30),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Your email address",
              hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
              prefixIcon: const Icon(Icons.mail_outline, color: AppColors.grey),
              contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade400)),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade400)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: AppColors.primary, width: 1.5)),
            ),
          ),
          const SizedBox(height: 30),
          SheetActionButton(text: "Send reset link", onPressed: () => Navigator.pop(context)),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Remember it? ", style: TextStyle(color: AppColors.black, fontSize: 14)),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Text("Back to sign in", style: TextStyle(color: AppColors.primary, fontSize: 14, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
