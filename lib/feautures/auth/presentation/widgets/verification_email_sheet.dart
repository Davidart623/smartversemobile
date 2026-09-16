import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartversemobile/app/theme/app_colors.dart';
import 'package:smartversemobile/core/di/service_locator.dart';
import 'package:smartversemobile/feautures/auth/presentation/cubit/resend_verification_cubit.dart';
import 'package:smartversemobile/feautures/auth/presentation/cubit/resend_verification_state.dart';

import 'package:smartversemobile/feautures/auth/presentation/widgets/sheet_action_button.dart';
import 'package:smartversemobile/feautures/auth/presentation/widgets/sheet_close_button.dart';
import 'package:smartversemobile/feautures/auth/presentation/widgets/sheet_outlined_button.dart';

class VerificationEmailSheet extends StatelessWidget {
  final String email;

  const VerificationEmailSheet({super.key, required this.email});

  static void show(BuildContext context, {required String email}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider(
        create: (_) => ResendVerificationCubit(getIt()),
        child: VerificationEmailSheet(email: email),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResendVerificationCubit, ResendVerificationState>(
      listener: (context, state) {
        if (state is ResendVerificationSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Verification email resent')),
          );
        } else if (state is ResendVerificationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is ResendVerificationLoading;
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
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F4F8),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFF2D5A9E).withOpacity(0.3)),
                  boxShadow: [
                    BoxShadow(color: const Color(0xFF2D5A9E).withOpacity(0.1), blurRadius: 20, spreadRadius: 5),
                  ],
                ),
                child: const Center(
                  child: Icon(Icons.mail_outline, size: 35, color: Color(0xFF2D5A9E)),
                ),
              ),
              const SizedBox(height: 20),
              const Text("Check your inbox", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.black)),
              const SizedBox(height: 5),
              const Text("We sent a verification link to", style: TextStyle(fontSize: 14, color: AppColors.grey700)),
              const SizedBox(height: 5),
              Text(email, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.primary)),
              const SizedBox(height: 25),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F7F7),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  children: [
                    _buildStep(
                      icon: const Icon(Icons.check, size: 16, color: Colors.white),
                      iconBgColor: AppColors.greenColor,
                      text: "Open the email from Smartvert",
                    ),
                    const SizedBox(height: 15),
                    _buildStep(
                      icon: const Text("2", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.grey700)),
                      iconBgColor: Colors.grey.shade300,
                      text: 'Tap the "Verify my account" link',
                    ),
                    const SizedBox(height: 15),
                    _buildStep(
                      icon: const Text("3", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.grey700)),
                      iconBgColor: Colors.grey.shade300,
                      text: "You'll be brought back automatically",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              const Text("Can't find it? Check your spam folder.", style: TextStyle(fontSize: 12, color: AppColors.grey700)),
              const SizedBox(height: 25),
              SheetActionButton(
                text: "I've verified — Continue",
                icon: const Icon(Icons.check, color: Colors.white, size: 18),
                onPressed: () => Navigator.pop(context),
              ),
              const SizedBox(height: 15),
              SheetOutlinedButton(
                text: isLoading ? "Sending..." : "Resend verification email",
                onPressed: isLoading
                    ? () {}
                    : () => context.read<ResendVerificationCubit>().resend(email: email),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStep({required Widget icon, required Color iconBgColor, required String text}) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(color: iconBgColor, shape: BoxShape.circle),
          child: Center(child: icon),
        ),
        const SizedBox(width: 15),
        Expanded(child: Text(text, style: const TextStyle(fontSize: 13, color: AppColors.black))),
      ],
    );
  }
}