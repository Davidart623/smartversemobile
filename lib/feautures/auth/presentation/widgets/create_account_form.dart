import 'package:flutter/material.dart';
import 'package:smartversemobile/feautures/auth/presentation/widgets/auth_submit_button.dart';
import 'package:smartversemobile/feautures/auth/presentation/widgets/auth_text_field.dart';
import 'package:smartversemobile/feautures/auth/presentation/widgets/password_strength_bar.dart';
import 'package:smartversemobile/feautures/auth/presentation/widgets/verification_email_sheet.dart';

class CreateAccountForm extends StatefulWidget {
  const CreateAccountForm({super.key});

  @override
  State<CreateAccountForm> createState() => _CreateAccountFormState();
}

class _CreateAccountFormState extends State<CreateAccountForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleCreateAccount() {
    if (_formKey.currentState?.validate() ?? false) {
      VerificationEmailSheet.show(context, email: _emailController.text);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
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
            label: "Full Name",
            hintText: "Enter your full name",
            controller: _nameController,
            prefixIconPath: 'assets/icons/Icon(account).svg',
          ),
          const SizedBox(height: 20),
          AuthTextField(
            label: "Email Address",
            hintText: "You@example.com",
            controller: _emailController,
            prefixIconData: Icons.mail_outline,
            suffixIconPath: 'assets/images/check_mark.svg',
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
          ValueListenableBuilder<TextEditingValue>(
            valueListenable: _passwordController,
            builder: (context, value, child) {
              return PasswordStrengthBar(password: value.text);
            },
          ),
          const SizedBox(height: 30),
          AuthSubmitButton(text: "Create Account", onTap: _handleCreateAccount),
        ],
      ),
    );
  }
}
