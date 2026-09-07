import 'package:flutter/material.dart';
import 'package:smartversemobile/app/theme/app_colors.dart';
import 'package:smartversemobile/feautures/auth/presentation/widgets/auth_logo_text.dart';
import 'package:smartversemobile/feautures/auth/presentation/widgets/auth_redirect_text.dart';
import 'package:smartversemobile/feautures/auth/presentation/widgets/auth_title.dart';
import 'package:smartversemobile/feautures/auth/presentation/widgets/login_form.dart';
import 'package:smartversemobile/feautures/auth/presentation/widgets/or_divider.dart';
import 'package:smartversemobile/feautures/auth/presentation/widgets/social_login_button.dart';
import 'package:smartversemobile/feautures/auth/presentation/widgets/terms_and_conditions_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            const AuthLogoText(),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), 
                  color: AppColors.white2,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AuthTitle(title: "LOGIN", subtitle: "Welcome back to your account."),
                    const SizedBox(height: 30),
                    SocialLoginButton(
                      onTap: () {},
                      text: "Continue with Google",
                      backgroundColor: AppColors.googleBgLogin,
                    ),
                    const SizedBox(height: 30),
                    const OrDivider(),
                    const SizedBox(height: 30),
                    const LoginForm(),
                    const SizedBox(height: 30),
                    AuthRedirectText(
                      text: "Don't have an account? ",
                      actionText: "Create Account",
                      onTap: () => Navigator.pushNamed(context, '/create_account'),
                    ),
                    const SizedBox(height: 20),
                    const TermsAndConditionsText(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
