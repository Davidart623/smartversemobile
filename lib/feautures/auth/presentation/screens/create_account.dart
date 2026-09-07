import 'package:flutter/material.dart';
import 'package:smartversemobile/app/theme/app_colors.dart';
import 'package:smartversemobile/feautures/auth/presentation/widgets/auth_logo_text.dart';
import 'package:smartversemobile/feautures/auth/presentation/widgets/auth_redirect_text.dart';
import 'package:smartversemobile/feautures/auth/presentation/widgets/auth_title.dart';
import 'package:smartversemobile/feautures/auth/presentation/widgets/create_account_form.dart';
import 'package:smartversemobile/feautures/auth/presentation/widgets/or_divider.dart';
import 'package:smartversemobile/feautures/auth/presentation/widgets/social_login_button.dart';
import 'package:smartversemobile/feautures/auth/presentation/widgets/terms_and_conditions_text.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

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
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), 
                  color: AppColors.white2,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AuthTitle(title: "CREATE YOUR\nACCOUNT", subtitle: "Get the right event within minutes"),
                    const SizedBox(height: 30),
                    SocialLoginButton(onTap: () {}, text: "Continue with Google"),
                    const SizedBox(height: 18),
                    const OrDivider(),
                    const SizedBox(height: 18),
                    const CreateAccountForm(),
                    const SizedBox(height: 30),
                    AuthRedirectText(
                      text: "Already have an account? ",
                      actionText: "Login",
                      onTap: () => Navigator.pushNamed(context, '/login'),
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
