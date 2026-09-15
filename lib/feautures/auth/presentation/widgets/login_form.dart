import 'package:flutter/material.dart';
import 'package:smartversemobile/app/theme/app_colors.dart';
import 'package:smartversemobile/feautures/auth/presentation/widgets/auth_submit_button.dart';
import 'package:smartversemobile/feautures/auth/presentation/widgets/auth_text_field.dart';
import 'package:smartversemobile/feautures/auth/presentation/widgets/forgot_password_sheet.dart';
import 'package:smartversemobile/feautures/dashboard/presentation/widgets/edit_wattage_sheet.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _rememberMe = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleLogin() {
    EditWattageSheet.show(
      context,
      applianceName: "Preview Appliance",
      applianceImage: "assets/images/pick_appliances.png",
      initialWattage: 100,
      onSave: (val) {},
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AuthTextField(
            label: "Email Address",
            hintText: "You@example.com",
            controller: _emailController,
            validator: (value) {
              if (value == null || value.trim().isEmpty) return 'Email is required';
              if (!value.contains('@')) return 'Enter a valid email';
              return null;
            },
          ),
          const SizedBox(height: 20),
          AuthTextField(
            label: "Password",
            hintText: "Min.8 character",
            controller: _passwordController,
            isPassword: true,
            prefixIconData: Icons.lock_outline,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: Checkbox(
                      value: _rememberMe,
                      activeColor: AppColors.primary,
                      shape: const CircleBorder(),
                      side: const BorderSide(color: AppColors.grey),
                      onChanged: (val) {
                        setState(() {
                          _rememberMe = val ?? false;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text("Remember Me", style: TextStyle(fontSize: 13, color: AppColors.black2)),
                ],
              ),
              GestureDetector(
                onTap: () => ForgotPasswordSheet.show(context),
                child: const Text("Forgot Password?", style: TextStyle(color: AppColors.primary, fontSize: 13, fontWeight: FontWeight.w500)),
              ),
            ],
          ),
          const SizedBox(height: 30),
          AuthSubmitButton(text: "Login", onTap: _handleLogin),
        ],
      ),
    );
  }
}
